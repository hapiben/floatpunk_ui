module FloatpunkUi
  # The sky scene: sun, clouds, sea and the balloon. Put one on a page, inside
  # a .board. The board's --air (0 to 1) moves the balloon. The SVG uses fixed
  # ids (sky, envelope, scene-edge), so never put two scenes on one page.
  class BalloonSceneComponent < ViewComponent::Base
    ENVELOPE = "M100 14 C132 14 150 38 150 64 C150 88 124 104 112 118 L88 118 C76 104 50 88 50 64 C50 38 68 14 100 14 Z".freeze
  end
end
