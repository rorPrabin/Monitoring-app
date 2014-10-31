module Api
	class MetricsController < ApiController
    def create
      @api_response = ApiProjectResponse.new
      @api_response.project_id = @api_project.id
      @api_response.params = params[:params]
      @api_response.status_code = params[:status].to_i
      @api_response.view_runtime = params[:view_runtime].to_f
      @api_response.db_runtime = params[:db_runtime].to_f
      @api_response.save!
      render :json =>{:msg => "API Project Response saved"}, :status => 200
    end
	end
end