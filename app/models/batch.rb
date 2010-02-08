class Batch < ActiveRecord::Base
  has_many :users

  def display_name 
    return "Founding Member" if applicant_batch == 0
    return "#{applicant_batch.ordinalize} (#{year})" if name.blank?
    "#{name} (#{applicant_batch.ordinalize}, #{year})" 
  end
end
