class SystemParameter < ActiveRecord::Base
  validates_presence_of :code, :value
  validates_uniqueness_of :code
end
