module DigiSec
  class EighthChildNode
    attr_accessor :discovered
    def initialize; @discovered = false; end
  end
  class GatomonScanner
    def self.scan_internal!(node); node.discovered = true; end
  end
end
