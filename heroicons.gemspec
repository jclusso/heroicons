$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "heroicons/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name = "heroicons"
  spec.version = Heroicons::VERSION
  spec.authors = "Jarrett Lusso"
  spec.email = "jclusso@gmail.com"
  spec.homepage = "https://github.com/jclusso/heroicons"
  spec.summary = "Rails View Helpers for Heroicons."
  spec.description = "Ruby on Rails view helpers for the beautiful hand-crafted SVG icons, Heroicons."
  spec.license = "MIT"

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/jclusso/heroicons/issues",
    "changelog_uri" => "https://github.com/jclusso/heroicons/releases",
    "documentation_uri" => "https://github.com/jclusso/heroicons",
    "github_repo" => "ssh://github.com/jclusso/heroicons",
    "homepage_uri" => "https://github.com/jclusso/heroicons",
    "source_code_uri" => "https://github.com/jclusso/heroicons",
    "rubygems_mfa_required" => "true"
  }

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.required_ruby_version = ">= 2.7"

  spec.add_dependency "nokogiri"
  spec.add_dependency "railties", ">= 5.2"

  spec.add_development_dependency "appraisal"
  spec.add_development_dependency "rubocop-rails-omakase"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "mocha"
end
