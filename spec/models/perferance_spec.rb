require 'spec_helper'

describe Perferance do
	let(:perferance) {FactoryGirl.build(:perferance)}
  it "has keys" do
    should respond_to(:duration)
  end

  it "has associations" do
    should respond_to :user
  end
end
