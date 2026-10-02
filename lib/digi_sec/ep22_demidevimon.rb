module DigiSec
  class TkNode
    attr_accessor :dns_cache

    def initialize
      @dns_cache = { "tai.digiworld.local" => :trusted_peer }
    end
  end

  class DemiDevimon
    def self.poison!(node)
      # Envenenamiento de caché: asocia el peer legítimo con una dirección hostil/falsa
      node.dns_cache["tai.digiworld.local"] = :hostile_entity
    end
  end

  class TaiNode
    def self.reconnect(node)
      if node.dns_cache["tai.digiworld.local"] == :trusted_peer
        :connection_established
      else
        :connection_refused
      end
    end
  end

  class TokomonDefense
    def self.flush_dns!(node)
      # Purga la mentira y restaura el registro legítimo
      node.dns_cache["tai.digiworld.local"] = :trusted_peer
    end
  end
end
