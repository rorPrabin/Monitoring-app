require 'spec_helper'

describe "companies/index" do
  before(:each) do
    assign(:companies, [
      stub_model(Company,
        :name => "Name",
        :address => "Address",
        :allow_email_regex => "Allow Email Regex",
        :url => "Url"
      ),
      stub_model(Company,
        :name => "Name",
        :address => "Address",
        :allow_email_regex => "Allow Email Regex",
        :url => "Url"
      )
    ])
  end

  it "renders a list of companies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Allow Email Regex".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
