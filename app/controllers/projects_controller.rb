require 'time'
require 'digest/sha1'

class ProjectsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :load_user_and_project
	after_filter :rerun_scheduler, :only =>[:create]
	load_and_authorize_resource except: [:create]

	def company_project
		@user = current_user
		@projects = current_user.projects.page params[:page]
	end

	def new
		@project = Project.new
		@members = current_user.company.users.where( "id != ? AND confirmed_at != ?", current_user.id, 'nil')
	end

	def create  #NEEDS REFACTORING TOO LONG AND TOO COMPLICATED
		@user = current_user
		@project = @user.projects.build(project_params)
		@project.member_ids = params[:project][:member_ids]
		url = PingTester.new(@project.url)
		status, time = url.call_url
		response = url.track_once
		@project.status = response
		if status == :invalid
			MonitoringMailer.site_down(@project).deliver
		end
		@project.company = current_user.company
		if @project.save
			@project.track_project_activity("created a new project")
			MonitoringTable.create(:project_url =>@project.url, :project_status => response, :project_id => @project.id, :response_time => time )
			flash[:success] = "New project created successfully."
			# redirect_to user_project_path(@user, @project)
			redirect_to my_project_path
		else
			@members = current_user.company.users.where( "id != ? AND confirmed_at != ?", current_user.id, 'nil')
			render 'new'
		end
	end

	def show
		@project = Project.find(params[:id])

		sleep(1)
		if check_status(@project)
			@monitoring_data = @project.monitoring_tables.where(:response_time => nil)
		else
			@monitoring_data = @project.monitoring_tables
		end
	end

	def index
		@user = current_user
		@projects = allowed_projects
		@pros = Project.all
	end

	def edit
		@members = current_user.company.users.where( "id != ? AND confirmed_at != ?", current_user.id, 'nil')
		@project = Project.find(params[:id])
	end

	def update
		@user = current_user
		@project.member_ids = params[:project][:member_ids]
		respond_to do |format|
			if @project.update(params[:project].permit(:name, :url,  :owner_id,  :member_ids))
				@project.track_project_activity("updated the project ")
				format.html { redirect_to my_project_path, notice: "Project was successfully update." }
			else
				@members = current_user.company.users.where("id != ?", current_user.id)
				format.html { render 'edit'}
			end
		end	
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to user_projects_path(@user)
	end

	def rerun_scheduler
		load 'config/initializers/task_scheduler.rb'
	end

	def monitortable
		@monitors = MonitoringTable.all
		render :partial => "projects/monitor_table"
	end

	def generate_token
		@user = current_user
		@project = Project.find(params[:project_id])
		unless @project.token.present?
			project_token = Digest::SHA256.new
			project_token.update(Time.now.to_s)
			@project.token = project_token.hexdigest.slice(0..14)
			@project.save!
		end
		unless @user.token.present?
			user_token = Digest::SHA256.new
			user_token.update(Time.now.to_s)
			@user.token = user_token.hexdigest.slice(0..14)
			@user.save!
		end
		redirect_to user_project_path(@user, @project)
	end

	private
	def project_params
		params.require(:project).permit(:name, :url,  members_attributes: [:id])
	end

	def load_user_and_project
		begin
			@user = User.find(params[:user_id]) if params[:user_id]
			@project = Project.find(params[:id]) if params[:id]
				
		rescue ActiveRecord::RecordNotFound 
			respond_to do |format|
	        format.html { redirect_to my_project_path, notice: "Project not found."}
	        format.json { head :no_content }
	    	end
		end	
	end

	def check_status(project)
		project.monitoring_tables.each do |time|
			if time.response_time.nil?
				@start = time.created_at.to_s(:long)
			end
		end

		last_update = project.monitoring_tables.last

		if last_update.response_time.nil?
			@end = last_update.created_at.to_s(:long)
		else
			@end = Time.now	
		end
	end
	
end