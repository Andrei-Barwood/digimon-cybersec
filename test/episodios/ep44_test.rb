require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep44_garbagemon'

class Ep44Test < Minitest::Test
  def test_execution
    @stack = DigiSec::MemoryStack.new; DigiSec::Garbagemon.overflow!(@stack); assert_equal :overflowed, @stack.capacity; DigiSec::LillymonSanitizer.sanitize!(@stack); assert_equal :normal, @stack.capacity
  end
end
