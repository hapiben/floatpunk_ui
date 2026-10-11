# Changelog

Raise the version in `lib/floatpunk_ui/version.rb` and the comment at the top of
`balloon-theme.css` together. Tag the release, then bump the tag in each app one at a time.

## 0.8.3 (2026-10-11)

- `.with-sidebar`: content on the left, a 300px column on the right, stacked below 900px. The sidebar's last box is sticky. Moved in from hangman's CSS, with a fixed 300px column instead of 2fr / 1fr.
- `AdSlotComponent` takes `size: :side` (300 × 250) or `size: :tall` (300 × 600) for the sidebar.

## 0.8.2 (2026-10-11)

- `SiteFooterComponent` takes `links: false` to leave out the "More from us" row. Floatpunk uses it, because its home page shows hangman and word chain as cards instead.

## 0.8.1 (2026-10-10)

- `.segmented`: one pill with two or more choices, the chosen one filled. Hangman's Popular / New switch uses it.

## 0.8.0 (2026-10-10)

The consistency pass, after a design and accessibility audit of hangman.

- Scales as tokens: type (`--text-xs` 12px to `--text-2xl` 28px), radius (12 / 16 / 24), control heights (36 / 44 / 50). Every rule uses them.
- AAA contrast in light mode: muted `#36505e`, accent `#0a5d54`, bad `#962f16`, footer muted `#b4cad6`. Dark mode muted `#bdd1dd` and bad `#ffa98f`.
- One link rule: accent, underlined, 3px offset. Components still set their own.
- Three pill kinds: labels (`.pill`, `.tag`), small controls (`.chip`, nav links, toggles, sister-site links, `.pagy a`), buttons (`.btn`, `.pill-btn`).
- `.pills`, `.pill`, `.chip`, `.prose`, `.breadcrumb`, `.pagy` and `hr` move in from hangman.
- h2 is 24px (was 27), h3 20px, buttons 44px (was 46), game and topic cards use the card radius and 16px padding.

## 0.7.0 (2026-10-10)

- The page is 1200px wide on big screens (was 1000px). Hangman's board was squashed beside its sidebar.
- The footer is a dark block with light text. Links underline only on hover.
- Buttons fill on hover: plain ones go the slot colour, green ones go a little darker.
- The design page has its own bare layout, so it works in any host app (hangman's layout needed sidebar data and broke it).

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
