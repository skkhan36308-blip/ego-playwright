Feature: Verify the homepage video on UK, US and EU locales.

  As a user
  I want to perform the recorded scenario against https://cfstaging.ego.co.uk/
  So that the flow can be automatically verified

  Scenario: Verify the homepage video on UK, US and EU locales.
    Given the user opens the application
    When the user clicks "button"
    And the user clicks "GBP (£)"
    And the user clicks "USD ($)"
    Then the scenario completes successfully
