# require 'spec_helper'


# # 3. Company Administrator (Integration Test)

# describe "Sign Up process", :js => true do
# 	context "sign up" do
# 		it "should response if validate" do
# 			visit "/sign_up/"
# 			fill_in "Company Name", with: "ES"
# 			fill_in "First name", with: "Amrit"
# 			fill_in "Last name", with: "Deep"
# 			fill_in "Email", with: "abc@example.com"
# 			fill_in "Password", with: "password"
# 			fill_in "Password confirmation", with: "password"
# 			click_link_or_button "Sign up"
# 			expect(page).to have_content("Company was successfully created.")
# 		end

# 		it "should not response if not validate" do			
# 			visit "/sign_up/"
# 			fill_in "Company Name", with: ""
# 			fill_in "First name", with: ""
# 			fill_in "Last name", with: ""
# 			fill_in "Email", with: ""
# 			fill_in "Password", with: ""
# 			fill_in "Password confirmation", with: ""
# 			click_link_or_button "Sign up"

# 			within('#errorExplanation') do
# 				expect(page).to have_selector('h2', text: "3 errors prohibited this company from being saved:")

# 				within 'ul' do
# 					expect(page).to have_selector('li', text: "Company name is required")
# 					expect(page).to have_selector('li', text: "Users email can't be blank")
# 					expect(page).to have_selector('li', text: "Users password can't be blank")
# 				end
# 			end
			
# 		end

# 	end
# end


require 'spec_helper'

describe "sign up process", :js => true do
  # context "signup" do
	    it "sign up " do
	        visit '/sign_up'
	        
	          fill_in 'Company Name', :with => ''
	          fill_in 'First Name', :with => ''
	          fill_in 'Last Name', :with => ''
	          fill_in 'Email', :with => ''
	          fill_in 'Password', :with => ''
	          fill_in 'Password confirmation', :with => ''
	          click_button 'Sign up'

	  #     	within('#errorExplanation') do
	  #       	expect(page).to have_selector('h2', text: "3 errors prohibited this company from being saved:")

	  #       	within 'ul' do
			# 		expect(page).to have_selector('li', text: "Company name is required")
			# 		expect(page).to have_selector('li', text: "Users email can't be blank")
			# 		expect(page).to have_selector('li', text: "Users password can't be blank")
			# 	end
			# end
	    end
  end
			
