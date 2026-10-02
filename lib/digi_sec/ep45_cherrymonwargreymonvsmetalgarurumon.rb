module DigiSec
  class DefenderCluster
    attr_accessor :status
    def initialize; @status = :synchronized; end
  end
  class CherrymonLogicBomb
    def self.inject!(cluster); cluster.status = :friendly_fire; end
  end
  class KariEntity
    def self.resolve!(cluster)
      cluster.status = :synchronized if cluster.status == :friendly_fire
    end
  end
end
