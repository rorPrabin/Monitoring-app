class CreatePerferances < ActiveRecord::Migration
  def change
    create_table :perferances do |t|
      t.integer :user_id
      t.string :duration

      t.timestamps
    end
  end
end
