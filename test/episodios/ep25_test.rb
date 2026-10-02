require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep25_shogungekomon'

class Ep25Test < Minitest::Test
  def setup
    @system = DigiSec::CastleSystem.new
    @mimi = DigiSec::MimiAdmin.new
  end

  def test_admin_withholding_key_causes_dos
    assert @mimi.key_held
    assert_nil @mimi.provide_key
    
    @system.wake_up!(@mimi.provide_key)
    
    # El sistema sigue durmiendo (Denegación de Servicio Administrativa)
    assert_equal :sleeping, @system.state
  end

  def test_audit_forces_key_release_and_reveals_corrupted_service
    DigiSec::SoraAudit.enforce_policy!(@mimi)
    
    refute @mimi.key_held
    assert_equal :mimi_song, @mimi.provide_key
    
    @system.wake_up!(@mimi.provide_key)
    
    # El servicio se despierta, pero resulta estar corrupto
    assert_equal :corrupted_service, @system.state
  end

  def test_metalgreymon_terminates_corrupted_service
    DigiSec::SoraAudit.enforce_policy!(@mimi)
    @system.wake_up!(@mimi.provide_key)
    assert_equal :corrupted_service, @system.state
    
    # Defensa elimina el servicio que consume recursos y ataca
    DigiSec::MetalGreymonDefense.terminate_service!(@system)
    
    assert_equal :terminated, @system.state
  end
end
