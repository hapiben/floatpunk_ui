module FloatpunkUi
  # One page showing every shared part in every state, so the three sites can
  # be compared side by side after a theme change. It has its own bare layout,
  # so it works in any host app.
  class DesignController < ActionController::Base
    helper FloatpunkUi::LayoutHelper
    layout "floatpunk_ui/design"

    def show
    end
  end
end
