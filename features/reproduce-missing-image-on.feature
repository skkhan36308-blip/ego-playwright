Feature: Reproduce missing image on reported product

  As a user
  I want to perform the recorded scenario against https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
  So that the flow can be automatically verified

  Scenario: Reproduce missing image on reported product
    Given the user opens the application
    When the user fills "Username" with "Admin"
    Then the scenario completes successfully
