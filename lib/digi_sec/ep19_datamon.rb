module DigiSec
  class CoreNetwork
    attr_accessor :network_status, :sora_data

    def initialize
      @network_status = :operational
      @sora_data = :secure
    end
  end

  class DatamonAPT
    attr_accessor :status

    def initialize
      @status = :quarantined
    end

    def kidnap_data!(network)
      if @status == :active
        # Pivoting y Data Kidnapping
        network.sora_data = :kidnapped
      end
    end
  end

  class IzzyAdmin
    def self.release_prisoner!(datamon)
      # Falta de Zero Trust: se confía ciegamente en el "aliado"
      datamon.status = :active
    end
  end

  class IncidentResponse
    def self.declare_p0!(network)
      # Contención de emergencia para evitar mayor propagación
      network.network_status = :lockdown
    end
  end
end
