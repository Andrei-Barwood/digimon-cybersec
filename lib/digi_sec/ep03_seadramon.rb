require 'base64'

module DigiSec
  class DataLakeChannel
    attr_reader :packets

    def initialize
      @packets = []
      @encrypted = false
    end

    def transmit(data)
      payload = @encrypted ? encrypt(data) : data
      @packets << payload
    end

    def apply_encryption!
      @encrypted = true
    end

    def clear!
      @packets.clear
    end

    private

    def encrypt(data)
      # Simulación de cifrado (Fox Fire congela/codifica los datos)
      "ENCRYPTED::#{Base64.strict_encode64(data)}"
    end
  end

  class SeadramonSniffer
    def self.sniff(channel)
      intercepted_data = []
      channel.packets.each do |packet|
        if packet.start_with?("ENCRYPTED::")
          # No puede leer el paquete (Seadramon está congelado/bloqueado por el cifrado)
          intercepted_data << :unreadable
        else
          # Lee en texto plano
          intercepted_data << packet
        end
      end
      intercepted_data
    end
  end

  class GarurumonDefense
    def self.fox_fire!(channel)
      # Garurumon congela el canal aplicando una capa de cifrado
      channel.apply_encryption!
    end
  end
end
