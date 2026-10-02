module DigiSec
  class KariNode
    attr_accessor :auth_level
    def initialize; @auth_level = :unverified; end
  end
  class WizardmonAuth
    def self.verify_identity!(node, token)
      node.auth_level = :admin if token == :crest_of_light
    end
  end
end
