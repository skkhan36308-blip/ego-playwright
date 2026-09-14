Feature: Reproduce Homepage Video issue

  As a user
  I want to perform the recorded scenario against https://cf-uat1.ego.co.uk/
  So that the flow can be automatically verified

  Scenario: Reproduce Homepage Video issue
    Given the user opens the application
    When the user clicks "GBP (£)"
    Then the scenario completes successfully
