require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep40_darkmasters'

class Ep40Test < Minitest::Test
  def test_execution
    @world = DigiSec::DigitalWorld.new; DigiSec::DarkMasters.reformat!(@world); assert_equal :spiral_mountain, @world.topology; assert_equal :safe_but_offline, DigiSec::PiximonBackup.stealth_escape!(nil)
  end
end
