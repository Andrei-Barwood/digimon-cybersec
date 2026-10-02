require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep01_kuwagamon'

class Ep01Test < Minitest::Test
  def setup
    @perimeter = DigiSec::NetworkPerimeter.new(capacity: 100)
  end

  def test_kuwagamon_causes_denial_of_service_without_evolution
    # Al inicio, el estado es online
    assert_equal :online, @perimeter.status

    # Kuwagamon lanza el ataque DDoS masivo
    DigiSec::KuwagamonAttack.launch(@perimeter)

    # Como no hubo evolución (auto-scaling/filtro), el perímetro colapsa
    # y entra en failover (offline) tras sufrir un DDoS.
    assert_equal :offline, @perimeter.status
  end

  def test_evolution_mitigates_kuwagamon_attack
    # Los Digimon evolucionan a etapa Infantil, activando el filtro (Baby Flame, etc.)
    @perimeter.evolve_and_filter!

    # Kuwagamon ataca
    DigiSec::KuwagamonAttack.launch(@perimeter)

    # Los paquetes maliciosos fueron descartados, el perímetro sobrevive y sigue online
    assert_equal :online, @perimeter.status
    assert_empty @perimeter.traffic_log # No se registraron paquetes maliciosos
  end
end
