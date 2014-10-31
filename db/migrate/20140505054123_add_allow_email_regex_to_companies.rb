class AddAllowEmailRegexToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :allow_email_regex, :boolean, :default => false
  end
end
