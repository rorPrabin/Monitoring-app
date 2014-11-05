require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!



describe "View User profile", js: true  do
  describe "check wheather project exit or not" do

    it "should not display project if not exit" do
      @user = FactoryGirl.create(:user)
      @project = FactoryGirl.build(:project)
      visit "/"
      click_link_or_button "Login"
      fill_in "Email", with: @user.email
      fill_in "Password", with: "foobar123"
      click_link_or_button "Sign in"
      within '.nav.navbar-nav.navbar-right' do
        click_link_or_button "Example User"
      end
      sleep(1)
      click_link_or_button "My Profile"

      expect(page).to have_selector("h3", text: "No project has been assigned to #{@user.first_name}.")
      User.count.should be(1)
      Project.count.should be nil
      @user.company_admin.should == false
      @user.admin.should == false
      # @user = User.find(params[:id])

    end

    it "should display project if exit" do
      @project = FactoryGirl.create(:project)

      visit "/"
      click_link_or_button "Login"
      fill_in "Email", with: User.first.email
      fill_in "Password", with: "foobar123"
      click_link_or_button "Sign in"
      within '.nav.navbar-nav.navbar-right' do
        click_link_or_button "Example User"
      end
      sleep(1)
      click_link_or_button "My Profile"

      User.count.should be(1)
      Project.count.should be(1)
    end

  end
    
end