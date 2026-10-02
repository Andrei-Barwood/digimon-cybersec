require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep26_myotismon'

class Ep26Test < Minitest::Test
  def setup
    @defenders = DigiSec::DefenderGroup.new
  end

  def test_zero_day_destroys_defenders
    DigiSec::MyotismonAPT.defeat!(@defenders)
    
    # Las defensas normales fracasan
    assert_equal :destroyed, @defenders.status
  end

  def test_active_evasion_escapes_zero_day
    # El protocolo de Garudamon interrumpe la destrucción antes de que el ataque termine
    DigiSec::GarudamonProtocol.evasive_escape!(@defenders, DigiSec::MyotismonAPT)
    
    # El ataque de Myotismon ahora falla porque el objetivo ya no está allí
    DigiSec::MyotismonAPT.defeat!(@defenders)
    
    assert_equal :escaped_safely, @defenders.status
  end
end
