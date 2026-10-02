require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep16_skullgreymon'

class Ep16Test < Minitest::Test
  def setup
    @process = DigiSec::EvolutionProcess.new
  end

  def test_safe_evolution_with_valid_input
    # Payload dentro de los límites
    valid_payload = "A" * 50
    @process.force_upgrade!(valid_payload)
    
    assert_equal :metal_greymon, @process.status
  end

  def test_buffer_overflow_causes_corrupted_evolution
    # Tai inyecta un payload sobredimensionado
    malicious_payload = "DARK_COURAGE" * 20 # 240 bytes > 100
    
    @process.force_upgrade!(malicious_payload)
    
    # Falta de bounds checking genera el Buffer Overflow
    assert_equal :corrupted_skullgreymon, @process.status
    assert_equal 100, @process.cpu_usage
  end

  def test_oom_killer_mitigates_zombie_process
    malicious_payload = "DARK_COURAGE" * 20
    @process.force_upgrade!(malicious_payload)
    
    # La defensa entra en acción al detectar el consumo de recursos crítico
    DigiSec::OOMKiller.monitor!(@process)
    
    # El proceso es destruido y reiniciado en modo seguro
    assert_equal :safe_mode_koromon, @process.status
    assert_equal 1, @process.cpu_usage
  end
end
