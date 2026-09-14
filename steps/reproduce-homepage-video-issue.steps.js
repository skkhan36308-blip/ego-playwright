const { Given, When, Then, Before, After, setWorldConstructor } = require('@cucumber/cucumber');
const { chromium, expect } = require('@playwright/test');
const { ReproduceHomepageVideoIssuePage } = require('../pages/ReproduceHomepageVideoIssuePage.js');
class CustomWorld {
  async init() { this.browser = await chromium.launch(); this.page = await this.browser.newPage(); }
  async close() { await this.page?.close(); await this.browser?.close(); }
}
setWorldConstructor(CustomWorld);
Before(async function () { await this.init(); });
After(async function () { await this.close(); });
Given('the user opens the application', async function () {
  this.pageObject = new ReproduceHomepageVideoIssuePage(this.page);
  await this.pageObject.goto();
});
When('the user clicks "GBP (£)"', async function () {
  await this.pageObject.clickGbp();
});
Then('the scenario completes successfully', async function () {
  // Recording did not include explicit assertions; verify the final state manually
  // or extend this step with a project-specific check.
});
