module DigiSec
  class SystemController
    attr_reader :cpu_usage, :status, :infected

    def initialize
      @cpu_usage = 10
      @status = :normal
      @infected = false
    end

    def tick!
      if @infected
        # Comportamiento malicioso inyectado (Wiper)
        @cpu_usage = 100
        @status = :overheating
      else
        # Comportamiento normal
        @cpu_usage = 10
        @status = :normal
      end
    end

    def inject_malware!
      @infected = true
    end

    def apply_hotpatch!
      @infected = false
      # Reiniciamos estado tras el parcheo
      tick!
    end
  end

  class BlackGearInjector
    def self.infect(controller)
      controller.inject_malware!
      controller.tick!
    end
  end

  class BirdramonDefense
    def self.meteor_wing!(controller)
      # Destruye el engranaje negro mediante un hotpatch sin matar el proceso
      controller.apply_hotpatch!
    end
  end
end
