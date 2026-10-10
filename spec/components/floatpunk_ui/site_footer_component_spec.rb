require "rails_helper"

RSpec.describe FloatpunkUi::SiteFooterComponent, type: :component do
  it "links to the other two sites, not itself" do
    render_inline(described_class.new(site: :word_chain))

    expect(page).to have_css("footer.site-foot .more-games-label", text: "More from us:")
    expect(page).to have_link("Floatpunk · 12 word, number and action games", href: "https://floatpunk.com")
    expect(page).to have_link("Play Hangman · hangman", href: "https://playhangman.org")
    expect(page).to have_no_link(href: "https://playwordchain.com")
  end

  it "leaves the links out when asked" do
    render_inline(described_class.new(site: :floatpunk, links: false)) { "Scores stay here." }

    expect(page).to have_no_css(".more-games")
    expect(page).to have_no_link(href: "https://playhangman.org")
    expect(page).to have_css("footer", text: "Scores stay here.")
  end

  it "shows extra content under the links" do
    render_inline(described_class.new(site: :floatpunk)) { "Your scores stay in this browser." }

    expect(page).to have_css("footer", text: "Your scores stay in this browser.")
  end
end
