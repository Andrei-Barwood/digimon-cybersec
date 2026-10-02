module DigiSec
  class EvolutionProcess
    MAX_BUFFER_SIZE = 100
    attr_accessor :status, :cpu_usage

    def initialize
      @status = :greymon
      @cpu_usage = 10 # 10%
    end

    def force_upgrade!(payload)
      # Ausencia de Bounds Checking: Vulnerabilidad de Buffer Overflow
      if payload.size > MAX_BUFFER_SIZE
        # La memoria es sobreescrita con coraje oscuro
        @status = :corrupted_skullgreymon
        @cpu_usage = 100 # Resource Exhaustion (Zombie Process)
      else
        @status = :metal_greymon
        @cpu_usage = 40
      end
    end
  end

  class OOMKiller
    def self.monitor!(process)
      if process.cpu_usage >= 100
        # El proceso consumió todos los recursos. El kernel aplica un Kill -9
        # y reinicia el servicio en un estado a prueba de fallos.
        process.status = :safe_mode_koromon
        process.cpu_usage = 1 # Reposo
      end
    end
  end
end
