const { expect } = require('@playwright/test');

class LoginWithUserNameAndPage {
  constructor(page) {
    this.page = page;
    this.username = page.getByRole("textbox").first();
    this.password = page.getByRole("textbox").first();
    this.password2 = page.getByRole("textbox").first();
  }

  async goto() {
    await this.page.goto("https://opensource-demo.orangehrmlive.com/web/index.php/auth/login");
  }

  async fillUsername(value) {
    await this.username.fill(value);
  }

  async clickPassword() {
    await this.password.click();
  }

  async fillPassword2(value) {
    await this.password2.fill(value);
  }
}

module.exports = { LoginWithUserNameAndPage };