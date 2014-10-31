class Company < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "154x54>" }, :default_url => "/images/:style/missing.png"
	has_many :projects , :dependent => :destroy

  has_many :activities , :dependent => :destroy

	validates_presence_of :name
	has_many :users, :autosave => true, :class_name => 'User', :dependent => :destroy
  accepts_nested_attributes_for :users, allow_destroy: true 
  validates_presence_of :email_format, :if => :allow_email_regex?

  paginates_per 5
  
  def allow_email_regex?
  	allow_email_regex
  end

  def track_company_activity(act_type)
    activity = Activity.new
    activity.object = self.name
    activity.object_id = self.id
    activity.object_type = ""
    activity.activity = ""
    activity.activity_type = act_type
    activity.agent = self.creator_name
    activity.agent_id = 1
    activity.time_stamp = Time.now
    activity.project_id = self.id
    activity.save
  end
end

