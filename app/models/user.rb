class User < ActiveRecord::Base

  has_many :company_users, class_name: "User",
                          foreign_key: "creator_id"
 
  belongs_to :creator, class_name: "User"

  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable, :confirmable  
         has_many :perferances

  # has_and_belongs_to_many :projects, foreign_key: 'creator_id'
  has_many :projects, :foreign_key => "creator_id", :dependent => :destroy

  has_many :activities

  has_and_belongs_to_many :associations, :class_name => "Project"
  # has_and_belongs_to_many :associations, :class_name => "Project", foreign_key: 'creator_id'

  belongs_to :company, :class_name => 'Company'
  accepts_nested_attributes_for :associations

  # validates :user_id, uniqueness: { scope: :company_id}
  
  validate :validate_regex

  paginates_per 5

  def full_name
  	"#{first_name} #{last_name}"
  end

  def current_user?(user)
    self == user
  end

  def general_user?
    admin = false
  end

  def system_admin?
    admin == true
  end

  def company_admin?
    company_admin == true
  end

  def is_admin?
    system_admin? || company_admin?
  end

  # Method to validate the email format
  def validate_regex
    if  !company.nil? && company.allow_email_regex == true
      # if email =~ /#{company.email_format}/i
       if email =~ /^([^@\s]+)@((?:#{company.email_format}))$/i
        true
      else
        errors.add(:email, ' format not match')
      end
    else 
      return true
    end
  end

  def track_user_activity(act_type)
    activity = Activity.new
    activity.object = self.first_name
    activity.object_id = self.id
    activity.object_type = ""
    activity.activity = ""
    activity.activity_type = act_type
    activity.agent = self.creator_name
    activity.agent_id = self.creator_id
    activity.time_stamp = Time.now
    activity.project_id = self.id
    activity.save
  end
end
