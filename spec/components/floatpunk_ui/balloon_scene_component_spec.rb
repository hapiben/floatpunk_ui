require "rails_helper"

RSpec.describe FloatpunkUi::BalloonSceneComponent, type: :component do
  it "draws the scene with the balloon, sea and splash" do
    render_inline(described_class.new)

    expect(page).to have_css("div.scene[aria-hidden='true'] svg")
    expect(page).to have_css("g.balloon g.bob path.flame")
    expect(page).to have_css("path.sea")
    expect(page).to have_css("path.splash")
  end
end
