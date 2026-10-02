module DigiSec
  class JoeNode
    attr_accessor :cpu_load, :enslaved

    def initialize
      @cpu_load = 5 # Reposo
      @enslaved = false
    end
  end

  class DigitamamonMiner
    def self.infect!(node)
      # Crypto-jacking
      node.enslaved = true
      node.cpu_load = 100
    end
  end

  class DemiDevimonSabotage
    def self.sabotage!(node)
      if node.enslaved
        # Inyecta ciclos muertos para asegurar que la carga nunca baje
        node.cpu_load = 100
      end
    end
  end

  class WereGarurumon
    def self.terminate_process!(node)
      # Mata el proceso malicioso (SIGKILL)
      node.enslaved = false
      node.cpu_load = 5
    end
  end
end
