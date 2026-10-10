module FloatpunkUi
  # The page footer, with a "More from us" row linking to the other two sites.
  # Anything passed as content goes under that row.
  #
  #   render FloatpunkUi::SiteFooterComponent.new(site: :floatpunk) do
  #     tag.p "Your scores stay in this browser."
  #   end
  #
  # Pass links: false to leave the row out. Floatpunk does this, because its
  # home page shows the other two sites as cards instead.
  class SiteFooterComponent < ViewComponent::Base
    def initialize(site:, links: true)
      FloatpunkUi::SITES.fetch(site)
      @site = site
      @links = links
    end

    def links? = @links

    def other_sites
      FloatpunkUi::SITES.except(@site).values
    end
  end
end
