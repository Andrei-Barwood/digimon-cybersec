module DigiSec
  class PermissionError < StandardError; end

  class AdminSession
    attr_reader :user, :status, :hijacking_process

    def initialize(user: "Tai_Root")
      @user = user
      @status = :active
      @hijacking_process = nil
    end

    def lock_by!(process_name)
      @status = :locked
      @hijacking_process = process_name
    end

    def unlock!(attempt_level)
      if @status == :locked && attempt_level < 50
        raise PermissionError, "Acceso Denegado. Nivel de privilegios insuficiente para matar #{@hijacking_process}"
      end
      
      @status = :active
      @hijacking_process = nil
    end
  end

  class ShellmonRansomware
    def self.hijack!(session)
      # Secuestra la sesión (como Shellmon atrapando a Tai)
      session.lock_by!("Shellmon_PID_9999")
    end
  end

  class AgumonDefense
    def self.attempt_rescue(session)
      # Agumon (nivel Infantil / privilegios nivel 10) intenta liberar la sesión
      session.unlock!(10)
    end
  end

  class GreymonDefense
    def self.mega_flame!(session)
      # Greymon (nivel Adulto / privilegios nivel 100) ejecuta fuerza bruta térmica
      session.unlock!(100)
    end
  end
end
