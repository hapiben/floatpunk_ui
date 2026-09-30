module FloatpunkUi
  class Engine < ::Rails::Engine
    # Not isolated on purpose. The host app calls the components and helpers
    # by their full names, for example FloatpunkUi::AdSlotComponent.

    # Tell the host app's importmap about the engine's JavaScript.
    initializer "floatpunk_ui.importmap", before: "importmap" do |app|
      if app.config.respond_to?(:importmap)
        app.config.importmap.paths << root.join("config/importmap.rb")
        app.config.importmap.cache_sweepers << root.join("app/assets/javascripts")
      end
    end

    # Make the layout helpers available in every host view.
    initializer "floatpunk_ui.helpers" do
      ActiveSupport.on_load(:action_controller_base) do
        helper FloatpunkUi::LayoutHelper
      end
    end
  end
end
