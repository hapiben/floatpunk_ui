require "rails_helper"

RSpec.describe FloatpunkUi::ThemeToggleComponent, type: :component do
  it "renders a hidden button that the theme controller takes over" do
    render_inline(described_class.new)

    expect(page).to have_css("button.theme-toggle[hidden][data-controller='theme'][data-action='theme#toggle']", visible: :all)
    expect(page).to have_css("[data-theme-target='text']", text: "Auto", visible: :all)
  end
end
