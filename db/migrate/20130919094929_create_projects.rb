class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :url
      t.integer :interval
      t.references :user, index: true

      t.timestamps
    end

  end
end
