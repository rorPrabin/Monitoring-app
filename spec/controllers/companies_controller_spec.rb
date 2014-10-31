require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe CompaniesController, :js => true do

	# describe "Sign up" do
	# 	get :sign_up
	# 	company = Company.create

	# 	expect(response).to eq(200)

	# end

 #  before :each do
 #   	@user = FactoryGirl.create(:user)
	# 	login_as(@user)
	# # @company = FactoryGirl.create(:company)
 #  end

 #  describe "Company projects" do
 #    it "should list all the project belongs to user" do
 #      get :company_project

 #      expect(response).to eq(200)
 #    end
 #  end

  # describe "GET index" do
  # 	context "For system admin" do
	 #  	it "Lists all projects related to user" do
	 #  		@user.admin = true
	 #  		@user.save
		#     visit "/companies"
		#     expect(page).to have_content 'Listing companies'
		#   end
		# end

		# context "For general user" do
	 #  	it "Does not lists all projects related to user" do
		#     visit "/companies"
		#     expect(page).to have_content 'Dashboard'
		#   end
		# end
  # end

  # describe "GET new" do
  # 	it "create new company" do
  # 		get :new
  # 		expect(page).to be_success
  # 	end
  # end

  # describe "create companies" do
  # 	it "should create new companyg" do
  # 		expect(page).to eq(200)
  # 	end

  # end


end
