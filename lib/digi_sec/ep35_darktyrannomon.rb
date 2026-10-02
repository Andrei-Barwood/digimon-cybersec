module DigiSec
  class OdaibaNode
    attr_accessor :threat_status
    def initialize; @threat_status = :active_attack; end
  end
  class LillymonSandbox
    def self.pacify!(node)
      node.threat_status = :quarantined_peacefully if node.threat_status == :active_attack
    end
  end
end
