require_relative "lib/floatpunk_ui/version"

Gem::Specification.new do |spec|
  spec.name        = "floatpunk_ui"
  spec.version     = FloatpunkUi::VERSION
  spec.authors     = [ "Ben" ]
  spec.email       = [ "benedict@boost.co.nz" ]
  spec.homepage    = "https://github.com/hapiben/floatpunk_ui"
  spec.summary     = "The balloon theme shared by Floatpunk, Play Hangman and Play Word Chain."
  spec.description = "CSS, ViewComponents and a Stimulus controller for the balloon design. " \
                     "Each site pins a version of this gem."
  spec.license     = "MIT"

  # This gem is private. Never push it to RubyGems.org.
  spec.metadata["allowed_push_host"] = "https://localhost"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.required_ruby_version = ">= 3.3"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md", "CHANGELOG.md"]
  end

  spec.add_dependency "rails", ">= 8.1"
  spec.add_dependency "view_component", ">= 4.15"
  spec.add_dependency "importmap-rails", ">= 2.0"
  spec.add_dependency "stimulus-rails", ">= 1.3"
end
