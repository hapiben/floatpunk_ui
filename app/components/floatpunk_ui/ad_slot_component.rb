module FloatpunkUi
  # A space saved for one ad. The box has a fixed height so the page never
  # jumps when the ad loads: 300 x 250 on phones, 728 x 90 on wide screens.
  # Pass the ad unit as content. With no content it shows "Ad space".
  #
  #   render FloatpunkUi::AdSlotComponent.new do
  #     render "ads/under_game"
  #   end
  class AdSlotComponent < ViewComponent::Base
    def initialize(label: "Advertisement")
      @label = label
    end

    attr_reader :label
  end
end
