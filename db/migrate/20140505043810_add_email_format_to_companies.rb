class AddEmailFormatToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :email_format, :string
  end
end
