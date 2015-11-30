Feature: User Login

  Scenario: Sign up an account
    Given I am on the home page
    When I sign up with account information
    Then I am signed up 

  Scenario: Sign in
    Given There is a user account
    And I am on the home page
    When I sign in with my accoutn information
    Then I am signed in

