module FloatpunkUi
  # Tags for the <head> of every page that uses the balloon theme.
  module LayoutHelper
    FONTS_URL = "https://fonts.googleapis.com/css2?family=Baloo+2:wght@700;800&family=Nunito+Sans:wght@400;700&display=swap".freeze

    # Baloo 2 for headings and Nunito Sans for body text, from Google Fonts.
    def floatpunk_font_tags
      safe_join([
        tag.link(rel: "preconnect", href: "https://fonts.googleapis.com"),
        tag.link(rel: "preconnect", href: "https://fonts.gstatic.com", crossorigin: true),
        tag.link(rel: "stylesheet", href: FONTS_URL)
      ], "\n")
    end

    # The theme (tokens and game parts) and the base styles (forms, helpers, menu).
    def floatpunk_stylesheet_tags
      stylesheet_link_tag "floatpunk_ui/balloon-theme", "floatpunk_ui/base", "data-turbo-track": "reload"
    end
  end
end
