Feature: Source: Jira SCRUM-26

Requirement: [Manual] The issue reports an attempt to log in with an invalid username and password but lacks details on expected vs. actual behavior, error messages, environment, and impact. This creates uncertainty around whether the login flow correctly rejects inva
Description: Source: Manual requirement
Original requirement: login with invalid user name and password
Summary: The issue reports an attempt to log in with an invalid username and password but lacks details on expected vs. actual behavior, error messages, environment, and impact. This creates uncertainty around whether the login flow correctly rejects invalid credentials and displays appropriate feedback.
Risk: High
Issue confidence: 55%
Test cases:
- TC-NEG-01: Attempt login with invalid username and password [High]
- TC-NEG-02: Login with valid username and invalid password [High]
- TC-VAL-01: Submit login form with empty fields [Medium]
- TC-SEC-01: Account lockout after 5 consecutive failed logins [High]
- TC-API-01: Verify backend returns 401 for invalid credentials [High]
Missing information:
Exact error message text shown for invalid credentials
Whether the login page redirects or stays on the same URL
Environment (dev/staging/production) and browser versions
Steps to reproduce (e.g., UI flow, API endpoint)
Impact observed (e.g., session creation, audit log entry)
Any rate‑limiting or lockout behavior after repeated failures
Acceptance criteria:
Source: Manual requirement
Original requirement: login with invalid user name and password
Summary: The issue reports an attempt to log in with an invalid username and password but lacks details on expected vs. actual behavior, error messages, environment, and impact. This creates uncertainty around whether the login flow correctly rejects invalid credentials and displays appropriate feedback.
Risk: High
Issue confidence: 55%
Test cases:
- TC-NEG-01: Attempt login with invalid username and password [High]
- TC-NEG-02: Login with valid username and invalid password [High]
- TC-VAL-01: Submit login form with empty fields [Medium]
- TC-SEC-01: Account lockout after 5 consecutive failed logins [High]
- TC-API-01: Verify backend returns 401 for invalid credentials [High]
Missing information:
Exact error message text shown for invalid credentials
Whether the login page redirects or stays on the same URL
Environment (dev/staging/production) and browser versions
Steps to reproduce (e.g., UI flow, API endpoint)
Impact observed (e.g., session creation, audit log entry)
Any rate‑limiting or lockout behavior after repeated failures

Selected Automation Cases:
TC-NEG-01 Attempt login with completely invalid username and password
TC-NEG-02 Login with valid username and invalid password
TC-VAL-01 Submit login form with both fields empty
TC-SEC-01 Account lockout after 5 consecutive failed logins
TC-API-01 Verify backend returns 401 for invalid credentials
TC-SESSION-01 Ensure no session cookie is set after failed login
TC-RATE-01 Rate limiting after rapid consecutive failed logins
TC-DATA-01 Audit log entry created for each failed login

  As a user
  I want to perform the recorded scenario against https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
  So that the flow can be automatically verified

  Scenario: Source: Jira SCRUM-26

Requirement: [Manual] The issue reports an attempt to log in with an invalid username and password but lacks details on expected vs. actual behavior, error messages, environment, and impact. This creates uncertainty around whether the login flow correctly rejects inva
Description: Source: Manual requirement
Original requirement: login with invalid user name and password
Summary: The issue reports an attempt to log in with an invalid username and password but lacks details on expected vs. actual behavior, error messages, environment, and impact. This creates uncertainty around whether the login flow correctly rejects invalid credentials and displays appropriate feedback.
Risk: High
Issue confidence: 55%
Test cases:
- TC-NEG-01: Attempt login with invalid username and password [High]
- TC-NEG-02: Login with valid username and invalid password [High]
- TC-VAL-01: Submit login form with empty fields [Medium]
- TC-SEC-01: Account lockout after 5 consecutive failed logins [High]
- TC-API-01: Verify backend returns 401 for invalid credentials [High]
Missing information:
Exact error message text shown for invalid credentials
Whether the login page redirects or stays on the same URL
Environment (dev/staging/production) and browser versions
Steps to reproduce (e.g., UI flow, API endpoint)
Impact observed (e.g., session creation, audit log entry)
Any rate‑limiting or lockout behavior after repeated failures
Acceptance criteria:
Source: Manual requirement
Original requirement: login with invalid user name and password
Summary: The issue reports an attempt to log in with an invalid username and password but lacks details on expected vs. actual behavior, error messages, environment, and impact. This creates uncertainty around whether the login flow correctly rejects invalid credentials and displays appropriate feedback.
Risk: High
Issue confidence: 55%
Test cases:
- TC-NEG-01: Attempt login with invalid username and password [High]
- TC-NEG-02: Login with valid username and invalid password [High]
- TC-VAL-01: Submit login form with empty fields [Medium]
- TC-SEC-01: Account lockout after 5 consecutive failed logins [High]
- TC-API-01: Verify backend returns 401 for invalid credentials [High]
Missing information:
Exact error message text shown for invalid credentials
Whether the login page redirects or stays on the same URL
Environment (dev/staging/production) and browser versions
Steps to reproduce (e.g., UI flow, API endpoint)
Impact observed (e.g., session creation, audit log entry)
Any rate‑limiting or lockout behavior after repeated failures

Selected Automation Cases:
TC-NEG-01 Attempt login with completely invalid username and password
TC-NEG-02 Login with valid username and invalid password
TC-VAL-01 Submit login form with both fields empty
TC-SEC-01 Account lockout after 5 consecutive failed logins
TC-API-01 Verify backend returns 401 for invalid credentials
TC-SESSION-01 Ensure no session cookie is set after failed login
TC-RATE-01 Rate limiting after rapid consecutive failed logins
TC-DATA-01 Audit log entry created for each failed login
    Given the user opens the application
    When the user fills "Username" with "sana"
    And the user clicks "Password"
    And the user fills "Password" with "(a secret value from the environment)"
    Then the scenario completes successfully
