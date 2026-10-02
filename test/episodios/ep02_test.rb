require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep02_shellmon'

class Ep02Test < Minitest::Test
  def setup
    @session = DigiSec::AdminSession.new
  end

  def test_shellmon_hijacks_session
    assert_equal :active, @session.status
    
    DigiSec::ShellmonRansomware.hijack!(@session)
    
    assert_equal :locked, @session.status
    assert_equal "Shellmon_PID_9999", @session.hijacking_process
  end

  def test_agumon_cannot_unlock_session
    DigiSec::ShellmonRansomware.hijack!(@session)
    
    # Agumon (nivel Infantil) no tiene suficientes privilegios para romper el ransomware
    assert_raises(DigiSec::PermissionError) do
      DigiSec::AgumonDefense.attempt_rescue(@session)
    end
    
    assert_equal :locked, @session.status
  end

  def test_greymon_mega_flame_unlocks_session
    DigiSec::ShellmonRansomware.hijack!(@session)
    
    # Se escala el privilegio a Greymon (nivel Adulto)
    DigiSec::GreymonDefense.mega_flame!(@session)
    
    # La sesión es liberada (Tai es salvado)
    assert_equal :active, @session.status
    assert_nil @session.hijacking_process
  end
end
