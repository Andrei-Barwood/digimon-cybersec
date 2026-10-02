require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep03_seadramon'

class Ep03Test < Minitest::Test
  def setup
    @channel = DigiSec::DataLakeChannel.new
  end

  def test_seadramon_intercepts_plaintext
    @channel.transmit("Matt_Session_Data")
    
    # Seadramon hace sniffing del canal
    intercepted = DigiSec::SeadramonSniffer.sniff(@channel)
    
    # El sniffer obtiene los datos en texto plano
    assert_equal ["Matt_Session_Data"], intercepted
  end

  def test_garurumon_fox_fire_encrypts_channel
    # Defensa: Gabumon evoluciona a Garurumon y aplica Fox Fire (Cifrado)
    DigiSec::GarurumonDefense.fox_fire!(@channel)
    
    @channel.transmit("Matt_Session_Data_Secure")
    
    # Seadramon intenta interceptar
    intercepted = DigiSec::SeadramonSniffer.sniff(@channel)
    
    # El sniffer solo ve datos ininteligibles (está "congelado" fuera del contenido)
    assert_equal [:unreadable], intercepted
  end
end
