module DigiSec
  class DefenderGroup
    attr_accessor :status

    def initialize
      @status = :defending
    end
  end

  class MyotismonAPT
    def self.defeat!(defenders)
      # Zero-Day destruye las defensas convencionales
      if defenders.status == :defending
        defenders.status = :destroyed
      end
    end
  end

  class GarudamonProtocol
    def self.evasive_escape!(defenders, apt)
      # Si están bajo ataque, en lugar de pelear, ofusca y escapa
      # Wing Blade / Smoke Screen
      defenders.status = :escaped_safely
    end
  end
end
