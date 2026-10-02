module DigiSec
  class CastleSystem
    attr_accessor :state

    def initialize
      @state = :sleeping
    end

    def wake_up!(key)
      if key == :mimi_song
        @state = :corrupted_service
      else
        @state = :sleeping
      end
    end
  end

  class MimiAdmin
    attr_accessor :key_held

    def initialize
      @key_held = true
    end

    def provide_key
      @key_held ? nil : :mimi_song
    end
  end

  class SoraAudit
    def self.enforce_policy!(admin)
      # Presión por pares (Auditoría) fuerza al administrador a liberar la clave
      admin.key_held = false
    end
  end

  class MetalGreymonDefense
    def self.terminate_service!(system)
      if system.state == :corrupted_service
        # Elimina el servicio hostil
        system.state = :terminated
      end
    end
  end
end
