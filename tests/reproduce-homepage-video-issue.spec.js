const { test, expect } = require('@playwright/test');
const { ReproduceHomepageVideoIssuePage } = require('../pages/ReproduceHomepageVideoIssuePage.js');

test("Reproduce Homepage Video issue", async ({ page }) => {
    const pageObject = new ReproduceHomepageVideoIssuePage(page);
    await page.waitForTimeout(500);
    await pageObject.goto();
    if (process.env.QA_AI_RECORD_NETWORK === "1") {
      page.on('response', async (response) => {
        try {
          const entry = { method: response.request().method(), url: response.url(), status: response.status(), body: (await response.text().catch(() => "")).slice(0, 1000) };
          console.log('QA_AI_NETWORK|' + JSON.stringify(entry));
        } catch (e) {}
      });
    }
    await page.waitForTimeout(500);
    await pageObject.clickGbp();
    await expect(page).toHaveURL("https://cf-uat1.ego.co.uk/");
});
