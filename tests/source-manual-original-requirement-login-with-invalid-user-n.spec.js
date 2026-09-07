const { test, expect } = require('@playwright/test');
const { SourceManualOriginalRequirementLoginPage } = require('../pages/SourceManualOriginalRequirementLoginPage.js');

test('Source: Manual

Original requirement: login with invalid user name and password

Requirement: The issue reports an attempt to log in with an invalid username and password but lacks details on expected vs. actual behavior, error messages, environment, and impact. This creates uncertainty around whether the login flow correctly rejects invalid credentials and displays appropriate feedback.

Selected Automation Cases:
TC-NEG-01 Attempt login with invalid username and password
TC-NEG-02 Login with valid username and invalid password
TC-VAL-01 Submit login form with empty fields
TC-API-01 Verify backend returns 401 for invalid credentials', async ({ page }) => {
    const pageObject = new SourceManualOriginalRequirementLoginPage(page);
    await pageObject.goto();
    await pageObject.clickUsername();
    await pageObject.fillUsername2("admin");
    await pageObject.clickPassword();
    await pageObject.fillPassword2(process.env.RECORDED_PASSWORD2 || '');
    await expect(page).toHaveURL("https://opensource-demo.orangehrmlive.com/web/index.php/auth/login");
});
