require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep36_phantomon'

class Ep36Test < Minitest::Test
  def test_execution
    @grid = DigiSec::TokyoGrid.new; DigiSec::PhantomonIsolator.isolate!(@grid); assert_equal :isolated_by_fog, @grid.connectivity
  end
end
