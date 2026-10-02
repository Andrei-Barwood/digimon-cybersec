require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep10_centarumon'

class Ep10Test < Minitest::Test
  def setup
    @izzy = DigiSec::AdminUser.new("Izzy")
    @mimi = DigiSec::AdminUser.new("Mimi")
    @edr = DigiSec::CentarumonEDR.new
  end

  def test_edr_allows_legitimate_users
    assert_equal true, @edr.allow_access?(@izzy)
    assert_equal true, @edr.allow_access?(@mimi)
  end

  def test_black_gear_causes_false_positive_denial_of_service
    # Infección del EDR
    DigiSec::BlackGearMalware.infect(@edr, @izzy)
    DigiSec::BlackGearMalware.infect(@edr, @mimi)
    
    # El EDR ahora bloquea a los administradores
    assert_equal false, @edr.allow_access?(@izzy)
    assert_equal false, @edr.allow_access?(@mimi)
  end

  def test_togemon_rollback_restores_edr_rules
    DigiSec::BlackGearMalware.infect(@edr, @izzy)
    assert_equal false, @edr.allow_access?(@izzy)
    
    # Defensa: Togemon fuerza el rollback de firmas
    DigiSec::TogemonDefense.rollback_signatures!(@edr)
    
    # El EDR vuelve a confiar en los usuarios legítimos
    assert_equal true, @edr.allow_access?(@izzy)
    assert_equal true, @edr.allow_access?(@mimi)
  end
end
