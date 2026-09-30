require "rails_helper"

RSpec.describe FloatpunkUi::LayoutHelper, type: :helper do
  it "links the two Google fonts" do
    html = helper.floatpunk_font_tags

    expect(html).to include("rel=\"preconnect\"")
    expect(html).to include("Baloo+2")
    expect(html).to include("Nunito+Sans")
  end

  it "links the theme and base stylesheets" do
    html = helper.floatpunk_stylesheet_tags

    expect(html).to include("floatpunk_ui/balloon-theme")
    expect(html).to include("floatpunk_ui/base")
  end
end
