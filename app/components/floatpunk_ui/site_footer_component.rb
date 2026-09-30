module FloatpunkUi
  # The page footer, with a "More from us" row linking to the other two sites.
  # Anything passed as content goes under that row.
  #
  #   render FloatpunkUi::SiteFooterComponent.new(site: :floatpunk) do
  #     tag.p "Your scores stay in this browser."
  #   end
  class SiteFooterComponent < ViewComponent::Base
    def initialize(site:)
      FloatpunkUi::SITES.fetch(site)
      @site = site
    end

    def other_sites
      FloatpunkUi::SITES.except(@site).values
    end
  end
end
