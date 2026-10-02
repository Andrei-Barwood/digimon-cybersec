require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep47_metaletemon'

class Ep47Test < Minitest::Test
  def test_execution
    @enemy = DigiSec::MetalEtemon.new; DigiSec::ZudomonHammer.break_armor!(@enemy); assert_equal :vulnerable, @enemy.armor
  end
end
