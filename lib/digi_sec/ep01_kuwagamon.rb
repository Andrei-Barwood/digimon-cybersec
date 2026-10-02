module DigiSec
  class NetworkPerimeter
    attr_reader :status, :traffic_log, :capacity

    def initialize(capacity: 100)
      @status = :online
      @traffic_log = []
      @capacity = capacity
      @filter_active = false
    end

    def evolve_and_filter!
      @filter_active = true
    end

    def receive_traffic(packets)
      return if @status == :offline

      packets.each do |packet|
        if @filter_active && packet[:type] == :malicious_syn
          # Paquete descartado (Baby Flame / filtrado)
          next
        end

        @traffic_log << packet
      end

      check_health!
    end

    private

    def check_health!
      if @traffic_log.size > @capacity
        @status = :denial_of_service
        # Failover destructivo de emergencia: Desconectamos la red (Romper el acantilado)
        trigger_failover!
      end
    end

    def trigger_failover!
      @status = :offline
      @traffic_log.clear
    end
  end

  class KuwagamonAttack
    def self.launch(perimeter)
      # Simula una avalancha masiva de peticiones SYN
      massive_payload = Array.new(150) { { type: :malicious_syn, payload: "ROAR" } }
      perimeter.receive_traffic(massive_payload)
    end
  end
end
