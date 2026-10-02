module DigiSec
  class SystemThread
    attr_reader :status

    def initialize
      @status = :active
      @malware_injected = false
    end

    def freeze!
      @status = :frozen
      @malware_injected = true
    end

    def interrupt_and_purge!
      if @malware_injected
        @malware_injected = false
        @status = :active
      end
    end
  end

  class YukidarumonDoS
    def self.absolute_zero!(thread)
      # Simula el agotamiento de recursos o deadlock
      thread.freeze!
    end
  end

  class AgumonDefense
    def self.baby_flame!(thread)
      # Actúa como Watchdog Timer, lanzando una interrupción que destraba el hilo
      thread.interrupt_and_purge!
    end
  end
end
