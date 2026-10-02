require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep53_apocalymon'

class Ep53Test < Minitest::Test
  def test_execution
    @sys = DigiSec::SystemData.new; DigiSec::Apocalymon.total_wipe!(@sys); assert_equal :deleted_binary_space, @sys.data; DigiSec::InternalEnclave.rebuild_from_memory!(@sys); assert_equal :restored_from_hearts, @sys.data
  end
end
