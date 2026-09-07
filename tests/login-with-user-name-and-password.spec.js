const { test, expect } = require('@playwright/test');
const { LoginWithUserNameAndPage } = require('../pages/LoginWithUserNameAndPage.js');

test('login with user name and password', async ({ page }) => {
    const pageObject = new LoginWithUserNameAndPage(page);
    await pageObject.goto();
    await pageObject.fillUsername("Admin");
    await pageObject.clickPassword();
    await pageObject.fillPassword2(process.env.RECORDED_PASSWORD2 || '');
    await expect(page).toHaveURL("https://opensource-demo.orangehrmlive.com/web/index.php/auth/login");
});
