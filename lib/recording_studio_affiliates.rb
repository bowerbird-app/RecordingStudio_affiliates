# frozen_string_literal: true

require "recording_studio_affiliates/version"
require "recording_studio_affiliates/engine"
require "recording_studio_affiliates/configuration"
require "recording_studio_affiliates/services/base_service"

module RecordingStudioAffiliates
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration) if block_given?
    end
  end
end
