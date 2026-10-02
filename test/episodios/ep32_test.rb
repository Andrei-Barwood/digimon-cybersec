require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep32_gatomon'

class Ep32Test < Minitest::Test
  def test_execution
    @node = DigiSec::EighthChildNode.new; DigiSec::GatomonScanner.scan_internal!(@node); assert @node.discovered
  end
end
