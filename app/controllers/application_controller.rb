class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # around_filter :catch_exceptions
  protect_from_forgery with: :null_session
  layout :choose_layout

  rescue_from CanCan::AccessDenied do |exception|
  redirect_to root_url, :alert => exception.message
  end

	def check_admin
		if !current_user.is_admin?
			flash[:error] = "You are not Admin."
			redirect_to root_url
		end
	end

	def choose_layout
		if current_user
			return 'application'
		else
			return 'public_layout'
		end
	end

  def allowed_projects
    # current_user.system_admin? ? Project.all : current_user.company.projects
  end

  def visible_users
    current_user.system_admin? ? User.all : current_user.company.users
  end


  # protected
  #   def catch_exceptions
  #     yield
	 #    rescue => exception
	 #      if exception.is_a?(ActionController::RoutingError)
	 #        render file: "welcome/page_not_found"

	 #      else
	 #        render "error "
	        
	 #      end
  #   end

end

 


    