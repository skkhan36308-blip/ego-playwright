Feature: Source: Manual

Original requirement: login with invalid user name and password

Requirement: The issue reports an attempt to log in with an invalid username and password but lacks details on expected vs. actual behavior, error messages, environment, and impact. This creates uncertainty around whether the login flow correctly rejects invalid credentials and displays appropriate feedback.

Selected Automation Cases:
TC-NEG-01 Attempt login with invalid username and password
TC-NEG-02 Login with valid username and invalid password
TC-VAL-01 Submit login form with empty fields
TC-API-01 Verify backend returns 401 for invalid credentials

  As a user
  I want to perform the recorded scenario against https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
  So that the flow can be automatically verified

  Scenario: Source: Manual

Original requirement: login with invalid user name and password

Requirement: The issue reports an attempt to log in with an invalid username and password but lacks details on expected vs. actual behavior, error messages, environment, and impact. This creates uncertainty around whether the login flow correctly rejects invalid credentials and displays appropriate feedback.

Selected Automation Cases:
TC-NEG-01 Attempt login with invalid username and password
TC-NEG-02 Login with valid username and invalid password
TC-VAL-01 Submit login form with empty fields
TC-API-01 Verify backend returns 401 for invalid credentials
    Given the user opens the application
    When the user clicks "Username"
    And the user fills "Username" with "admin"
    And the user clicks "Password"
    And the user fills "Password" with "(a secret value from the environment)"
    Then the scenario completes successfully
