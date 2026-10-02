require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep39_venommyotismon'

class Ep39Test < Minitest::Test
  def test_execution
    @core = DigiSec::VenomCore.new; DigiSec::MegaDefenders.destroy_core!(@core); assert_equal :destroyed, @core.status
  end
end
