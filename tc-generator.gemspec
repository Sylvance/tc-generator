# frozen_string_literal: true

require_relative "lib/tc/generator/version"

Gem::Specification.new do |spec|
  spec.name = "tc-generator"
  spec.version = Tc::Generator::VERSION
  spec.authors = ["Sylvance"]
  spec.email = ["103753399+ninjawork@users.noreply.github.com"]

  spec.summary = "Terms and conditions generator."
  spec.description = "The T&C generator is a software which given: i). A template ii). A dataset.
                      transforms the template into a Document expanding the
                      template tags into their representation using the dataset."
  spec.homepage = "https://github.com/Sylvance/tc-generator"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Sylvance/tc-generator"
  spec.metadata["changelog_uri"] = "https://github.com/Sylvance/tc-generator/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  # spec.add_dependency "rspec", "~> 3.8"
  spec.add_development_dependency 'pry'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
