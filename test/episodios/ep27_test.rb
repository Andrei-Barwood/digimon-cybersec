require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep27_gateway'

class Ep27Test < Minitest::Test
  def setup
    @gateway = DigiSec::DimensionalGateway.new
  end

  def test_incorrect_cards_deny_access
    wrong_cards = ["Numemon", "Sukamon", "Pattern"]
    result = @gateway.unlock!(wrong_cards)
    
    assert_equal :access_denied, result
    assert_equal :closed, @gateway.status
  end

  def test_izzy_analyzer_unlocks_gateway
    # Izzy resuelve el rompecabezas
    correct_cards = DigiSec::IzzyAnalyzer.solve_puzzle
    
    # Tai inyecta la solución
    result = @gateway.unlock!(correct_cards)
    
    assert_equal :access_granted, result
    assert_equal :open, @gateway.status
  end
end
