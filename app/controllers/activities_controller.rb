class ActivitiesController < ApplicationController
# after_action :log_update, only: [:create, :update, :destroy]

def update
  
end

def destroy
  
end

protected
  def new
    @activity = Activity.new
  end
  def create
    @activity = Activity.new(activity_params)
  end

	def activity_params
    params.require(:activity).permit(:object_id, :object, :object_type, :activity, :activity_type, :agent_id, :agent)
  end
end
