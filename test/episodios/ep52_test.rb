require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep52_piedmon'

class Ep52Test < Minitest::Test
  def test_execution
    @node = DigiSec::KeychainNode.new; @enemy = DigiSec::PiedmonEnemy.new; DigiSec::MagnaAngemon.restore_and_null_route!(@node, @enemy); assert_equal :active, @node.state; assert_equal :routed_to_null, @enemy.status
  end
end
