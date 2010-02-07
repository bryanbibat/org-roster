Feature: Manage Users 
  In order have users in the system
  As an admin
  I want to manage users

  Scenario: Allow sign-up for first user
    Given no users exist
    When I go to the home page 
    Then I should be on the create account page

   Scenario: Allow sign-up for first user
    Given no users exist
    When I sign up as user "alice@xyz.com" with password "secret"
    Then a user: "alice" should exist with email: "alice@xyz.com" 
    And a user: "alice" should be an admin 

   
