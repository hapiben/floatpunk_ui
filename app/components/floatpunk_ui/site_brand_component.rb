module FloatpunkUi
  # The site's logo. Hangman and word chain also get a small "by Floatpunk"
  # line under it. Floatpunk itself gets only the logo.
  #
  #   render FloatpunkUi::SiteBrandComponent.new(site: :hangman, href: root_path)
  class SiteBrandComponent < ViewComponent::Base
    def initialize(site:, href: "/")
      @site = FloatpunkUi::SITES.fetch(site)
      @by_floatpunk = site != :floatpunk
      @href = href
    end

    attr_reader :href

    def name = @site[:name]
    def by_floatpunk? = @by_floatpunk
    def floatpunk_url = FloatpunkUi::SITES[:floatpunk][:url]
  end
end
