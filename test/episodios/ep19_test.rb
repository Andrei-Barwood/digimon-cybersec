require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep19_datamon'

class Ep19Test < Minitest::Test
  def setup
    @network = DigiSec::CoreNetwork.new
    @datamon = DigiSec::DatamonAPT.new
  end

  def test_quarantined_apt_cannot_kidnap_data
    @datamon.kidnap_data!(@network)
    
    # Mientras esté en cuarentena, los datos están seguros
    assert_equal :secure, @network.sora_data
  end

  def test_third_party_risk_leads_to_data_kidnapping
    # El administrador libera al APT asumiendo que es inofensivo
    DigiSec::IzzyAdmin.release_prisoner!(@datamon)
    
    # Datamon traiciona la confianza y secuestra los datos
    @datamon.kidnap_data!(@network)
    
    assert_equal :kidnapped, @network.sora_data
  end

  def test_incident_response_declares_p0_and_locks_down_network
    DigiSec::IzzyAdmin.release_prisoner!(@datamon)
    @datamon.kidnap_data!(@network)
    assert_equal :kidnapped, @network.sora_data
    
    # Mitigación de emergencia: Declarar incidente P0 y cerrar la red
    DigiSec::IncidentResponse.declare_p0!(@network)
    
    # La red queda bloqueada a la espera del plan de recuperación (Ep 20)
    assert_equal :lockdown, @network.network_status
  end
end
