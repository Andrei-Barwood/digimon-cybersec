module DigiSec
  class NetworkTracker
    attr_accessor :tai_location
    def initialize; @tai_location = :found; end
  end
  class IzzySpoofer
    def self.flood_logs!(tracker)
      tracker.tai_location = :obfuscated
    end
  end
end
