require 'ping_tester/ping_tester.rb'
class Project < ActiveRecord::Base

  belongs_to :company, :class_name => 'Company'
  has_many :monitoring_tables, :dependent => :destroy

  has_many :activities, :dependent => :destroy

  # scope :monitor_nil, -> { monitoring_tables.where(:response_time => nil).order("created_at DESC").limit(5)}

  has_and_belongs_to_many :members, :class_name => 'User', :validate => false

  belongs_to :creator, :class_name => 'User', :foreign_key => "creator_id"

  validates_uniqueness_of :url, scope: [:company_id]
  validates_uniqueness_of :name, scope: [:company_id]

  validates_presence_of :url
  validates_presence_of :name
  
  accepts_nested_attributes_for :members

  paginates_per 5

  def self.monitor_projects
  	@projects = Project.all
  	@projects.each do |p|
  		each_url = PingTester.new(p.url)
      status, time = each_url.call_url
      response = each_url.track_once
      if status == :invalid
        MonitoringMailer.site_down(p).deliver
      end
      p.update_attributes(:status =>response)
      MonitoringTable.create(:project_url =>p.url, :project_status => response, :project_id => p.id, :response_time => time )
  	end
  end

  def track_project_activity(act_type)
    activity = Activity.new
    activity.object = self.name
    activity.object_id = self.id
    activity.object_type = ""
    activity.activity = ""
    activity.activity_type = act_type
    activity.agent = creator.first_name
    activity.agent_id = creator_id
    activity.time_stamp = Time.now
    activity.project_id = self.id
    activity.save
  end

  
end