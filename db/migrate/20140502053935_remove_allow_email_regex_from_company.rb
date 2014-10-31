class RemoveAllowEmailRegexFromCompany < ActiveRecord::Migration
  def change
    remove_column :companies, :allow_email_regex, :string
  end
end
