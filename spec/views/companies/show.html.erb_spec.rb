require 'spec_helper'

describe "companies/show" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :name => "Name",
      :address => "Address",
      :allow_email_regex => "Allow Email Regex",
      :url => "Url"
    ))
  end

  # it "renders attributes in <p>" do
  #   render
  #   # Run the generator again with the --webrat flag if you want to use webrat matchers
  #   expect(rendered).to match(/Name/)
  #   expect(rendered).to match(/Address/)
  #   expect(rendered).to match(/Allow Email Regex/)
  #   expect(rendered).to match(/Url/)
  # end
end
