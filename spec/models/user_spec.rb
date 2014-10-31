require 'spec_helper'

describe User do
  let(:user) {FactoryGirl.build(:user)}

  # it { should validate_uniqueness_of(:email).scoped_to(:company_id) }


  it "has keys" do
    should respond_to(:email) 
    should respond_to(:password)
    should respond_to(:first_name) 
    should respond_to(:last_name)
    should respond_to(:admin)
    should respond_to(:company_admin) 
    should respond_to(:role)
    should_not respond_to(:general_user)
  end

  it "has associations" do
    should respond_to :projects
    should respond_to :associations
  end

  describe "validity" do
    describe "of the factory" do
      it "is valid" do
        user.should be_valid
      end
    end
  end

  describe "methods" do
    describe "system_admin?" do
      context "default value" do
        it "returns false" do
          user.should_not be_system_admin
        end
      end

      context "admin field set 'TRUE'" do
        it "returns true" do
          user.admin = true
          user.save
          user.should be_system_admin
        end
      end

      context "admin field set 'FALSE'" do
        it "returns false" do
          user.admin = false
          user.save
          user.should_not be_system_admin
        end
      end
    end

    describe "is_admin?" do
      context "default value" do
        it "returns false" do
          user.should_not be_is_admin
        end
      end

      context "admin field set 'TRUE'" do
        it "returns true" do
          user_id = user.id
          user.admin = true
          user.save
          user.should be_is_admin
        end
      end
    end

    describe "company_admin?" do
      context "default value" do
        it "returns false" do
          user.should_not be_company_admin
        end
      end

      context "company_admin field set 'TRUE'" do
        it "returns true" do
          user.company_admin = true
          user.save
          user.should be_company_admin
        end
      end
    end

  	describe "current_user?" do
  		it "returns true if user is current_user" do
	      user.should be_current_user(user)
	    end

	    it "returns false if user is not current_user" do
	    	user1 = FactoryGirl.build(:user, :admin => true)
	    	user.should_not be_current_user(user1)
	    end
  	end

  	describe "full_name" do
  		it "returns full name combining first_name and last_name" do
  			full_name = user.full_name
	      full_name.should eql("#{user.first_name.capitalize} #{user.last_name.capitalize}")
	    end
    end    
  end
  
end
