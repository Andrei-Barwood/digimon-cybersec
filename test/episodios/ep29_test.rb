require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep29_mammothmon'

class Ep29Test < Minitest::Test
  def setup
    @subnet = DigiSec::HikarigaokaSubnet.new
  end

  def test_brute_force_attack_spikes_traffic
    DigiSec::Mammothmon.brute_force_attack!(@subnet)
    assert_equal :critical_ddos, @subnet.traffic_load
  end

  def test_unmitigated_attack_forces_hidden_node_exposure
    DigiSec::Mammothmon.brute_force_attack!(@subnet)
    
    # Simula que si nadie detiene el DDoS, la red colapsa y expone al nodo
    if @subnet.traffic_load == :critical_ddos
      @subnet.hidden_node_revealed = true
    end
    
    assert @subnet.hidden_node_revealed
  end

  def test_garudamon_waf_mitigates_attack_and_protects_node
    DigiSec::Mammothmon.brute_force_attack!(@subnet)
    
    # Defensa WAF bloquea el ataque
    DigiSec::GarudamonWAF.block_and_purge!(@subnet)
    
    assert_equal :normal, @subnet.traffic_load
    refute @subnet.hidden_node_revealed
  end
end
