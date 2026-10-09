# Host apps register the controllers in app/javascript/controllers/index.js:
#   import BalloonController from "floatpunk_ui/balloon_controller"
#   import MenuController from "floatpunk_ui/menu_controller"
#   import ThemeController from "floatpunk_ui/theme_controller"
#   application.register("balloon", BalloonController)
#   application.register("menu", MenuController)
#   application.register("theme", ThemeController)
pin "floatpunk_ui/balloon_controller", to: "floatpunk_ui/balloon_controller.js"
pin "floatpunk_ui/menu_controller", to: "floatpunk_ui/menu_controller.js"
pin "floatpunk_ui/theme_controller", to: "floatpunk_ui/theme_controller.js"
