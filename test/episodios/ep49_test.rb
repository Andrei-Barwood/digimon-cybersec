require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep49_machinedramon'

class Ep49Test < Minitest::Test
  def test_execution
    @enemy = DigiSec::MachinedramonAPT.new; DigiSec::WarGreymonBareMetal.dramon_destroyer!(@enemy); assert_equal :sliced_to_pieces, @enemy.status
  end
end
