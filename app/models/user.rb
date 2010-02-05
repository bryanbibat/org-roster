class User < ActiveRecord::Base
  acts_as_authentic  

  def self.admin_exists?
    User.exists?(:conditions => "role = 'A'")
  end
end
