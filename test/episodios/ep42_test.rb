require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep42_metalseadramon'

class Ep42Test < Minitest::Test
  def test_execution
    @proxy = DigiSec::WhamonProxy.new; assert_equal :enemy_defeated, DigiSec::WarGreymonExploit.brave_tornado!(nil, @proxy); assert_equal :destroyed, @proxy.status
  end
end
