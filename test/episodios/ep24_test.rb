require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep24_vademon'

class Ep24Test < Minitest::Test
  def setup
    @system = DigiSec::IzzySystem.new
    @vademon = DigiSec::VademonThreat.new
  end

  def test_vademon_steals_memory_and_credentials
    @vademon.memory_dump!(@system)
    
    assert_equal :zombified, @system.state
    assert_equal :dumped, @system.curiosity_memory
    assert_equal :compromised, @system.credentials
    
    # El atacante tiene los datos
    assert_equal :intact, @vademon.stolen_memory
    assert_equal :secure, @vademon.stolen_credentials
  end

  def test_tentomon_restores_memory_and_megakabuterimon_purges_threat
    @vademon.memory_dump!(@system)
    assert_equal :zombified, @system.state
    
    # Centinela restaura el estado
    DigiSec::TentomonSentinel.restore_memory!(@system, @vademon)
    
    assert_equal :active, @system.state
    assert_equal :intact, @system.curiosity_memory
    assert_nil @vademon.stolen_memory
    
    # Escalada y Defensa
    @system.evolve_to_megakabuterimon!(@vademon)
    assert_equal :purged, @vademon.status
  end
end
