require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep21_koromon'

class Ep21Test < Minitest::Test
  def setup
    @client = DigiSec::TaiClient.new
  end

  def test_client_starts_degraded_in_external_subnet
    assert_equal :external_subnet, @client.network_location
    assert_equal :degraded, @client.session_status
  end

  def test_threat_intercepts_unprotected_client
    DigiSec::OgremonThreat.intercept!(@client)
    assert_equal :under_attack, @client.session_status
  end

  def test_vpn_reconnection_secures_client
    DigiSec::OgremonThreat.intercept!(@client)
    
    # Se activa el túnel de emergencia (Evolución)
    DigiSec::AgumonVPN.reconnect_tunnel!(@client)
    
    # El cliente vuelve a la red interna segura
    assert_equal :internal_cluster, @client.network_location
    assert_equal :secured, @client.session_status
  end
end
