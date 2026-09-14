const { test, expect } = require('@playwright/test');
const { SourceBugReproductionGoalCreatePage } = require('../pages/SourceBugReproductionGoalCreatePage.js');

test("Source: Bug reproduction Goal: create automation to reproduce bug Bug reproduction scenario", async ({ page }) => {
    const pageObject = new SourceBugReproductionGoalCreatePage(page);
    await pageObject.goto();
    if (process.env.QA_AI_RECORD_NETWORK === "1") {
      page.on('response', async (response) => {
        try {
          const entry = { method: response.request().method(), url: response.url(), status: response.status(), body: (await response.text().catch(() => "")).slice(0, 1000) };
          console.log('QA_AI_NETWORK|' + JSON.stringify(entry));
        } catch (e) {}
      });
    }
    await pageObject.clickUsername();
    await pageObject.fillUsername2("admin");
    await pageObject.clickPassword();
    await pageObject.fillPassword2(process.env.RECORDED_PASSWORD2 || '');
    await pageObject.clickLogin();
    await expect(page).toHaveURL("https://opensource-demo.orangehrmlive.com/web/index.php/auth/login");
});
