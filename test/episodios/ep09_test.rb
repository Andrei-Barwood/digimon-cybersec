require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep09_yukidarumon'

class Ep09Test < Minitest::Test
  def setup
    @thread = DigiSec::SystemThread.new
  end

  def test_initial_thread_is_active
    assert_equal :active, @thread.status
  end

  def test_yukidarumon_causes_thread_starvation
    # Ataque DoS / Bloqueo mutuo
    DigiSec::YukidarumonDoS.absolute_zero!(@thread)
    
    assert_equal :frozen, @thread.status
  end

  def test_agumon_watchdog_unfreezes_thread
    DigiSec::YukidarumonDoS.absolute_zero!(@thread)
    assert_equal :frozen, @thread.status
    
    # Defensa: Agumon aplica Baby Flame (Interrupción Hardware/Watchdog)
    DigiSec::AgumonDefense.baby_flame!(@thread)
    
    # El hilo se destraba y vuelve a estar activo
    assert_equal :active, @thread.status
  end
end
