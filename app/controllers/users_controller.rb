class UsersController < ApplicationController
	before_filter :authenticate_user!
  before_filter :check_admin, only: [:new, :index, :create, :destroy, :show]
  before_filter :check_own_account, only: [:edit, :update, :destroy]
  before_filter :load_user_and_company
  
# @users = User.order(:name).page params[:page]
  
  def index
    @users = visible_users.page params[:page]
    @users_act = User.all
  end

  def show
  	@user = User.find(params[:id])
    @u_projects = Kaminari.paginate_array(@user.associations.to_a).page(params[:page]).per(5)
    #review @members = current_user.company.users.where( "id != ? AND confirmed_at != ?", current_user.id, 'nil')
  end

  def account
  	@user = current_user    
    @u_projects = Kaminari.paginate_array(@user.projects.to_a).page(params[:page]).per(5)
  	render 'show'
  end

  def edit
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	# @user = User.new(params[:user].permit(:first_name, :last_name,  :email, :password, :password_confirmation, :admin, :company_admin))
    current_user.role = 'admin'
    @user = User.new(params[:user].permit(:first_name, :last_name,  :email, :role))
    @generated_password = Devise.friendly_token.first(8)
    @user.password = @generated_password && @user.password_confirmation = @generated_password
    @user.company = Company.find(params[:company_id]) if params[:company_id]  
    @user.creator_id = @current_user.id
    @user.creator_name = @current_user.first_name
   
  	if @user.save
      @user.track_user_activity("added a new user")
      UserMailer.choose_password(@user, @generated_password).deliver
  		redirect_to my_company_path
  	else
  		render 'new'
  	end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(params[:user].permit!)
      @user.track_user_activity("made change(s) to the user")
  		redirect_to @user.company
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@user = User.find(params[:id])
  	if @user.destroy
      @user.track_user_activity("deleted the user")
  		flash[:success] = "User Deleted."
  	end
    redirect_to my_company_path
  	#r redirect_to users_path
  end

  def set_time
    @perferance = current_user.perferances.where(:p_type => "Time").first
    if @perferance
      @perferance.update_attributes(:duration => params[:time])
      redirect_to :root
    else
      @perferance = Perferance.new(:user => current_user, :duration => params[:time], :p_type => "Time")
      if @perferance.save
        redirect_to :root
      end
    end
  end

  private

  def load_user_and_company
    begin
      @user = User.find(params[:id]) if params[:id]
      @company = Company.find(params[:company_id]) if params[:company_id]
      
    rescue ActiveRecord::RecordNotFound  
      respond_to do |format|
      format.html { redirect_to users_path, notice: "Record not found." }
      format.json { head :no_content }
      end
    end
  end

  def check_own_account
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound  
      redirect_to :controller => "users", :action => "index"
    end
    
    if @user == current_user || current_user.is_admin?
    else
      flash[:error] = "You can not edit other users account."
      redirect_to root_url
    end
  end
  
end
