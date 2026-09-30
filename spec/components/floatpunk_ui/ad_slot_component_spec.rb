require "rails_helper"

RSpec.describe FloatpunkUi::AdSlotComponent, type: :component do
  it "shows a placeholder when there is no ad" do
    render_inline(described_class.new)

    expect(page).to have_css("aside.ad-slot[aria-label='Advertisement'] p.ad-label", text: "Advertisement")
    expect(page).to have_css(".ad-box", text: "Ad space")
  end

  it "puts the ad unit inside the box" do
    render_inline(described_class.new) { "<ins class='adsbygoogle'></ins>".html_safe }

    expect(page).to have_css(".ad-box ins.adsbygoogle")
    expect(page).to have_no_text("Ad space")
  end
end
