require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "tests with company controllers", :js => true do

  context "New Company" do
    it "should sign up" do
      visit '/sign_up/'
      fill_in "Company Name", with: "Esignatures"
      fill_in "First name", with: "admin"
      fill_in "Last name", with: "es"
      fill_in "Email", with: "admin@es.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"

      click_link_or_button "Sign up"

      expect(page).to have_content("Company was successfully created.")
    end 

    it "should check validation" do
      visit '/sign_up/'
      click_link_or_button "Sign up"

      within('#errorExplanation') do
        expect(page).to have_selector('h2', text: '3 errors prohibited this company from being saved:')

        within 'ul' do
          expect(page).to have_selector('li', text: 'Company name is required')
          expect(page).to have_selector('li', text: "Users email can't be blank")
          expect(page).to have_selector('li', text: "Users password can't be blank")
        end
      end
    end

  end

	before :each do
		@user = FactoryGirl.create(:user, :admin => true)
		login_as(@user)
	end
  it "should not trhow error" do
    # puts
  end

  context "when click create company" do
  	it "should create new company" do
  		visit '/companies/new'
  		within("#new_company") do
  			fill_in "Company name", with: "Esignature"
  			fill_in "Address", with: "Ktm"
  			fill_in "Allow email regex", with: "ex@com.com"
  			fill_in "Url", with: "htttp://www.es.com"
  			click_link_or_button "Create Company"
  		end
  		expect(page).to have_content("Company was successfully created.")
  	end

  	it "should check the validation" do
  		visit '/companies/new'

  		within("#new_company") do
  			click_link_or_button "Create Company"
  		end

  		within('#errorExplanation') do
        expect(page).to have_selector('h2', text: '1 error prohibited this company from being saved:')

        within 'ul' do
          expect(page).to have_selector('li', text: 'Company name is required')
        end
      end

      fill_in "Company Name", with: "Esignature"
      click_link_or_button "Sign up"
    end
  end

  context "when click back button" do
  	it "redirects to company listing page" do
  		visit '/companies/new'
  		click_link_or_button "Back"

  		current_path.should == companies_path
  		expect(page).to have_content("Listing companies")
  	end
  end

  context "edit Company details" do
    it "should edit the company info" do
      visit '/my_company/'

      fill_in "Company name", with: "Esignature"
      fill_in "Address", with: "Ktm"
      fill_in "Allow email regex", with: "ex@com.com"
      fill_in "Url", with: "htttp://www.es.com"
      click_link_or_button "Update Company"

      expect(page).to have_content("Company was successfully updated.")
    end

    it "should show details" do
      visit '/edit_my_company/'
      click_link_or_button "Show"
      expect(page).to have_content("My Company")
    end

    it "should check company name" do
      visit '/edit_my_company/'
      fill_in "Company name", with: ""
      click_link_or_button "Update Company"

      within("#errorExplanation") do
        expect(page).to have_selector('h2', text: "1 error prohibited this company from being saved:")

        within 'ul' do
          expect(page).to have_selector('li', text: "Company name is required")
        end
      end

      expect(page).to have_content("")
    end

    context "when back link is click" do
      it "should redirect to index page" do
        visit '/edit_my_company/'
        click_link_or_button "Show"
        visit '/companies/'

        # expect(page).to have_content("My Company")
        expect(page).to have_content("Listing companies")
      end
    end

    context "when click to my project link" do
      context "should redirect to project page" do
        before(:each) do        
          visit "/"
          within ".dropdown.user_account" do
            find(".dropdown-toggle").click
          end
          click_link_or_button "My Project"
        end

          it "should add new project if user is admin" do
            click_link_or_button "Add New Project"
            fill_in "Name", with: "New Project"
            fill_in "Url", with: "http://www.newproject.com"
            click_link_or_button "Create Project"
            # expect(page).to have_content("New project created successfully.")

            Project.count.should be(1)
          end

          it "should render same page if use is not admin" do
            expect(page).to have_selector("table")
          end

        # expect(page).to have_content("a", text: "Add New Project")
      end
    end


  end

  before(:each) do 
    @company = FactoryGirl.create(:company)
    @user1 = FactoryGirl.create(:user, :email => "email@email.com", :admin => true)
    logout @user
    login_as(@user1)
  end

  context "Destroy Company" do
    it "should delete company" do
      visit '/companies/'
      first(:link, "Destroy").click
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content("Company is destroy") 
    end
  end

end