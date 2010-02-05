Feature: Manage Login
  In order to access the site
  As a user
  I want to login

  Scenario: Login
    Given the following user records
      | email         | password |
      | alice@xyz.com | secret   |
    When I login as "alice@xyz.com" with password "secret"
    Then I should see "Login successful."
    And I should be on the home page

  Scenario: Invalid Login
    Given the following user records
      | email         | password |
      | alice@xyz.com | secret   |
    When I login as "alice@xyz.com" with password "wrong"
    Then I should see "Password is not valid"
    And I should be on the login page

