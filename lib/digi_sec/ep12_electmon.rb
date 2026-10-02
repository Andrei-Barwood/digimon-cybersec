module DigiSec
  class LegitimateNode
    attr_reader :ip_address

    def initialize(ip_address)
      @ip_address = ip_address
    end
  end

  class ElectmonIDS
    attr_reader :whitelisted_ips

    def initialize
      # Reglas legacy: solo conoce las IPs antiguas antes de la segmentación
      @whitelisted_ips = ["192.168.1.0/24"]
    end

    def process_connection(node)
      if @whitelisted_ips.include?(node.ip_address)
        :accepted
      else
        :connection_dropped # Falso Positivo
      end
    end

    def update_whitelist!(new_ip)
      @whitelisted_ips << new_ip
    end
  end

  class TrustResolution
    def self.renegotiate!(node, ids)
      # Simula el apretón de manos y la competencia de fuerza (Handshake)
      # Se demuestra la legitimidad y el IDS actualiza sus reglas
      ids.update_whitelist!(node.ip_address)
    end
  end
end
