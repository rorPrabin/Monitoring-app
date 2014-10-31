class RemoveIntervalFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :interval, :integer
  end
end
