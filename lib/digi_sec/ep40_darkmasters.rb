module DigiSec
  class DigitalWorld
    attr_accessor :topology
    def initialize; @topology = :normal; end
  end
  class DarkMasters
    def self.reformat!(world); world.topology = :spiral_mountain; end
  end
  class PiximonBackup
    def self.stealth_escape!(children); :safe_but_offline; end
  end
end
