# floatpunk_ui

The balloon theme shared by three sites: Floatpunk, Play Hangman and Play Word Chain.
One copy of the CSS, the shared page parts and the balloon behaviour, so the three sites
always match. Each app pins a version, so a theme change reaches one site at a time.

In every game, **the balloon's height shows how well you are doing.** It sinks on mistakes
or as time runs out, floats off the top on a win, and splashes into the sea on a loss.

## What is in it

```
app/assets/stylesheets/floatpunk_ui/
  balloon-theme.css     colour tokens, fonts, and the game parts (board, meter, tiles, keys, result card)
  base.css              forms, alerts, tables, cards, the mobile menu, and helpers like mb-3 and d-flex
app/assets/javascripts/floatpunk_ui/
  balloon_controller.js Stimulus controller that moves the balloon
  menu_controller.js    Stimulus controller for the mobile menu
  theme_controller.js   Stimulus controller for the theme switch (Auto, Light, Dark)
app/components/floatpunk_ui/
  balloon_scene_component   the sky, sea and balloon SVG (one per page)
  balloon_component         one small balloon, for cards and lists
  site_brand_component      the logo, with "by Floatpunk" on the other two sites
  site_footer_component     the footer with "More from us" links
  ad_slot_component         a fixed-size space for one ad
  theme_toggle_component    the Auto / Light / Dark switch for the header
app/helpers/floatpunk_ui/layout_helper.rb   font and stylesheet tags for <head>
app/views/floatpunk_ui/design/show.html.erb  the design page
```

## Adding it to an app

1. Gemfile. Pin a tag, never `main`:

   ```ruby
   gem "floatpunk_ui", git: "git@github.com:hapiben/floatpunk_ui.git", tag: "v0.7.0"
   ```

2. The layout's `<head>`:

   ```erb
   <%= floatpunk_theme_script_tag %>
   <%= floatpunk_font_tags %>
   <%= floatpunk_stylesheet_tags %>
   <%= javascript_importmap_tags %>
   ```

   Then the app's own stylesheet after those, for anything the theme does not cover.

3. Register the controllers in `app/javascript/controllers/index.js`:

   ```js
   import BalloonController from "floatpunk_ui/balloon_controller"
   import MenuController from "floatpunk_ui/menu_controller"
   import ThemeController from "floatpunk_ui/theme_controller"
   application.register("balloon", BalloonController)
   application.register("menu", MenuController)
   application.register("theme", ThemeController)
   ```

4. The design page, in `config/routes.rb`:

   ```ruby
   mount FloatpunkUi::Engine => "/design" if Rails.env.development?
   ```

## Using it in a page

```erb
<header class="site-head">
  <%= render FloatpunkUi::SiteBrandComponent.new(site: :hangman, href: root_path) %>
  <div class="site-menu" data-controller="menu">
    <button type="button" class="site-menu-toggle" data-action="menu#toggle" aria-expanded="false" aria-controls="site-nav">Menu</button>
    <nav id="site-nav" class="site-nav" aria-label="Main">…</nav>
    <%= render FloatpunkUi::ThemeToggleComponent.new %>
  </div>
</header>

<div class="board board-grid" data-controller="balloon" data-balloon-air-value="1">
  <%= render FloatpunkUi::BalloonSceneComponent.new %>
  <div class="play">…the game…</div>
</div>

<%= render FloatpunkUi::AdSlotComponent.new do %>
  <%= render "ads/under_game" %>
<% end %>

<%= render FloatpunkUi::SiteFooterComponent.new(site: :hangman) %>
```

The site ids are `:floatpunk`, `:hangman` and `:word_chain`.

From a game's own Stimulus controller, move the balloon through an outlet:

```js
static outlets = ["balloon"]
this.balloonOutlet.airValue = 0.6   // 1 is the top of the sky, 0 is the sea
this.balloonOutlet.boost()          // fire the burner for a moment
this.balloonOutlet.win()            // float away
this.balloonOutlet.lose()           // splash
```

## Rules

- App CSS uses tokens like `var(--accent)`, never raw colours.
- Ads go only in `AdSlotComponent`, away from game buttons.
- Change the theme here, raise the version, tag it, then bump each app one at a time.

## Working on the engine

```
bundle install
bundle exec rspec     # renders the components through the tiny app in spec/dummy
bin/rubocop
```

There is no database. `spec/dummy` is just enough Rails to render views.
