# frozen_string_literal: true

require_relative "lib/recording_studio_affiliates/version"

Gem::Specification.new do |spec|
  spec.name        = "recording_studio_affiliates"
  spec.version     = RecordingStudioAffiliates::VERSION
  spec.authors     = ["Bowerbird"]
  spec.homepage    = "https://github.com/bowerbird-app/RecordingStudio_affiliates"
  spec.summary     = "Affiliate commissions paid via Stripe Connect for Recording Studio"
  spec.description = "A Recording Studio engine for affiliate commissions paid via Stripe Connect. " \
                     "Version 0.1.0 is the engine shell. It does not record commissions or pay them yet."
  spec.license     = "MIT"
  spec.required_ruby_version = ">= 3.3.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/bowerbird-app/RecordingStudio_affiliates"
  spec.metadata["changelog_uri"] = "https://github.com/bowerbird-app/RecordingStudio_affiliates/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.0"
end
