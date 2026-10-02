require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep35_darktyrannomon'

class Ep35Test < Minitest::Test
  def test_execution
    @node = DigiSec::OdaibaNode.new; DigiSec::LillymonSandbox.pacify!(@node); assert_equal :quarantined_peacefully, @node.threat_status
  end
end
