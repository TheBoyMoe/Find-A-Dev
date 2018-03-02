Feature: Signup
  As a new User
  So that I can use sites services
  I want to register as a user

  Scenario: Sign up as a new user
    Given I visit the "sign up" page
    And I sign up as "Mock User" with email "mock@example.com" and password "password" and password confirmation "password"
    Then I should be on the "home" page
    And I should see a activate account message
    And I should receive a "Confirmation instructions" email
    And I click on the confirmation link in the email to "mock@example.com"
    Then I should be on the "sign in" page
    And I sign in as "mock@example.com" with password "password"
    Then I should be on the profile page for "mock@example.com"
    And I should see a signed in successfully message

  Scenario: User signs up without a name
    When I sign up with out a name
    Then I should see a missing name message

  Scenario: User signs up without an email
    When I sign up with out an email
    Then I should see an missing email message

  Scenario: User signs up with an invalid email
    When I sign up with an invalid email
    Then I should see an invalid email message

  Scenario: User signs up without a password
    When I sign up without a password
    Then I should see a missing password message

  Scenario: User signs up without a password confirmation
    When I sign up without a password confirmation
    Then I should see a missing password confirmation message

  Scenario: User signs up with a password that is less than 6 characters
    When I sign up with a password that is less than 6 characters
    Then I should see a password too short message

  Scenario: User signs up with mismatched password and password confirmation
    When I sign up with a mismatched passwords
    Then I should see a mismatched password message

  Scenario: Sign up as an existing user
    Given I am a registered user
    And I sign up as "Mock User" with email "mock@example.com" and password "password" and password confirmation "password"
    Then I should see email taken message
    And I should not receive a confirmation email

  @omniauth
  Scenario: User signs up with a Google account
    Given I visit the "sign up" page
    When I click "Sign in with Google"
    Then I should see "Successfully authenticated from Google account."

  @omniauth
  Scenario: User signs up with a Github account
    Given I visit the "sign up" page
    When I click "Sign in with GitHub"
    Then I should see "Successfully authenticated from Github account."

  @omniauth-with-invalid-credentials
  Scenario: Try to sign up with a Google account with invalid credentials
    Given I visit the "sign up" page
    When I click "Sign in with Google"
    Then I should see "There was a problem signing in"
    And I should be signed out

  @omniauth-with-invalid-credentials
  Scenario: Try to sign up with Github account with invalid credentials
    Given I visit the "sign up" page
    When I click "Sign in with GitHub"
    Then I should see "There was a problem signing in"
    And I should be signed out

  Scenario: Having previously signed in with Google, user tries to sign up
    Given I visit the "sign up" page
    And I have previously signed up with "Google"
    And I sign up as "Mock User" with email "mock@example.com" and password "password" and password confirmation "password"
    Then I should see email taken message
    And I should not receive a confirmation email

  Scenario: Having previously signed in with Github, the user tries to sign up
    Given I visit the "sign up" page
    And I have previously signed up with "GitHub"
    And I sign up as "Mock User" with email "mock@example.com" and password "password" and password confirmation "password"
    Then I should see email taken message
    And I should not receive a confirmation email