Given(/^no #{capture_plural_factory} exist$/) do |plural_factory|
  plural_factory.classify.constantize.destroy_all
  # you could add the following to verify that there are indeed no records
  find_models(plural_factory.singularize).should be_empty
end

When /^I sign up as user "([^\",]*), ([^\",]*)" with email "([^\",]*)" and password "([^\"]*)"$/ do |last_name, first_name, email, password|
  visit "/account/new"
  fill_in "First name", :with => first_name
  fill_in "Last name", :with => last_name
  fill_in "Email", :with => email
  fill_in "Password", :with => password
  fill_in "Repeat Password", :with => password
  click_button "Submit"
end

Given /^an admin user exists with email: "([^\"]*)", password: "([^\"]*)"$/ do |email, password|
  Factory(:user, :email => email, :password => password, :role => "A")
end

Then /^I should not be redirected to another page$/ do
  response.should_not be_redirect
end

Then /^I should be redirected to another page$/ do
  response.should be_redirect
end

Then /^I should see a link to "([^\"]*)" with text "([^\"]*)"$/ do |url, text|
  response_body.should have_selector("a[href='#{ url }']") do |element|
    element.should contain(text)
  end
end

Then /^I should not see a link to "([^\"]*)" with text "([^\"]*)"$/ do |url, text|
  response_body.should_not have_selector("a[href='#{ url }']") do |element|
    element.should_not contain(text)
  end
end

Then(/^I should see users table$/) do |expected_table|  
  html_table = tableish("table#users tr", "td,th")  
  html_table.map! { |r| r.map! { |c| c.gsub(/<.+?>/, '') } }  
  expected_table.diff!(html_table)
end
