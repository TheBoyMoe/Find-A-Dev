Feature: Sign in
  As an existing user
  So that I can use the site
  I want to be able to login

  Scenario: User is not registered
    Given I do not exist as a user
    When I sign in with valid credentials
    Then I should see an invalid login message
    And I should be signed out

  Scenario: User is registered and the account is not activated
    Given I exist as a user
    And I am not logged in
    When I sign in with valid credentials
    Then I should see account activation required message

  Scenario: User is registered and the account is activated
    Given I exist as a user
    And I am not logged in
    When I sign in with valid credentials
    Then I should see a successful sign in message
    When I return to the site
    Then I should be signed in
    And I should not see a sign in link
    And I should see a sign out link

  Scenario: User enters the wrong email
    Given I exist as a user
    And I am not logged in
    When I sign in with the wrong email
    Then I should see an invalid login message
    And I should be signed out

  Scenario: User enters the wrong password
    Given I exist as a user
    And I am not logged in
    When I sign in with the wrong password
    Then I should see an invalid login message
    And I should be signed out