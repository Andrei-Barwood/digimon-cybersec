module DigiSec
  class VenomCore
    attr_accessor :status
    def initialize; @status = :hidden; end
  end
  class MegaDefenders
    def self.destroy_core!(core)
      core.status = :destroyed if core.status == :hidden
    end
  end
end
