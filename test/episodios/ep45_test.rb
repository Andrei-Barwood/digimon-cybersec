require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep45_cherrymonwargreymonvsmetalgarurumon'

class Ep45Test < Minitest::Test
  def test_execution
    @clus = DigiSec::DefenderCluster.new; DigiSec::CherrymonLogicBomb.inject!(@clus); assert_equal :friendly_fire, @clus.status; DigiSec::KariEntity.resolve!(@clus); assert_equal :synchronized, @clus.status
  end
end
