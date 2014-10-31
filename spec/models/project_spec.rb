require 'spec_helper'

describe Project do
	let(:project) {FactoryGirl.build(:project)}

  it { should validate_uniqueness_of(:url).scoped_to(:company_id) }
  it { should validate_uniqueness_of(:name).scoped_to(:company_id) }

	it "has keys" do
    should respond_to(:name) 
    should respond_to(:url)
    should respond_to(:status)
  end

  it "has associations" do
    should respond_to :creator
    should respond_to :company
    should respond_to :monitoring_tables
    should respond_to :members
  end

  describe "validity" do
  	context "With valid parameters" do
	  	it "is valid" do
		    project.should be_valid
		  end
		end

		context "when blank name" do

		  before { project.name = "" }

      it "is invalid" do
        project.should_not be_valid
      end

      it "adds the correct error message" do
        project.valid?
        project.errors.messages[:name].should include("can't be blank")
      end
		end

		context "when blank url" do
			
		  before { project.url = "" }

      it "is invalid" do
        project.should_not be_valid
      end

      it "adds the correct error message" do
        project.valid?
        project.errors.messages[:url].should include("can't be blank")
      end
		end
  end

  describe "monitor_projects" do
  	context "when number of projects" do
  		it "increase the count of monitoring_tables" do
  			project.save
  			old_count = MonitoringTable.count
  			Project.monitor_projects
  			new_count = MonitoringTable.count
  			old_count.should_not eql(new_count)
  		end
  	end

  	context "project with invalid url" do
  		it "change the status pf project" do
  			project.url = 'www.invaliddd.com'
  			project.save
  			Project.monitor_projects
  			Project.last.status.should include("Domain doesn't exist")
  		end

  		it 'should send an email' do
  			project.url = 'www.invaliddd.com'
  			project.save
  			old_count = ActionMailer::Base.deliveries.count
  			Project.monitor_projects
		    ActionMailer::Base.deliveries.count.should_not eql(old_count)
		  end	
  	end

  	context "project with valid url" do
  		it "status of project remain same" do
  			project.url = 'http://ganeshkunwar.com.np/'
  			project.save
  			Project.monitor_projects
  			Project.last.status.should_not include("Domain doesn't exist")
  		end

  		it 'should not send an email' do
  			project.url = 'http://ganeshkunwar.com.np/'
  			project.save
  			old_count = ActionMailer::Base.deliveries.count
  			Project.monitor_projects
		    ActionMailer::Base.deliveries.count.should eql(old_count)
		  end	
  	end
  end

end
