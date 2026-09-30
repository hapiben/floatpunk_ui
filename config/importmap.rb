# Host apps register the controllers in app/javascript/controllers/index.js:
#   import BalloonController from "floatpunk_ui/balloon_controller"
#   import MenuController from "floatpunk_ui/menu_controller"
#   application.register("balloon", BalloonController)
#   application.register("menu", MenuController)
pin "floatpunk_ui/balloon_controller", to: "floatpunk_ui/balloon_controller.js"
pin "floatpunk_ui/menu_controller", to: "floatpunk_ui/menu_controller.js"
