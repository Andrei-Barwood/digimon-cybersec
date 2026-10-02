require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep38_venommyotismon'

class Ep38Test < Minitest::Test
  def test_execution
    assert_equal :mega_evolution_unlocked, DigiSec::ProphecyAlgorithm.execute!(:shot_at_hope_and_light)
  end
end
