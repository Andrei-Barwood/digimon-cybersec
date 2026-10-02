require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep20_metalgreymon'

class Ep20Test < Minitest::Test
  def setup
    @server = DigiSec::ServerCore.new
  end

  def test_etemon_fuses_with_kernel
    DigiSec::EtemonRootkit.fuse!(@server)
    assert_equal :compromised_rootkit, @server.kernel_status
  end

  def test_metalgreymon_purges_rootkit_and_causes_rift
    DigiSec::EtemonRootkit.fuse!(@server)
    
    # La defensa se activa (Evolución a Ultimate)
    DigiSec::MetalGreymonDefense.giga_destroyer!(@server)
    
    # El servidor es destruido (Rootkit erradicado, pero hardware perdido)
    assert_equal :destroyed, @server.kernel_status
    
    # Se genera un bucle de enrutamiento hacia la red externa (El Mundo Real)
    assert_equal :real_world_external, @server.routing_table
  end
end
