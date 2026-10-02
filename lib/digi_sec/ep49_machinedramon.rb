module DigiSec
  class MachinedramonAPT
    attr_accessor :status
    def initialize; @status = :active; end
  end
  class WarGreymonBareMetal
    def self.dramon_destroyer!(enemy)
      enemy.status = :sliced_to_pieces
    end
  end
end
