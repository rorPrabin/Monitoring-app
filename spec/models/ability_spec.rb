require 'spec_helper'
require "cancan/matchers"

describe "User" do


  # 3. Admin can manage the project (Unit Test)

  describe 'abilities' do
    let(:user) { FactoryGirl.create(:user, :admin => true, :company_admin => true) }
    let(:ability) { FactoryGirl.create(:user) }

    subject(:ability) { Ability.new(user) }

    it { should be_able_to :manage, Project.new }

  end

end