# frozen_string_literal: true

require "test_helper"

class RecordingStudioAffiliatesTest < Minitest::Test
  def test_version_exists
    refute_nil ::RecordingStudioAffiliates::VERSION
  end

  def test_engine_exists
    assert_kind_of Class, ::RecordingStudioAffiliates::Engine
  end
end
