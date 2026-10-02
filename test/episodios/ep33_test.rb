require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep33_pumpkinmongotsumon'

class Ep33Test < Minitest::Test
  def test_execution
    @server = DigiSec::ShibuyaServer.new; DigiSec::MyotismonC2.purge_rogues!(@server); assert_empty @server.rogue_processes
  end
end
