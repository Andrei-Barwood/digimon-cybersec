require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep37_myotismon'

class Ep37Test < Minitest::Test
  def test_execution
    @proc = DigiSec::MyotismonProcess.new; DigiSec::AngewomonEngine.celestial_arrow!(@proc, 8); assert_equal :terminated, @proc.status
  end
end
