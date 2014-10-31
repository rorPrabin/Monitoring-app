require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!


describe "User", js: true do 
  context "If admin"  do
    it "allow to add new user" do
      @user = FactoryGirl.create(:user,admin: true)

      visit "/"
      click_link_or_button "Login"
      fill_in "Email", with: @user.email
      fill_in "Password", with: 'foobar123'
      click_link_or_button "Sign in"
      within '.nav.navbar-nav.navbar-right' do
        click_link_or_button "Example User"
      end

      click_link_or_button "My Company"
      click_link_or_button "Add new user"
      fill_in "First Name", with: "Example"
      fill_in "Last Name", with: "User"
      fill_in "Email", with: "user@user.com"
      # fill_in "Password", with: "foobar123"
      # fill_in "Password Confirmation", with: "foobar123"
      select('General User', from: "user_role")
      click_link_or_button "Create User"

      User.count.should be(2)
      @user.admin.should == true
      User.last.role.should == "general_user"

      # expect(page).to have_select('user[role]', selected: 'general_user')
      
    ## Admin can add new user
    ## assign user role general user, company admin and admin
    ## if general user is assign
      ## User role should be generaral user


    end


  end

end