class AddPTypeToPerferance < ActiveRecord::Migration
  def change
    add_column :perferances, :p_type, :string
  end
end
