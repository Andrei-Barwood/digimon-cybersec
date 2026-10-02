require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep18_piximon'

class Ep18Test < Minitest::Test
  def setup
    @sandbox = DigiSec::PiximonSandbox.new
    @izzy = DigiSec::RecklessUser.new
  end

  def test_signal_blocked_inside_air_gap
    # Transmite desde dentro de la barrera
    @izzy.transmit_beacon!(@sandbox)
    
    # La señal no sale, la red sigue segura
    assert_equal :air_gapped, @sandbox.status
  end

  def test_perimeter_breach_causes_exposure_and_compromise
    # Izzy y Matt salen de la barrera (Falla de seguridad física)
    @izzy.evade_barrier!
    @izzy.transmit_beacon!(@sandbox)
    
    assert_equal :exposed, @sandbox.status
    
    # Etemon detecta la señal y envía el malware
    DigiSec::TyrannomonMalware.infiltrate!(@sandbox)
    
    assert_equal :compromised, @sandbox.status
  end

  def test_training_routine_purges_malware_and_restores_air_gap
    @izzy.evade_barrier!
    @izzy.transmit_beacon!(@sandbox)
    DigiSec::TyrannomonMalware.infiltrate!(@sandbox)
    assert_equal :compromised, @sandbox.status
    
    # Defensa: Greymon elimina la amenaza tras completar su proceso de sanitización
    DigiSec::TrainingRoutine.deploy_greymon!(@sandbox)
    
    assert_equal :air_gapped, @sandbox.status
  end
end
