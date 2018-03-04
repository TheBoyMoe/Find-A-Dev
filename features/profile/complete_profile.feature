Feature: Complete user profile
  As a new user
  So that other users can find out more about me
  I want to complete a user profile

  Background:
    Given I am a registered user
    And I have activated my account
    And I sign in as "mock@example.com" with password "password"
    Then I should be on the "edit" page for "mock@example.com"

  Scenario: As a developer I want to create a profile


  Scenario: As a founder I want to create a profile