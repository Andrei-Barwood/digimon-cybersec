module DigiSec
  class PiximonSandbox
    attr_accessor :status

    def initialize
      @status = :air_gapped
    end
  end

  class RecklessUser
    attr_accessor :outside_perimeter

    def initialize
      @outside_perimeter = false
    end

    def evade_barrier!
      @outside_perimeter = true
    end

    def transmit_beacon!(sandbox)
      if @outside_perimeter
        # Fuga de telemetría exitosa al saltarse la protección física
        sandbox.status = :exposed
      end
    end
  end

  class TyrannomonMalware
    def self.infiltrate!(sandbox)
      if sandbox.status == :exposed
        sandbox.status = :compromised
      end
    end
  end

  class TrainingRoutine
    def self.deploy_greymon!(sandbox)
      # Purga la amenaza y restaura la configuración original
      if sandbox.status == :compromised
        sandbox.status = :air_gapped
      end
    end
  end
end
