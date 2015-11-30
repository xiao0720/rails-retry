Feature: User Login

  Scenario: Sign up an account
    Given I am on the home page
    When I sign up with account information
    Then I am signed up 

  Scenario: Log in
    Given There is a user account
    And I am on the home page
    When I log in with my accoutn information
    Then I am logged in

  Scenario: Log out
    Given I am logged in with a user account
    When I log out
    Then I am logged out
