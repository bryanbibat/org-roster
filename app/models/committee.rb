class Committee < ActiveRecord::Base
  validates_presence_of :code, :full_name, :year_added

  validate :start_year_cannot_be_before_org_founding, :end_year_cannot_be_before_start_year

  def start_year_cannot_be_before_org_founding
    errors.add(:year_added, "can't be before org's founding year.") if 
      !year_added.blank? &&
      SystemParameter.find_by_code("year_founded").value.to_i > year_added
  end

  def end_year_cannot_be_before_start_year
    errors.add(:year_removed, "can't be before year institutionalized.") if 
      !year_removed.blank? && (!year_added.blank? && year_removed < year_added)
  end

end
