class AddObjectIdToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :object_id, :integer
    add_column :activities, :agent_id, :integer
  end
end
