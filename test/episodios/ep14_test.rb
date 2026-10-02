require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep14_whamon'

class Ep14Test < Minitest::Test
  def setup
    @gateway = DigiSec::WhamonGateway.new
    @migration = DigiSec::DataMigration.new
  end

  def test_gateway_hijacking_causes_blackhole
    # Infección del router
    @gateway.infect!
    
    # Intento de migración
    @gateway.route_traffic(@migration)
    
    # El tráfico es secuestrado y nunca llega a destino
    assert_equal :blackhole, @migration.status
  end

  def test_internal_diagnostic_fixes_gateway_and_completes_migration
    @gateway.infect!
    @gateway.route_traffic(@migration)
    assert_equal :blackhole, @migration.status
    
    # Defensa: Ejecución de un autodiagnóstico interno (Tai y Agumon dentro de Whamon)
    DigiSec::InternalDiagnostic.run!(@gateway)
    
    # El Engranaje Negro fue purgado
    assert_nil @gateway.internal_payload
    
    # Reintento de migración
    @gateway.route_traffic(@migration)
    
    # Éxito: Migración completada al nuevo continente
    assert_equal :server_continent, @migration.status
  end
end
