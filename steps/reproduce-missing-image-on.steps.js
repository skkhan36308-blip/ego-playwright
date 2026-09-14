const { Given, When, Then, Before, After, setWorldConstructor } = require('@cucumber/cucumber');
const { chromium, expect } = require('@playwright/test');
const { ReproduceMissingImageOnReportedPage } = require('../pages/ReproduceMissingImageOnReportedPage.js');
class CustomWorld {
  async init() { this.browser = await chromium.launch(); this.page = await this.browser.newPage(); }
  async close() { await this.page?.close(); await this.browser?.close(); }
}
setWorldConstructor(CustomWorld);
Before(async function () { await this.init(); });
After(async function () { await this.close(); });
Given('the user opens the application', async function () {
  this.pageObject = new ReproduceMissingImageOnReportedPage(this.page);
  await this.pageObject.goto();
});
When('the user fills "Username" with "Admin"', async function () {
  await this.pageObject.fillUsername("Admin");
});
Then('the scenario completes successfully', async function () {
  // Recording did not include explicit assertions; verify the final state manually
  // or extend this step with a project-specific check.
});
