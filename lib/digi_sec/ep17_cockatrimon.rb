module DigiSec
  class CoreSystem
    attr_accessor :processes

    def initialize
      @processes = { ui: :active, network: :active, storage: :active }
    end

    def operational?
      @processes.values.all? { |state| state == :active }
    end
  end

  class CockatrimonMalware
    attr_accessor :active

    def initialize
      @active = true
    end

    def petrify!(system)
      # Envía SIGSTOP (Petrifier) a todos los procesos
      if @active
        system.processes.each_key do |process|
          system.processes[process] = :frozen
        end
      end
    end
  end

  class TogemonWatchdog
    def self.needle_spray!(malware, system)
      # Destruye el malware (Kill -9)
      malware.active = false
      
      # Emite SIGCONT a los procesos para reactivarlos
      system.processes.each_key do |process|
        system.processes[process] = :active
      end
    end
  end
end
