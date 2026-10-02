module DigiSec
  class TaiClient
    attr_accessor :network_location, :session_status

    def initialize
      @network_location = :external_subnet
      @session_status = :degraded # Koromon
    end
  end

  class OgremonThreat
    def self.intercept!(client)
      if client.network_location == :external_subnet
        client.session_status = :under_attack
      end
    end
  end

  class AgumonVPN
    def self.reconnect_tunnel!(client)
      if client.session_status == :under_attack
        # Agumon defiende y restablece la conexión
        client.network_location = :internal_cluster
        client.session_status = :secured
      end
    end
  end
end
