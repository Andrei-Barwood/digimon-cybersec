require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep05_andromon'

class Ep05Test < Minitest::Test
  def setup
    @controller = DigiSec::AndromonController.new
    @factory = DigiSec::ScadaFactory.new(@controller)
  end

  def test_factory_normal_operation
    @factory.run_production!
    assert_equal :friendly, @controller.state
    assert_equal :assembling_parts, @factory.production_status
  end

  def test_black_gear_hijacks_factory
    DigiSec::HardwareImplante.infect(@controller)
    @factory.run_production!
    
    # El controlador se vuelve hostil y la fábrica ataca
    assert_equal :hostile, @controller.state
    assert_includes @controller.hardware_modules, :black_gear
    assert_equal :attacking_intruders, @factory.production_status
  end

  def test_kabuterimon_electro_shocker_restores_factory
    # Infección inicial
    DigiSec::HardwareImplante.infect(@controller)
    @factory.run_production!
    assert_equal :attacking_intruders, @factory.production_status
    
    # Defensa de Kabuterimon
    DigiSec::KabuterimonDefense.electro_shocker!(@controller)
    
    # La fábrica reanuda operación normal tras el EMP/Reset
    @factory.run_production!
    assert_equal :friendly, @controller.state
    refute_includes @controller.hardware_modules, :black_gear
    assert_equal :assembling_parts, @factory.production_status
  end
end
