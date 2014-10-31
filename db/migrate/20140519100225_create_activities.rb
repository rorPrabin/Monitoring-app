class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :object
      t.string :object_type
      t.text :activity
      t.text :activity_type
      t.string :agent
      t.datetime :time_stamp

      t.timestamps
    end
  end
end
