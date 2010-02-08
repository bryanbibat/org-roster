class Role < ActiveRecord::Base
  belongs_to :committee
  has_many :positions, :dependent => :delete_all
end
