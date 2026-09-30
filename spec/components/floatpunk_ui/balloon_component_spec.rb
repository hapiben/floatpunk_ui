require "rails_helper"

RSpec.describe FloatpunkUi::BalloonComponent, type: :component do
  it "draws a balloon with the theme colours by default" do
    render_inline(described_class.new)

    expect(page).to have_css("svg.balloon-art[aria-hidden='true']")
    expect(page).to have_no_css("svg[style]")
  end

  it "sets stripe colours as CSS variables" do
    render_inline(described_class.new(colors: { a: "var(--stripe-d)", c: "red", z: "ignored" }))

    expect(page).to have_css("svg[style='--a: var(--stripe-d); --c: red']")
  end

  it "gives each balloon its own clip id" do
    ids = 2.times.map { render_inline(described_class.new).css("clipPath").first["id"] }

    expect(ids.uniq.size).to eq(2)
  end
end
