require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep30_gesomon'

class Ep30Test < Minitest::Test
  def setup
    @scada = DigiSec::TransportSCADA.new
  end

  def test_normal_transit_is_successful
    assert_equal :operational, @scada.bridge_status
    assert_equal :transit_successful, @scada.data_transit
  end

  def test_sabotage_blocks_scada_and_prevents_transit
    DigiSec::GesomonMalware.sabotage!(@scada)
    
    assert_equal :blocked, @scada.bridge_status
    assert_equal :transit_failed, @scada.data_transit
  end

  def test_firmware_patch_restores_scada_operation
    DigiSec::GesomonMalware.sabotage!(@scada)
    assert_equal :transit_failed, @scada.data_transit
    
    # Ikkakumon despliega el parche de emergencia
    DigiSec::IkkakumonFirmware.deploy_torpedo!(@scada)
    
    assert_equal :operational, @scada.bridge_status
    assert_equal :transit_successful, @scada.data_transit
  end
end
