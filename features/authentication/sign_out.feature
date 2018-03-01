Feature: Sign out
  To prevent unauthorised access to my account
  A signed in user
  Should be able to sign out

  Scenario: User sign out
    Given I am signed in
    When I sign out
    Then I should be on the "home" page
    And I should be signed out