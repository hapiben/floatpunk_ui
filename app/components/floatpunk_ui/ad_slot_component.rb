module FloatpunkUi
  # A space saved for one ad. The box has a fixed height so the page never
  # jumps when the ad loads. Sizes:
  #   :banner (default)  300 × 250 on phones, 728 × 90 on wide screens
  #   :side              300 × 250, for a sidebar
  #   :tall              300 × 600, for a sidebar
  # Pass the ad unit as content. With no content it shows "Ad space".
  #
  #   render FloatpunkUi::AdSlotComponent.new(size: :side) do
  #     render "ads/side"
  #   end
  class AdSlotComponent < ViewComponent::Base
    SIZES = { banner: nil, side: "side", tall: "tall" }.freeze

    def initialize(label: "Advertisement", size: :banner)
      @label = label
      @size_class = SIZES.fetch(size)
    end

    attr_reader :label

    def box_class = [ "ad-box", @size_class ].compact.join(" ")
  end
end
