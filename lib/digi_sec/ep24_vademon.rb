module DigiSec
  class IzzySystem
    attr_accessor :state, :curiosity_memory, :credentials

    def initialize
      @state = :active
      @curiosity_memory = :intact
      @credentials = :secure
    end

    def evolve_to_megakabuterimon!(threat)
      if @state == :active && @curiosity_memory == :intact && @credentials == :secure
        threat.status = :purged
      end
    end
  end

  class VademonThreat
    attr_accessor :status, :stolen_memory, :stolen_credentials

    def initialize
      @status = :active
      @stolen_memory = nil
      @stolen_credentials = nil
    end

    def memory_dump!(system)
      # Ingeniería Social: Induce a Izzy a exportar su memoria y token
      @stolen_memory = system.curiosity_memory
      @stolen_credentials = system.credentials
      
      system.curiosity_memory = :dumped
      system.credentials = :compromised
      system.state = :zombified
    end
  end

  class TentomonSentinel
    def self.restore_memory!(system, threat)
      # Recupera el Memory Dump y los tokens robados
      system.curiosity_memory = threat.stolen_memory
      system.credentials = threat.stolen_credentials
      system.state = :active
      
      threat.stolen_memory = nil
      threat.stolen_credentials = nil
    end
  end
end
