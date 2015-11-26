Feature: User Login

  Scenario: View the home page with sign in button
    Given I am on the home page 
    Then I should see "You need to sign in or sign up before continuing."
    And I should see "sign in" in a link

  Scenario: Fill out information to login
    Given I am on the home page
    When I fill in "Email" with "user@example.com"
    And I fill in "Password" with "password"
    And I click "Log in"
    Then I should see "Signed in successfully."

  Scenario: Log out 
    Given I am on the home page
    And I am logged in
    When I click "Logout"
    Then I should see "You need to sign in or sign up before continuing."
