Given(/^no #{capture_plural_factory} exist$/) do |plural_factory|
  plural_factory.classify.constantize.destroy_all
  # you could add the following to verify that there are indeed no records
  find_models(plural_factory.singularize).should be_empty
end

When /^I sign up as user "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  visit "/account/new"
  fill_in "Email", :with => email
  fill_in "Password", :with => password
  fill_in "Repeat Password", :with => password
  click_button "Submit"
end

