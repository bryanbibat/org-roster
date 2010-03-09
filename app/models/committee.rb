class Committee < ActiveRecord::Base

  has_many :roles, :dependent => :delete_all
  has_many :positions, :dependent => :delete_all

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

  after_create :add_default_members

  def add_default_members
    head = self.roles.build(:name => "Head", :description => "The head of the committee", :execom => true)
    head.save
    mem = self.roles.build(:name => "Member", :description => "A member of the committee", :execom => false)
    mem.save
  end
end
