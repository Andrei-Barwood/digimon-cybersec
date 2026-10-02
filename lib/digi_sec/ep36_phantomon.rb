module DigiSec
  class TokyoGrid
    attr_accessor :connectivity
    def initialize; @connectivity = :online; end
  end
  class PhantomonIsolator
    def self.isolate!(grid); grid.connectivity = :isolated_by_fog; end
  end
end
