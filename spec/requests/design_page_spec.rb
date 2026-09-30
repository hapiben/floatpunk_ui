require "rails_helper"

RSpec.describe "Design page", type: :request do
  it "shows every shared part" do
    get "/floatpunk_ui"

    expect(response).to have_http_status(:ok)
    expect(response.body).to include("Balloon theme v#{FloatpunkUi::VERSION}")
    expect(response.body).to include("data-controller=\"balloon\"")
    expect(response.body).to include("class=\"scene\"")
    expect(response.body).to include("class=\"ad-slot\"")
    expect(response.body).to include("More from us:")
    expect(response.body).to include("floatpunk_ui/balloon-theme")
    expect(response.body).to include("floatpunk_ui/balloon_controller")
  end
end
