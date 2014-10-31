require 'spec_helper'

describe Company do
  before { @company = FactoryGirl.build(:company) }
  subject { @company }

  # 1. Company Administrato (Unit Test)
  
  it { should validate_presence_of(:name) }
  it { should have_many(:projects)}
  it { should have_many(:users)}

  it "has keys" do
    should respond_to(:name) 
    should respond_to(:url)
    should respond_to(:allow_email_regex) 
    should respond_to(:address	) 
 
  end

  it "has associations" do
    should respond_to(:users)
    should respond_to(:projects)
  end

  describe "validity" do
    describe "of the factory" do
      it "is valid" do
        @company.should be_valid
      end
    end
  end
end
