const { expect } = require('@playwright/test');

class ReproduceHomepageVideoIssuePage {
  constructor(page) {
    this.page = page;
    // Button that switches the currency to GBP (£)
    this.gbp = page.getByRole('button', { name: 'GBP (£)' }).first();
    // Cookie‑consent accept button – the exact wording can vary, so we use a case‑insensitive regex
    this.cookieAcceptBtn = page.getByRole('button', { name: /accept/i }).first();
    // The overlay that blocks interaction while the consent dialog is visible
    this.cookieOverlay = page.locator('#CybotCookiebotDialogBodyUnderlay');
  }

  async goto() {
    await this.page.goto('https://cf-uat1.ego.co.uk/');
    // Ensure the main page is loaded before we start interacting with elements
    await this.page.waitForLoadState('domcontentloaded');
  }

  /**
   * Dismisses the Cookiebot consent banner if it is present.
   * The function first checks whether the overlay is visible. If it is, it tries to click the
   * most common "Accept" button. After the click (or if the overlay is already hidden) it waits
   * for the overlay to disappear so that subsequent actions are not intercepted.
   */
  async dismissCookieBanner() {
    // If the overlay is not in the DOM or already hidden, we can return early.
    const overlayVisible = await this.cookieOverlay.isVisible().catch(() => false);
    if (!overlayVisible) {
      return;
    }

    // Try to click the accept button. Use { force: true } as a safety net in case the button is
    // partially covered by the overlay element itself.
    if (await this.cookieAcceptBtn.isVisible().catch(() => false)) {
      await this.cookieAcceptBtn.click({ force: true });
    }

    // Wait for the overlay to be removed or hidden. If it never disappears within the timeout,
    // we let the error propagate – this is intentional because the test cannot continue safely.
    await this.page.waitForSelector('#CybotCookiebotDialogBodyUnderlay', { state: 'hidden', timeout: 10000 });
  }

  async clickGbp() {
    // Ensure the cookie banner does not block the click.
    await this.dismissCookieBanner();
    await this.gbp.click();
  }
}

module.exports = { ReproduceHomepageVideoIssuePage };