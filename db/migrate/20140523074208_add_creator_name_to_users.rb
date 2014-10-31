class AddCreatorNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :creator_name, :string
  end
end
