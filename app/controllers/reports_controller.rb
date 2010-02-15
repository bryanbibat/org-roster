require 'csv'

class ReportsController < ApplicationController
  def index 
  end

  def complete 
    @users = User.all(:order => "last_name, first_name")
    generate_report(@users, "Complete User's Roster", "complete_roster.csv")
  end

  def members 
    @users = User.all(:order => "last_name, first_name", :conditions => ["status = 'Member'"])
    generate_report(@users, "Member Roster", "member_roster.csv")
  end

  def alumni 
    @users = User.all(:order => "last_name, first_name", :conditions => ["status = 'Alumni'"])
    generate_report(@users, "Alumni Roster", "alumni_roster.csv")
  end


  private 

    def generate_report(data, header, file_name)
      report = StringIO.new
        CSV::Writer.generate(report, ',') do |text|
          text << [header]
          text << [""]
          text << ["generated at #{Time.now}"]
          text << [""]
          text << ["Full Name", "Nickname", "Other Nicknames", "Email Address", "Status"]
          text << [""]
          data.each do |item|
            text << ["#{item.last_name.capitalize}, #{item.first_name}", 
              item.nickname, item.other_aliases, item.email, item.status]
          end
          if data.size == 0
            title << [""]
            title << ["NO RECORDS RETRIEVED"]
          end
        end
      report.rewind
      send_data(report.read,
        :type => "text/csv; charset=iso-8859-1; header=present",
        :filename => file_name,
        :disposition =>"attachment", :encoding => "utf8")
    end

end
