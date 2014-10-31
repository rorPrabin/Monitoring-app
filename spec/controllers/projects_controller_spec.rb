require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe ProjectsController, :js => true do
  before :each do
   	@user = FactoryGirl.create(:user)
		login_as(@user, :scope => :user)
    @project = FactoryGirl.create(:project)
  end

  # context "Company projects" do
  #   it "should list all the project belongs to user" do
  #     get :company_project 
  #     @projects = Project.all
  #     expect(response).to eq(200)
  #   end
  # end

  # describe "GET new" do
  # 	it "Assign New projects" do
	 #    visit "/users/#{@user.id}/projects/new"
	 #    within("#new_project") do
  #       fill_in 'Name', :with => "Tutemate"
  #       fill_in 'Url', :with => "http://tutemate.com/"
  #       click_button 'Create Project'
  #     end 
	 #  end
  # end
end
