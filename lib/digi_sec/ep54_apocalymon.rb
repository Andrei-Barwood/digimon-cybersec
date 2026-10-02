module DigiSec
  class ApocalymonBomb
    attr_accessor :detonated
    def initialize; @detonated = true; end
  end
  class DigiviceContainment
    def self.contain_blast!(bomb, digital_world)
      digital_world.status = :rebooted_safely if bomb.detonated
    end
  end
  class FinalDigitalWorld
    attr_accessor :status
    def initialize; @status = :under_threat; end
  end
end
