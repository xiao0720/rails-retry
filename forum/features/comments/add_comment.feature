Feature: Add comment

  Scenario: Add Comments 
    Given There is a post 
    And I am logged in with a user account
    When I add a comment to it
    Then The post has a comment

  Scenario: Add comment to a comment
    Given There is a post
    And There is a comment to the post
    And I am logged in with a user account
    When I add a comment to the comment
    Then The comment has a comment
