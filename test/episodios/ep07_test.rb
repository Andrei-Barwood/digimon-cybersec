require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep07_unimon'

class Ep07Test < Minitest::Test
  def setup
    @service = DigiSec::TrustedService.new
    @dependency = DigiSec::InfectedDependency.new
  end

  def test_service_starts_benign_and_whitelisted
    assert_equal :benign, @service.status
    assert_equal true, @service.is_whitelisted
    assert_equal false, DigiSec::SimpleFirewall.block?(@service)
  end

  def test_infected_dependency_compromises_service
    # Unimon bebe del estanque infectado
    @service.update_from!(@dependency)
    
    assert_equal :hostile, @service.status
    assert_includes @service.processes, :black_gear
    
    # A pesar de ser hostil, el firewall básico no lo bloquea (evade seguridad)
    assert_equal false, DigiSec::SimpleFirewall.block?(@service)
  end

  def test_ikkakumon_defense_removes_payload
    @service.update_from!(@dependency)
    
    # Ikkakumon lanza Harpoon Torpedo
    DigiSec::IkkakumonDefense.harpoon_torpedo!(@service)
    
    # El payload fue destruido de memoria, el servicio es benigno de nuevo
    refute_includes @service.processes, :black_gear
    assert_equal :benign, @service.status
  end
end
