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

  def possible_buddies
    
    User.find_by_sql(["SELECT * FROM users " + 
                      "WHERE EXISTS (SELECT 1 FROM batches WHERE " + 
                      "users.batch_id = batches.id " + 
                      "AND batches.applicant_batch < ?)",
                      batch.nil? ? 0 : batch.applicant_batch])
  end


end
