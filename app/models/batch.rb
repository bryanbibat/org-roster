class Batch < ActiveRecord::Base
  has_many :users

  def display_name 
    return "Founding Member (#{year})" if applicant_batch == 0
    return "#{applicant_batch.ordinalize} (#{year})" if name.blank?
    "#{name} (#{applicant_batch.ordinalize}, #{year})" 
  end

  def display_name_long
    return "Founding Member (AY #{year}-#{year + 1})" if applicant_batch == 0
    return "#{applicant_batch.ordinalize} (AY #{year}-#{year + 1})" if name.blank?
    "#{name} (AY #{year}-#{year + 1})" 
  end
end
