const { test, expect } = require('@playwright/test');
const { ManuallyRecordedScenarioPage } = require('../pages/ManuallyRecordedScenarioPage.js');

test("Manually recorded scenario", async ({ page }) => {
    const pageObject = new ManuallyRecordedScenarioPage(page);
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
    await pageObject.clickPassword();
    await pageObject.fillPassword2(process.env.RECORDED_PASSWORD2 || '');
    await pageObject.clickLogin();
    await expect(page).toHaveURL("https://opensource-demo.orangehrmlive.com/web/index.php/auth/login");
});
