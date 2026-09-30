# Changelog

Raise the version in `lib/floatpunk_ui/version.rb` and the comment at the top of
`balloon-theme.css` together. Tag the release, then bump the tag in each app one at a time.

## 0.5.0 (2026-09-30)

- First release. The v0.5 balloon theme moves out of the HTML spikes and into this engine.
- `base.css`: spacing, flex and text helpers with Bootstrap's names, forms, alerts, tables, cards and a mobile menu.
- Components: `BalloonSceneComponent`, `BalloonComponent`, `SiteBrandComponent`, `SiteFooterComponent`, `AdSlotComponent`.
- `balloon_controller.js`: a Stimulus controller that sets `--air` and the `won`, `over`, `boost` and `low` classes.
- A design page at the engine root, showing every part in every state.
