require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep06_monzaemon'

class Ep06Test < Minitest::Test
  def setup
    @users = [
      DigiSec::UserIdentity.new("Tai"),
      DigiSec::UserIdentity.new("Mimi"),
      DigiSec::UserIdentity.new("Izzy")
    ]
  end

  def test_users_start_safe
    @users.each do |user|
      assert_equal :safe, user.status
    end
  end

  def test_phishing_campaign_compromises_users
    DigiSec::PhishingCampaign.launch(@users)
    
    @users.each do |user|
      assert_equal :compromised, user.status
    end
  end

  def test_togemon_needle_spray_restores_identities
    # Usuarios caen en el phishing
    DigiSec::PhishingCampaign.launch(@users)
    
    # Defensa de Togemon: Destruye el payload y restaura identidades
    DigiSec::TogemonDefense.needle_spray!(@users)
    
    @users.each do |user|
      assert_equal :safe, user.status
    end
  end
end
