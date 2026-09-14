Feature: Manually recorded scenario

  As a user
  I want to perform the recorded scenario against https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
  So that the flow can be automatically verified

  Scenario: Manually recorded scenario
    Given the user opens the application
    When the user fills "Username" with "Admin"
    And the user clicks "Password"
    And the user fills "Password" with "(a secret value from the environment)"
    And the user clicks "Login"
    Then the scenario completes successfully
