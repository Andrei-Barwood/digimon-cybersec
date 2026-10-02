require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep31_raremon'

class Ep31Test < Minitest::Test
  def test_execution
    @sys = DigiSec::TokyoBaySystem.new; DigiSec::RaremonCorruption.leak_memory!(@sys); assert_equal :corrupted_leak, @sys.memory_status; DigiSec::KabuterimonGC.collect_garbage!(@sys); assert_equal :clean, @sys.memory_status
  end
end
