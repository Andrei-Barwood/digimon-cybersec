module DigiSec
  class HikarigaokaSubnet
    attr_accessor :traffic_load, :hidden_node_revealed

    def initialize
      @traffic_load = :normal
      @hidden_node_revealed = false
    end
  end

  class Mammothmon
    def self.brute_force_attack!(subnet)
      subnet.traffic_load = :critical_ddos
      
      # Si el ataque persiste demasiado, el nodo oculto se verá forzado a responder
      # (Se probará en los tests simulando la falta de mitigación)
    end
  end

  class GarudamonWAF
    def self.block_and_purge!(subnet)
      if subnet.traffic_load == :critical_ddos
        # Intercepta el ataque volumétrico y purga la amenaza
        subnet.traffic_load = :normal
      end
    end
  end
end
