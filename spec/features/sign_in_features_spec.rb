# require 'spec_helper'

# describe "signin process", :js => true do
#   before :each do
#    FactoryGirl.create(:user, :email => 'ganesh@esignature.com.np')
#   end

#   context "with valid email and p/w" do
#     it "signs me in" do
#       visit '/users/sign_in'
#       within("#new_user") do
#         fill_in 'Email', :with => "ganesh@esignature.com.np"
#         fill_in 'Password', :with => "foobar123"
#         click_button 'Sign in'
#       end	    
#       expect(page).to have_content 'Signed in successfully.'
#     end
#   end

#   context "with invalid email and p/w" do
#     it "dose not sign in" do
#       visit '/users/sign_in'
#       within("#new_user") do
#         fill_in 'Email', :with => "ganesh@esignature.com.np"
#         fill_in 'Password', :with => "invalid_pw"
#         click_button 'Sign in'
#       end     
#       expect(page).to have_content 'Invalid email or password.'
#     end
#   end

# end


# require 'capybara/rspec'

require 'spec_helper'

describe "signin process", :js => true do
  # context "with valid email and pwd" do
    it "sign me in" do
        visit '/users/sign_in'
        # within("#new_user") do
          fill_in 'Email', :with => "example1@example.com"
          fill_in 'Password', :with => "password1"
          click_button 'Sign in'
        # end
        expect(page).to have_content 'valid email or password.'
    end
  # end 
end