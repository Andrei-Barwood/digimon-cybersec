module DigiSec
  class AdminUser
    attr_reader :name

    def initialize(name)
      @name = name
    end
  end

  class CentarumonEDR
    attr_reader :blocked_users

    def initialize
      # Reglas por defecto: ningún admin legítimo está bloqueado
      @blocked_users = []
    end

    def allow_access?(user)
      !@blocked_users.include?(user.name)
    end

    def inject_malicious_rule!(rule)
      @blocked_users << rule
    end

    def rollback_rules!
      @blocked_users.clear
    end
  end

  class BlackGearMalware
    def self.infect(edr, target_user)
      # Manipula el EDR para que considere al usuario como amenaza (falso positivo)
      edr.inject_malicious_rule!(target_user.name)
    end
  end

  class TogemonDefense
    def self.rollback_signatures!(edr)
      # Depura y hace rollback de las reglas del EDR a un estado seguro
      edr.rollback_rules!
    end
  end
end
