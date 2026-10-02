require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep12_electmon'

class Ep12Test < Minitest::Test
  def setup
    @ids = DigiSec::ElectmonIDS.new
    # TK y Patamon tienen una nueva IP tras la segmentación del Ep 8
    @tk_node = DigiSec::LegitimateNode.new("10.0.5.50")
  end

  def test_electmon_drops_legitimate_traffic_due_to_misconfiguration
    # Fuego amigo: el IDS bloquea el tráfico legítimo
    status = @ids.process_connection(@tk_node)
    
    assert_equal :connection_dropped, status
  end

  def test_trust_resolution_fixes_false_positive
    status = @ids.process_connection(@tk_node)
    assert_equal :connection_dropped, status
    
    # Defensa / Mitigación: TK y Patamon renegocian el acceso (Handshake)
    DigiSec::TrustResolution.renegotiate!(@tk_node, @ids)
    
    # El IDS ha sido actualizado en caliente, el tráfico ahora fluye
    new_status = @ids.process_connection(@tk_node)
    
    assert_equal :accepted, new_status
    assert_includes @ids.whitelisted_ips, "10.0.5.50"
  end
end
