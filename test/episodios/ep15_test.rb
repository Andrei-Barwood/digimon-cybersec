require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep15_etemon'

class Ep15Test < Minitest::Test
  def setup
    @dark_network = DigiSec::DarkNetwork.new
    @service = DigiSec::DefenseService.new(@dark_network)
  end

  def test_etemon_jamming_prevents_privilege_escalation
    # Etemon inicia su "Love Serenade" (Signal Jamming)
    @dark_network.jamming_signal!
    
    # El servicio intenta escalar privilegios (evolucionar)
    @service.upgrade_privileges!
    
    # Falla debido a la interferencia en la red local
    assert_equal :jammed, @service.status
  end

  def test_fallback_route_evades_jamming_and_allows_upgrade
    @dark_network.jamming_signal!
    @service.upgrade_privileges!
    assert_equal :jammed, @service.status
    
    # Mitigación: Evasión hacia una red segura subterránea
    DigiSec::FallbackRoute.evade!(@service)
    
    # Confirmamos que ya no está en la red oscura
    assert_equal :air_gapped_secure, @service.current_network
    
    # Ahora sí puede escalar privilegios
    @service.upgrade_privileges!
    assert_equal :champion, @service.status
  end
end
