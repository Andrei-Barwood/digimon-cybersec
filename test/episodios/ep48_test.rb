require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep48_machinedramon'

class Ep48Test < Minitest::Test
  def test_execution
    @tracker = DigiSec::NetworkTracker.new; DigiSec::IzzySpoofer.flood_logs!(@tracker); assert_equal :obfuscated, @tracker.tai_location
  end
end
