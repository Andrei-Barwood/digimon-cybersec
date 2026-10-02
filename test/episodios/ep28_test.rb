require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep28_threat_hunting'

class Ep28Test < Minitest::Test
  def setup
    @siem = DigiSec::SIEMSystem.new
  end

  def test_apt_advantage_without_log_correlation
    assert_nil @siem.target_profile
    assert_equal :apt_advantage, DigiSec::MyotismonAPT.scan!(@siem)
  end

  def test_log_correlation_identifies_target_and_gives_defenders_advantage
    # Los niños recuerdan el evento de Hikarigaoka
    DigiSec::IzzyAnalyzer.correlate_logs!(@siem)
    
    # Perfilan exitosamente al octavo nodo
    assert_equal "Unknown_8", @siem.target_profile[:user]
    
    # Obtienen ventaja estratégica frente al escaneo del APT
    assert_equal :defenders_advantage, DigiSec::MyotismonAPT.scan!(@siem)
  end
end
