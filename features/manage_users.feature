Feature: Manage Users 
  In order have users in the system
  As an admin
  I want to manage users

  Scenario: Allow sign-up for first user
    Given no users exist
    When I go to the home page 
    Then I should be on the create account page

  Scenario: Sign-up for first user makes that person an admin
    Given no users exist
    When I sign up as user "Allen, Alice" with email "alice@xyz.com" and password "secret"
    Then a user: "alice" should exist with email: "alice@xyz.com" 
    And a user: "alice" should be an admin 

  Scenario: Admin users can maintain users
    Given an admin user exists with email: "alice@xyz.com", password: "secret"
    When I login as "alice@xyz.com" with password "secret"
    And I go to the list users page
    Then I should not be redirected to another page
    And I should see a link to "/users/new" with text "New User" 

  Scenario: Normal users cannot maintain users
    Given the following users exist
      | email         | password |
      | admin@xyz.com | secret   |
      | alice@xyz.com | secret   |
    When I login as "alice@xyz.com" with password "secret"
    And I go to the list users page
    Then I should not be redirected to another page
    And I should not see "New User"
    And I should not see a link to "/users/new" with text "New User"

  Scenario: View list of users
    Given the following users exist
      | last_name | first_name | email         | password | nickname | status |
      | Doe       | John       | admin@xyz.com | secret   | JD       | Alumni |
      | Allen     | Alice      | alice@xyz.com | secret   |          | Member |
    When I login as "alice@xyz.com" with password "secret"
    And I go to the list users page
    Then I should see users table
      | | Name          | Batch | Status             |
      | | Alice Allen   |       | Member             |
      | | JD (John Doe) |       | Alumni, Site Admin | 

