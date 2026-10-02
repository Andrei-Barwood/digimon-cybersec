require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep22_demidevimon'

class Ep22Test < Minitest::Test
  def setup
    @tk = DigiSec::TkNode.new
  end

  def test_initial_connection_is_successful
    assert_equal :connection_established, DigiSec::TaiNode.reconnect(@tk)
  end

  def test_dns_poisoning_causes_connection_refusal
    DigiSec::DemiDevimon.poison!(@tk)
    
    # TK cree que Tai es el enemigo
    assert_equal :connection_refused, DigiSec::TaiNode.reconnect(@tk)
    assert_equal :hostile_entity, @tk.dns_cache["tai.digiworld.local"]
  end

  def test_flushing_dns_restores_connection
    DigiSec::DemiDevimon.poison!(@tk)
    assert_equal :connection_refused, DigiSec::TaiNode.reconnect(@tk)
    
    # Tokomon detecta la mentira y purga la caché
    DigiSec::TokomonDefense.flush_dns!(@tk)
    
    # La conexión vuelve a ser exitosa
    assert_equal :connection_established, DigiSec::TaiNode.reconnect(@tk)
  end
end
