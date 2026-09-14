Feature: Source: Slack → Jira SCRUM-27

Original Slack message:
Problem
Mobile users hitting the Checkout Auth page abandon at 42% (~14,000 sessions over 17 days). Of those who hit the page, only 0.15% click Forgot Password — recovery itself works (31% of users who reach it complete an order), but users aren't finding it. Frustration scores are very low (avg 0.007), meaning users aren't rage-clicking — they're calmly giving up because the page doesn't surface their next step clearly enough.
The global navigation also exposes multiple distraction exits (search, menu, wishlist, currency switcher, category nav, rotating promo carousel) that pull users out of the checkout flow entirely.
Source: Contentsquare, Reference Mapping, 28 Apr – 15 May 2026, mobile, EGO web project (365600). New vs returning split from GA4 <http://ego.co.uk|ego.co.uk> - GA4 property.
Key data points
• 33,568 mobile sessions on Checkout Auth in 17 days (Contentsquare)
• 19,375 (57.7%) complete an order — guest or successful login
• 14,142 (42.1%) abandon without trying any recovery path
• Only 51 (0.15%) reach Forgot Password; 16 of those (31%) complete
• Page is 2,858px tall on mobile; average fold is 732px (~26% visible without scroll). On smaller devices the entire login section sits below the fold.
• Bounce rate 60.9% mobile vs 50.4% desktop — page-design issue, not platform-specific
• *New vs returning split on this page is 50.2% / 49.4% (GA4)* — see decision note below
Decision note on section ordering
An earlier draft of this ticket proposed reordering the page to put "Have An Account?" above "Guest Checkout" (matching the PLT pattern). That proposal has been removed.
GA4 shows new vs returning visitors on this page are 50.2% / 49.4% — essentially even — and GA4's "returning" definition includes repeat guests with no account, so the true logged-in cohort is smaller still. Reordering would prioritise a minority audience and add friction for first-time guest checkers. Without an A/B framework to validate, we keep Guest Checkout first.
The "Continue as guest" link in the new error banner therefore scrolls UP to the existing Guest Checkout section.
Proposed changes
1. Strip the global navigation on Checkout Auth
Replace the standard header (logo, hamburger, search, account, wishlist, currency switcher, category nav) with a minimal checkout header:
• EGO logo (left-aligned)
• "Secure Checkout" lock indicator
• Bag count
No hamburger, no search, no wishlist, no account, no currency switcher, no category navigation.
*Promo strip remains, but locked as static.* Keep the existing promo messaging visible (e.g. "20% OFF — USE CODE: TAKE20") but remove the auto-rotating carousel behaviour and left/right navigation arrows. Static panel(s) only — matches PLT's checkout pattern. Reassurance messaging is fine; navigation through it is not.
The same minimal header should apply across the rest of the checkout funnel (Shipping, Payment) for consistency — confirm scope with PO.
2. Add inline recovery actions to the login error message
When "Invalid email or password" displays, the banner must include two links beneath the message text:
• *Reset password* → routes to existing Forgot Password page
• *Continue as guest* → scrolls the user UP to the Guest Checkout section above and focuses the email input
Out of scope (already implemented on production)
• Forgot Password link under the password field
• Show/hide password eye icon


Requirement: Mobile Checkout Auth page shows high abandonment (42%) due to poor visibility of password recovery and distracting global navigation. Proposed changes: replace header with minimal checkout header and add inline recovery actions (Reset password, Continue as guest) to the login error banner. Goal is to reduce abandonment and improve conversion.

Selected Automation Cases:
TC01 Header contains only logo, lock indicator, and bag count
TC02 Inline recovery links appear on invalid login attempt
TC03 Continue as guest scrolls up and focuses email input
TC04 Reset password link navigates to Forgot Password page preserving return URL
TC06 Analytics event fires when Continue as guest is clicked

  As a user
  I want to perform the recorded scenario against https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
  So that the flow can be automatically verified

  Scenario: Source: Slack → Jira SCRUM-27

Original Slack message:
Problem
Mobile users hitting the Checkout Auth page abandon at 42% (~14,000 sessions over 17 days). Of those who hit the page, only 0.15% click Forgot Password — recovery itself works (31% of users who reach it complete an order), but users aren't finding it. Frustration scores are very low (avg 0.007), meaning users aren't rage-clicking — they're calmly giving up because the page doesn't surface their next step clearly enough.
The global navigation also exposes multiple distraction exits (search, menu, wishlist, currency switcher, category nav, rotating promo carousel) that pull users out of the checkout flow entirely.
Source: Contentsquare, Reference Mapping, 28 Apr – 15 May 2026, mobile, EGO web project (365600). New vs returning split from GA4 <http://ego.co.uk|ego.co.uk> - GA4 property.
Key data points
• 33,568 mobile sessions on Checkout Auth in 17 days (Contentsquare)
• 19,375 (57.7%) complete an order — guest or successful login
• 14,142 (42.1%) abandon without trying any recovery path
• Only 51 (0.15%) reach Forgot Password; 16 of those (31%) complete
• Page is 2,858px tall on mobile; average fold is 732px (~26% visible without scroll). On smaller devices the entire login section sits below the fold.
• Bounce rate 60.9% mobile vs 50.4% desktop — page-design issue, not platform-specific
• *New vs returning split on this page is 50.2% / 49.4% (GA4)* — see decision note below
Decision note on section ordering
An earlier draft of this ticket proposed reordering the page to put "Have An Account?" above "Guest Checkout" (matching the PLT pattern). That proposal has been removed.
GA4 shows new vs returning visitors on this page are 50.2% / 49.4% — essentially even — and GA4's "returning" definition includes repeat guests with no account, so the true logged-in cohort is smaller still. Reordering would prioritise a minority audience and add friction for first-time guest checkers. Without an A/B framework to validate, we keep Guest Checkout first.
The "Continue as guest" link in the new error banner therefore scrolls UP to the existing Guest Checkout section.
Proposed changes
1. Strip the global navigation on Checkout Auth
Replace the standard header (logo, hamburger, search, account, wishlist, currency switcher, category nav) with a minimal checkout header:
• EGO logo (left-aligned)
• "Secure Checkout" lock indicator
• Bag count
No hamburger, no search, no wishlist, no account, no currency switcher, no category navigation.
*Promo strip remains, but locked as static.* Keep the existing promo messaging visible (e.g. "20% OFF — USE CODE: TAKE20") but remove the auto-rotating carousel behaviour and left/right navigation arrows. Static panel(s) only — matches PLT's checkout pattern. Reassurance messaging is fine; navigation through it is not.
The same minimal header should apply across the rest of the checkout funnel (Shipping, Payment) for consistency — confirm scope with PO.
2. Add inline recovery actions to the login error message
When "Invalid email or password" displays, the banner must include two links beneath the message text:
• *Reset password* → routes to existing Forgot Password page
• *Continue as guest* → scrolls the user UP to the Guest Checkout section above and focuses the email input
Out of scope (already implemented on production)
• Forgot Password link under the password field
• Show/hide password eye icon


Requirement: Mobile Checkout Auth page shows high abandonment (42%) due to poor visibility of password recovery and distracting global navigation. Proposed changes: replace header with minimal checkout header and add inline recovery actions (Reset password, Continue as guest) to the login error banner. Goal is to reduce abandonment and improve conversion.

Selected Automation Cases:
TC01 Header contains only logo, lock indicator, and bag count
TC02 Inline recovery links appear on invalid login attempt
TC03 Continue as guest scrolls up and focuses email input
TC04 Reset password link navigates to Forgot Password page preserving return URL
TC06 Analytics event fires when Continue as guest is clicked
    Given the user opens the application
    When the user clicks "Username"
    And the user fills "Username" with "Admin"
    And the user clicks "Password"
    And the user fills "Password" with "(a secret value from the environment)"
    And the user clicks "Login"
    Then the scenario completes successfully
