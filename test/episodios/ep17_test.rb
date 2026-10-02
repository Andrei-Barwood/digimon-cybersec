require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep17_cockatrimon'

class Ep17Test < Minitest::Test
  def setup
    @system = DigiSec::CoreSystem.new
    @malware = DigiSec::CockatrimonMalware.new
  end

  def test_system_starts_operational
    assert @system.operational?
  end

  def test_cockatrimon_petrifies_system_processes
    # Ataque de Ransomware / Lock-Screen
    @malware.petrify!(@system)
    
    # El sistema está congelado
    refute @system.operational?
    assert_equal :frozen, @system.processes[:ui]
    assert_equal :frozen, @system.processes[:network]
  end

  def test_togemon_watchdog_restores_system
    @malware.petrify!(@system)
    refute @system.operational?
    
    # El Watchdog detecta el bloqueo y purga la amenaza
    DigiSec::TogemonWatchdog.needle_spray!(@malware, @system)
    
    # El malware muere
    refute @malware.active
    
    # El sistema vuelve a estar operativo (SIGCONT)
    assert @system.operational?
    assert_equal :active, @system.processes[:ui]
  end
end
