module DigiSec
  class EtemonThreat
    attr_accessor :state
    def initialize; @state = :deleted; end
    def resurrect!; @state = :metal_etemon_bootkit; end
  end
  class SaberLeomonRescue
    def self.evade!(threat)
      :escaped if threat.state == :metal_etemon_bootkit
    end
  end
end
