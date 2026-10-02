require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep13_angemon'

class Ep13Test < Minitest::Test
  def setup
    @network = DigiSec::CoreNetwork.new
  end

  def test_network_starts_secure
    assert_equal :secure, @network.status
  end

  def test_devimon_zero_day_compromises_system
    # Ataque imparable
    DigiSec::DevimonZeroDay.critical_compromise!(@network)
    
    assert_equal :compromised, @network.status
    assert_equal "Corrupted_Data", @network.vital_data
  end

  def test_angemon_drp_destroys_network_but_saves_digiegg_backup
    DigiSec::DevimonZeroDay.critical_compromise!(@network)
    assert_equal :compromised, @network.status
    
    # Ejecución del Disaster Recovery Plan (Hand of Fate)
    backup = DigiSec::AngemonDRP.hand_of_fate!(@network)
    
    # El nodo original fue sacrificado para limpiar la amenaza
    assert_equal :destroyed, @network.status
    
    # Pero el sistema sobrevive en estado de Cold Backup
    assert_instance_of DigiSec::DigiEggBackup, backup
    assert_equal "FileIsland_Core_Data", backup.data
  end
end
