require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "ProjectsController", :js => true do
  before :each do
   	@user = FactoryGirl.create(:user)
		login_as(@user, :scope => :user)
  end

  context "Add new Project" do
  	before(:each) do
  		visit '/'
  		# click_link_or_button "New Project"
  	end

    context "check admin" do
      it "should not add project if not admin" do
        User.count.should be(1)
        @user.company_admin.should == false
      end

      context "if admin" do
        before(:each) do
          logout @user
          @user = FactoryGirl.create(:user, admin: true, company_admin: true)
          login_as(@user)

          within ".dropdown.user_account" do
            find(".dropdown-toggle").click
          end
          click_link_or_button "My Project"
        end

        it "should add new project" do
          click_link_or_button "Add New Project"
          fill_in "Name", with: "My New Project"
          fill_in "Url", with: "http://www.project.com"
          click_link_or_button "Create Project"
          # expect(page).to have_content("New project created successfully.")

          Project.count.should be(1)
          @user.admin.should == true
          @user.admin.should == true
        end


        it "should validate the project" do
          click_link_or_button "Add New Project"
          click_link_or_button "Create Project"

          within('#errorExplanation') do
            expect(page).to have_selector('h2', text: "2 errors prohibited this project from being saved:")

            within 'ul' do
             expect(page).to have_selector('li', text: "Url can't be blank")
             expect(page).to have_selector('li', text: "Name can't be blank")
           end
         end
     end

 end


  # 3. Admin can manage the project (Integration Test)
    context "Edit the project" do
      context "should allow user to edit the project" do

        it "if admin" do
          logout @user
          @user = FactoryGirl.create(:user, admin: true, company_admin: true)
          # @project = FactoryGirl.create(:project)
          login_as(@user)

          within ".dropdown.user_account" do
            find(".dropdown-toggle").click
          end
          click_link_or_button "My Project"

          click_link_or_button "Add New Project"

          fill_in "Name", with: "My New Project"
          fill_in "Url", with: "http://www.project.com"
          click_link_or_button "Create Project"

          click_link_or_button "Edit"
          fill_in "Name", with: "Esignature"
          fill_in "Url", with: "http://www.es.com"
          click_link_or_button "Update Project"
          
          Project.count.should be(1)
        end

        it "if not admin" do
          User.count.should be(1)
          @user.admin.should == false
          @user.company_admin.should == false
        end

      end
    end

  end
  end

end

describe "Create Project", js: :true do
  before :each do
    @user = FactoryGirl.create(:user)
    @company = @user.company
    @member_1 = FactoryGirl.create(:user, :company => @company)
    @member_2 = FactoryGirl.create(:user, :company => @company)
    login_as(@user, :scope => :user)
  end

  it "should assign member to company" do
    @company.users.count.should eql(3)
    logout(@user)
    @user2 = FactoryGirl.create(:user, :company_admin => true ,:company => @company)
    login_as(@user2)
    Project.count.should eql(0)
    visit "/"
    click_link_or_button "Add"
    fill_in "Name", with: "My Project"
    fill_in "Url", with: "http://project.com"
    check("project_member_ids_#{@member_1.id}")
    check("project_member_ids_#{@member_2.id}")
    click_link_or_button "Create Project"
    # page.should have_content("New project created successfully.")
    Project.count.should eql(1)
    Project.first.members.count.should eql(3)
    members = Project.first.members
    members.should include(@member_1)
    members.should include(@member_2)
    members.should include(@user2)
    members.should_not include(@user)

    ### log out as admin 
    ### log in as normal user non admin
    ### after loggin in he should not have access to create buttons 
    ### create buttons include for user project etc .
    ### log out 

    ### log in as a company admin user (not system admin)
    ### he should have access to the buttons for createing users and projects
  end
end


