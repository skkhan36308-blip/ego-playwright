Feature: login with valid username and password
steps go to login page , enter username and password and click on login button
username: Admin
Passwo

  As a user
  I want to perform the recorded scenario against https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
  So that the flow can be automatically verified

  Scenario: login with valid username and password
steps go to login page , enter username and password and click on login button
username: Admin
Passwo
    Given the user opens the application
    When the user fills "Username" with "Admin"
    And the user fills "Password" with "(a secret value from the environment)"
    And the user clicks "Login"
    Then the scenario completes successfully
