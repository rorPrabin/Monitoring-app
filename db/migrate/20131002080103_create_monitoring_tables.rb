class CreateMonitoringTables < ActiveRecord::Migration
  def change
    create_table :monitoring_tables do |t|
      t.integer :project_id
      t.string :project_url
      t.string :project_status

      t.timestamps
    end
  end
end
