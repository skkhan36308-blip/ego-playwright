Feature: login with user name and password

  As a user
  I want to perform the recorded scenario against https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
  So that the flow can be automatically verified

  Scenario: login with user name and password
    Given the user opens the application
    When the user fills "Username" with "Admin"
    And the user clicks "Password"
    And the user fills "Password" with "(a secret value from the environment)"
    Then the scenario completes successfully
