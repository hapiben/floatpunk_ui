FloatpunkUi::Engine.routes.draw do
  # The design page shows every shared part. Mount it in development only:
  #   mount FloatpunkUi::Engine => "/design" if Rails.env.development?
  root to: "floatpunk_ui/design#show"
end
