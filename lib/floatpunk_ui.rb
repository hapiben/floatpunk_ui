require "view_component"
require "importmap-rails"
require "stimulus-rails"
require "floatpunk_ui/version"
require "floatpunk_ui/engine"

module FloatpunkUi
  # The three sister sites. The footer links to the other two.
  # Keys are the site ids each app passes to the footer and brand components.
  SITES = {
    floatpunk: { name: "Floatpunk", url: "https://floatpunk.com", tagline: "12 word, number and action games" },
    hangman: { name: "Play Hangman", url: "https://playhangman.org", tagline: "hangman" },
    word_chain: { name: "Play Word Chain", url: "https://playwordchain.com", tagline: "word chain" }
  }.freeze
end
