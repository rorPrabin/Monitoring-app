class ApiController < ApplicationController
  before_filter :restrict_access
  skip_before_filter  :verify_authenticity_token

  respond_to :json

  # append_view_path "#{Rails.root}/app/views" # you have to specify your views location as well

  def restrict_access
    @api_project = Project.find_by_token(params[:project_token])
    @api_user = User.find_by_token(params[:user_token])
    unless params[:project_token] && @api_project && params[:user_token] && @api_user
      render :json =>{:msg => "invalid_credentials"}, :status => 401
    end
  end
  
end
