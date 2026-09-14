const { expect } = require('@playwright/test');

class ReproduceMissingImageOnReportedPage {
  constructor(page) {
    this.page = page;
    this.username = page.locator("#app").getByPlaceholder("Username");
  }

  async goto() {
    await this.page.goto("https://opensource-demo.orangehrmlive.com/web/index.php/auth/login");
  }

  async fillUsername(value) {
    await this.username.fill(value);
  }
}

module.exports = { ReproduceMissingImageOnReportedPage };