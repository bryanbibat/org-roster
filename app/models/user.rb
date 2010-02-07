class User < ActiveRecord::Base
  acts_as_authentic  

  before_create { |user| user.role = 'A' if !User.admin_exists? }

  def admin?
    role == 'A'
  end

  def self.admin_exists?
    User.exists?(:role => 'A')
  end
end
