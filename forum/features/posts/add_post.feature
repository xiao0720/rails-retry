Feature: Add Post

  Scenario: Add a new post
    Given I am logged in with a user account
    When I submit a new post
    Then A new post is submited

  Scenario: Delete a post
    Given I am logged in with a user account
    And There is a post
    When I delete the post
    Then The post is deleted

  Scenario: Update a post
    Given There is a post
    And I am logged in with a user account
    When I edit the post
    Then The post is updated

  Scenario: View a post
    Given There is a post
    And I am logged in with a user account
    When I view the post
    Then I can view the post
