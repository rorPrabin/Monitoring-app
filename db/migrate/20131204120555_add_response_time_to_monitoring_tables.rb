class AddResponseTimeToMonitoringTables < ActiveRecord::Migration
  def change
    add_column :monitoring_tables, :response_time, :float
  end
end
