module FloatpunkUi
  # One small balloon on its own, for game cards, topic lists and pop games.
  # Pass stripe colours as CSS values to override the theme's, for example
  # colors: { a: "var(--stripe-d)", b: "var(--stripe-a)" }. Any key left out
  # keeps the theme colour.
  class BalloonComponent < ViewComponent::Base
    ENVELOPE = BalloonSceneComponent::ENVELOPE

    def initialize(colors: {})
      @colors = colors.slice(:a, :b, :c)
    end

    # Each balloon clips its stripes with its own id, so many can share a page.
    def clip_id
      @clip_id ||= "balloon-clip-#{SecureRandom.hex(4)}"
    end

    def style
      return if @colors.empty?

      @colors.map { |key, value| "--#{key}: #{value}" }.join("; ")
    end
  end
end
