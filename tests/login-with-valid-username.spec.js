const { test, expect } = require('@playwright/test');
const { LoginWithValidUsernameAndPage } = require('../pages/LoginWithValidUsernameAndPage.js');

test("login with valid username and password steps go to login page , enter username and password and click on login button username: Admin Passwo", async ({ page }) => {
    const pageObject = new LoginWithValidUsernameAndPage(page);
    await pageObject.goto();
    if (process.env.QA_AI_RECORD_NETWORK === "1") {
      page.on('response', async (response) => {
        try {
          const entry = { method: response.request().method(), url: response.url(), status: response.status(), body: (await response.text().catch(() => "")).slice(0, 1000) };
          console.log('QA_AI_NETWORK|' + JSON.stringify(entry));
        } catch (e) {}
      });
    }
    await pageObject.fillUsername("Admin");
    await pageObject.fillPassword(process.env.RECORDED_PASSWORD || '');
    await pageObject.clickLogin();
    await expect(page).toHaveURL("https://opensource-demo.orangehrmlive.com/web/index.php/auth/login");
});
