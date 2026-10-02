module DigiSec
  class DigiNode
    attr_accessor :state
    def initialize; @state = :active; end
  end
  class PiedmonEncrypter
    def self.turn_to_keychain!(node)
      node.state = :encrypted_keychain
    end
  end
end
