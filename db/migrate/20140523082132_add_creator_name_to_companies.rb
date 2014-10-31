class AddCreatorNameToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :creator_name, :string
  end
end
