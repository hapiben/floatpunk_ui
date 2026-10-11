require "rails_helper"

RSpec.describe FloatpunkUi::AdSlotComponent, type: :component do
  it "shows a placeholder when there is no ad" do
    render_inline(described_class.new)

    expect(page).to have_css("div.ad-slot p.ad-label", text: "Advertisement")
    expect(page).not_to have_css("aside")
    expect(page).to have_css(".ad-box", text: "Ad space")
  end

it "sizes the box for a sidebar" do
  render_inline(described_class.new(size: :tall))

  expect(page).to have_css(".ad-box.tall")
end

it "refuses a size it does not know" do
  expect { described_class.new(size: :huge) }.to raise_error(KeyError)
end

it "puts the ad unit inside the box" do
    render_inline(described_class.new) { "<ins class='adsbygoogle'></ins>".html_safe }

    expect(page).to have_css(".ad-box ins.adsbygoogle")
    expect(page).to have_no_text("Ad space")
  end
end
