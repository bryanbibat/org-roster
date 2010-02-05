Given /^the following (.+) records?$/ do |factory, table|  
  table.hashes.each do |hash|  
    Factory(factory, hash)  
  end  
end  

When /^I login as "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  visit login_url
  fill_in "Email", :with => email
  fill_in "Password", :with => password
  click_button "Log in"
end

