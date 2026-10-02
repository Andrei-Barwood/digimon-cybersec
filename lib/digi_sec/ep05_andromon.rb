module DigiSec
  class AndromonController
    attr_reader :state, :hardware_modules

    def initialize
      @state = :friendly
      @hardware_modules = [:core_logic, :motor_control, :visual_sensors]
    end

    def inject_hardware!(malicious_module)
      @hardware_modules << malicious_module
      @state = :hostile if malicious_module == :black_gear
    end

    def hardware_reset!
      # El reset purga módulos no autorizados y restaura el estado
      @hardware_modules.delete(:black_gear)
      @state = :friendly
    end
  end

  class ScadaFactory
    attr_reader :production_status

    def initialize(controller)
      @controller = controller
      @production_status = :stopped
    end

    def run_production!
      if @controller.state == :friendly
        @production_status = :assembling_parts
      elsif @controller.state == :hostile
        @production_status = :attacking_intruders
      end
    end
  end

  class HardwareImplante
    def self.infect(controller)
      controller.inject_hardware!(:black_gear)
    end
  end

  class KabuterimonDefense
    def self.electro_shocker!(controller)
      # Un pulso electromagnético que fuerza el hardware reset del androide
      controller.hardware_reset!
    end
  end
end
