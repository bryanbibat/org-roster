class User < ActiveRecord::Base
  acts_as_authentic  

  belongs_to :batch
  has_many :positions, :dependent => :delete_all

  belongs_to :buddy_mem, { :class_name => "User", :foreign_key => "buddy_id" }
  has_many :buddy_apps, { :class_name => "User", :foreign_key => "buddy_id" }


  validates_presence_of :first_name, :last_name

  before_create { |user| user.role = 'A' if !User.admin_exists? }

  def admin?
    role == 'A'
  end

  def display_name
    "#{last_name}, #{first_name}"
  end

  def roster_display
    return nickname if first_name.blank? && last_name.blank?
    nickname.blank? ? "#{first_name} #{last_name}" :
       "#{nickname} (#{first_name} #{last_name})"
  end

  def batch_display
    return "" if batch.nil? 
    batch.display_name
  end

  def self.admin_exists?
    User.exists?(:role => 'A')
  end

  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    Notifier.deliver_password_reset_instructions(self)  
  end  

  def self.possible_buddies(batch_id)
    User.all(:conditions => ["EXISTS (SELECT 1 FROM batches WHERE " + 
        "users.batch_id = batches.id " + 
        "AND batches.applicant_batch < ?)",
        batch_id.blank? ? 0 : Batch.find(batch_id).applicant_batch])
  end

  
end
