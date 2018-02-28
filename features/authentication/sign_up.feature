Feature: Signup
  As a new User
  So that I can use sites services
  I want to register as a user

Background:
  Given the following user is registered:
  | name  | email   | password | password-confirmation  |
  | Green Goblin | greengoblin@example.com   | password  | password |

  Scenario: Sign up as a new user
    Given I am on the sign up page
    And I sign up as "Peter Parker" with email "peterparker@example.com" and password "spideysense" and password confirmation "spideysense"
    Then I should be on the sign up page
    And I should see "A message with a confirmation link has been sent to your email address. Please open the link to activate your account."
    And I should receive a "Confirmation instructions" email
    And I click on the confirmation link in the email to "peterparker@example.com"
    Then I should be on the sign in page
    And I sign in as "peterparker@example.com" with password "spideysense" and password confirmation "spideysense"
    Then I should be on my account page


  Scenario: User signs up without a name


  Scenario: User signs up with an invalid email


  Scenario: User signs up without a password


  Scenario: User signs up with a password that is less than 8 characters


  Scenario: User signs up with mismatched password and password confirmation


  Scenario: Sign up as an existing user