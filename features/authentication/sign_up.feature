Feature: Signup
  As a new User
  So that I can use sites services
  I want to register as a user

Background:
  Given the following user is registered:
  | name  | email   | password | password-confirmation  |
  | Green Goblin | greengoblin@example.com   | password  | password |

  Scenario: Sign up as a new user
    Given I visit the "sign up" page
    And I sign up as "Peter Parker" with email "peterparker@example.com" and password "spideysense" and password confirmation "spideysense"
    Then I should be on the "sign up" page
    And I should see "A message with a confirmation link has been sent to your email address. Please open the link to activate your account."
    And I should receive a "Confirmation instructions" email
    And I click on the confirmation link in the email to "peterparker@example.com"
    Then I should be on the "sign in" page
    And I sign in as "peterparker@example.com" with password "spideysense" and password confirmation "spideysense"
    Then I should be on the profile page for "peterparker@example.com"


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

  Scenario: User signs up with a password that is less than 8 characters
    When I sign up with a password that is less than 8 characters
    Then I should see a password too short message

  Scenario: User signs up with mismatched password and password confirmation
    When I sign up with a mismatched passwords
    Then I should see a mismatched password message

  Scenario: Sign up as an existing user
    Given I visit the "sign up" page
    And I sign up as "Green Goblin" with email "greengoblin@example.com" and password "password" and password confirmation "password"
    Then I should see email taken message
    And I should not receive a confirmation email
