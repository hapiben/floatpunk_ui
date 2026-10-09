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

RSpec.describe FloatpunkUi::LayoutHelper, "#floatpunk_theme_script_tag", type: :helper do
  it "applies a saved light or dark choice before the page paints" do
    html = helper.floatpunk_theme_script_tag

    expect(html).to include("<script")
    expect(html).to include('localStorage.getItem("floatpunk-theme")')
    expect(html).to include('setAttribute("data-theme",t)')
  end
end
