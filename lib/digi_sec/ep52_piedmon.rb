module DigiSec
  class KeychainNode
    attr_accessor :state
    def initialize; @state = :encrypted_keychain; end
  end
  class MagnaAngemon
    def self.restore_and_null_route!(node, enemy)
      node.state = :active if node.state == :encrypted_keychain
      enemy.status = :routed_to_null
    end
  end
  class PiedmonEnemy
    attr_accessor :status
    def initialize; @status = :active; end
  end
end
