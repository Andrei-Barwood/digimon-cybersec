module DigiSec
  class WhamonProxy
    attr_accessor :status
    def initialize; @status = :active; end
  end
  class WarGreymonExploit
    def self.brave_tornado!(enemy, proxy)
      proxy.status = :destroyed
      :enemy_defeated
    end
  end
end
