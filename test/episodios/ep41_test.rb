require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep41_metalseadramon'

class Ep41Test < Minitest::Test
  def test_execution
    @node = DigiSec::BeachNode.new; DigiSec::ScorpiomonSpoofer.trap!(@node); assert_equal :trapped_in_honeypot, @node.state; DigiSec::ZudomonRescue.break_out!(@node); assert_equal :free, @node.state
  end
end
