require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep11_bakemon'

class Ep11Test < Minitest::Test
  def setup
    @service = DigiSec::AuthService.new
    @request = DigiSec::AuthRequest.new
  end

  def test_service_starts_secure
    assert_equal :secure, @service.status
  end

  def test_bakemon_spoofing_hijacks_session
    # Spoofing y ofuscación (Disfraz de humano en la iglesia)
    DigiSec::BakemonSpoofing.spoof!(@request)
    @service.process(@request)
    
    # El servicio no detectó el engaño
    assert_equal :hijacked, @service.status
  end

  def test_joe_sutra_and_birdramon_purge_threat
    # Infección inicial
    DigiSec::BakemonSpoofing.spoof!(@request)
    @service.process(@request)
    assert_equal :hijacked, @service.status
    
    # Defensa 1: Joe desofusca el payload (Sutra)
    DigiSec::JoeSutra.deobfuscate!(@request)
    assert_equal false, @request.is_obfuscated
    
    # Defensa 2: Birdramon ataca el payload ahora visible y restaura el servicio
    DigiSec::BirdramonDefense.meteor_wing!(@request, @service)
    
    assert_equal true, @request.is_blocked
    assert_equal :secure, @service.status
  end
end
