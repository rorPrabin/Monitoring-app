class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :allow_email_regex
      t.string :url

      t.timestamps
    end

  end
end
