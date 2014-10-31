class ApiProjectResponse
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :project_id, type: Integer
  field :params, type: String
  field :status_code, type: Integer
  field :view_runtime, type: Float
  field :db_runtime, type: Float
end
