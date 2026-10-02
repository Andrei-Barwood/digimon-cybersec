module DigiSec
  class MetalEtemon
    attr_accessor :armor
    def initialize; @armor = :indestructible; end
  end
  class ZudomonHammer
    def self.break_armor!(enemy)
      enemy.armor = :vulnerable if enemy.armor == :indestructible
    end
  end
end
