class User < ActiveRecord::Base
  acts_as_authentic  

  belongs_to :batch
  has_many :positions, :dependent => :delete_all

  validates_presence_of :first_name, :last_name

  before_create { |user| user.role = 'A' if !User.admin_exists? }

  def admin?
    role == 'A'
  end

  def batch_display
    return "" if batch.nil? 
    batch.display_name
  end

  def self.admin_exists?
    User.exists?(:role => 'A')
  end
end
