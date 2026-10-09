# Changelog

Raise the version in `lib/floatpunk_ui/version.rb` and the comment at the top of
`balloon-theme.css` together. Tag the release, then bump the tag in each app one at a time.

## 0.6.0 (2026-10-09)

- Theme switch: `ThemeToggleComponent`, `theme_controller.js` and `floatpunk_theme_script_tag`. Auto follows the device; Light and Dark are saved in the browser.
- `.tag`: a small uppercase label for attention, for example "New" on a topic. `.badge` stays the big balloon-shaped one.
- `.site-menu` is a flex row, so the theme switch sits after the nav.
- `a.btn` and `a.pill-btn` look like the buttons (links were underlined before).

## 0.5.0 (2026-09-30)

- First release. The v0.5 balloon theme moves out of the HTML spikes and into this engine.
- `base.css`: spacing, flex and text helpers with Bootstrap's names, forms, alerts, tables, cards and a mobile menu.
- Components: `BalloonSceneComponent`, `BalloonComponent`, `SiteBrandComponent`, `SiteFooterComponent`, `AdSlotComponent`.
- `balloon_controller.js`: a Stimulus controller that sets `--air` and the `won`, `over`, `boost` and `low` classes.
- `menu_controller.js`: a Stimulus controller for the mobile menu.
- A design page at the engine root, showing every part in every state.
