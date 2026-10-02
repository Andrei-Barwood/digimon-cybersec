require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep23_digitamamon'

class Ep23Test < Minitest::Test
  def setup
    @joe = DigiSec::JoeNode.new
  end

  def test_node_starts_with_normal_cpu_load
    assert_equal 5, @joe.cpu_load
    refute @joe.enslaved
  end

  def test_digitamamon_infects_and_maxes_cpu_load
    DigiSec::DigitamamonMiner.infect!(@joe)
    assert @joe.enslaved
    assert_equal 100, @joe.cpu_load
  end

  def test_sabotage_maintains_high_load
    DigiSec::DigitamamonMiner.infect!(@joe)
    # Intento de bajar la carga simulado
    @joe.cpu_load = 50 
    
    # Demidevimon fuerza el sabotaje
    DigiSec::DemiDevimonSabotage.sabotage!(@joe)
    assert_equal 100, @joe.cpu_load
  end

  def test_weregarurumon_terminates_miner_and_restores_node
    DigiSec::DigitamamonMiner.infect!(@joe)
    DigiSec::DemiDevimonSabotage.sabotage!(@joe)
    assert_equal 100, @joe.cpu_load
    
    # Evolución a Ultimate (Supervisor)
    DigiSec::WereGarurumon.terminate_process!(@joe)
    
    refute @joe.enslaved
    assert_equal 5, @joe.cpu_load
  end
end
