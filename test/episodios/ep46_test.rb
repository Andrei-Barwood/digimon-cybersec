require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep46_metaletemon'

class Ep46Test < Minitest::Test
  def test_execution
    @threat = DigiSec::EtemonThreat.new; @threat.resurrect!; assert_equal :metal_etemon_bootkit, @threat.state; assert_equal :escaped, DigiSec::SaberLeomonRescue.evade!(@threat)
  end
end
