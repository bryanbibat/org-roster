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

