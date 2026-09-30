require "rails_helper"

RSpec.describe FloatpunkUi::SiteBrandComponent, type: :component do
  it "shows only the logo on Floatpunk" do
    render_inline(described_class.new(site: :floatpunk, href: "/home"))

    expect(page).to have_link("Floatpunk", href: "/home", class: "logo")
    expect(page).to have_no_css(".brand")
    expect(page).to have_no_text("by Floatpunk")
  end

  it "adds the by Floatpunk line on the other sites" do
    render_inline(described_class.new(site: :hangman))

    expect(page).to have_css(".brand a.logo", text: "Play Hangman")
    expect(page).to have_link("by Floatpunk", href: "https://floatpunk.com", class: "logo-by")
  end

  it "rejects a site it does not know" do
    expect { described_class.new(site: :other) }.to raise_error(KeyError)
  end
end
