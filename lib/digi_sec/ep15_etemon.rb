module DigiSec
  class DarkNetwork
    attr_reader :jamming_active

    def initialize
      @jamming_active = false
    end

    def jamming_signal!
      @jamming_active = true
    end
  end

  class DefenseService
    attr_accessor :current_network, :status

    def initialize(network)
      @current_network = network
      @status = :rookie
    end

    def upgrade_privileges!
      # Intenta "evolucionar" a champion
      if @current_network.is_a?(DarkNetwork) && @current_network.jamming_active
        @status = :jammed
      else
        @status = :champion
      end
    end
  end

  class FallbackRoute
    def self.evade!(service)
      # Air-gap: Salir de la red inalámbrica hostil y usar una conexión de emergencia (subterránea)
      service.current_network = :air_gapped_secure
    end
  end
end
