require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep54_apocalymon'

class Ep54Test < Minitest::Test
  def test_execution
    @world = DigiSec::FinalDigitalWorld.new; @bomb = DigiSec::ApocalymonBomb.new; DigiSec::DigiviceContainment.contain_blast!(@bomb, @world); assert_equal :rebooted_safely, @world.status
  end
end
