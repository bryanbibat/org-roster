module UsersHelper
  
  def status_list
    [["Member", "Member"], ["Alumni", "Alumni"], ["Inactive Alumni", "Inactive Alumni"]]
  end

  def roles
    [["Normal User", ""], ["Admin", "A"]]
  end

end
