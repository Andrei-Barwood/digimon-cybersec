require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep04_meramon'

class Ep04Test < Minitest::Test
  def setup
    @controller = DigiSec::SystemController.new
  end

  def test_black_gear_causes_overheating
    @controller.tick!
    assert_equal 10, @controller.cpu_usage
    assert_equal :normal, @controller.status

    # El malware inyecta el Black Gear
    DigiSec::BlackGearInjector.infect(@controller)
    
    assert_equal 100, @controller.cpu_usage
    assert_equal :overheating, @controller.status
  end

  def test_birdramon_hotpatch_restores_system
    # Sistema infectado
    DigiSec::BlackGearInjector.infect(@controller)
    assert_equal :overheating, @controller.status
    
    # Defensa: Birdramon aplica el parche (Meteor Wing)
    DigiSec::BirdramonDefense.meteor_wing!(@controller)
    
    # El malware es removido y el sistema vuelve a la normalidad sin morir
    assert_equal 10, @controller.cpu_usage
    assert_equal :normal, @controller.status
    assert_equal false, @controller.infected
  end
end
