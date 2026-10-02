module DigiSec
  class BeachNode
    attr_accessor :state
    def initialize; @state = :free; end
  end
  class ScorpiomonSpoofer
    def self.trap!(node); node.state = :trapped_in_honeypot; end
  end
  class ZudomonRescue
    def self.break_out!(node)
      node.state = :free if node.state == :trapped_in_honeypot
    end
  end
end
