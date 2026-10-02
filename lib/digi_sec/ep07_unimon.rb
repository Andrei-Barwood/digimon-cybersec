module DigiSec
  class TrustedService
    attr_reader :is_whitelisted, :status, :processes

    def initialize
      @is_whitelisted = true
      @status = :benign
      @processes = [:core_daemon, :holy_ring_auth]
    end

    def update_from!(dependency)
      if dependency.has_payload?
        @processes << :black_gear
        @status = :hostile
      end
    end

    def remove_process!(process_name)
      @processes.delete(process_name)
      @status = :benign unless @processes.include?(:black_gear)
    end
  end

  class InfectedDependency
    def has_payload?
      true
    end
  end

  class SimpleFirewall
    def self.block?(service)
      # Al ser whitelist, el firewall tradicional lo ignora aunque sea hostil
      !service.is_whitelisted
    end
  end

  class IkkakumonDefense
    def self.harpoon_torpedo!(service)
      # Inspecciona memoria y elimina el payload malicioso específicamente
      if service.processes.include?(:black_gear)
        service.remove_process!(:black_gear)
      end
    end
  end
end
