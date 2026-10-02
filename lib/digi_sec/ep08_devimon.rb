module DigiSec
  class DefenseNode
    attr_reader :name, :status

    def initialize(name)
      @name = name
      @status = :alive
    end

    def destroy!
      @status = :destroyed
    end
  end

  class SocCluster
    attr_reader :subnets

    def initialize(nodes)
      # Inicialmente todos están en la misma subred maestra (Isla File)
      @subnets = { master_subnet: nodes }
    end

    def apply_partition!(new_routing_table)
      @subnets = new_routing_table
    end

    def all_nodes
      @subnets.values.flatten
    end
  end

  class DevimonAPT
    def self.partition_network!(cluster)
      nodes = cluster.all_nodes
      # Devimon usa BGP Hijacking para dividir el cluster
      # Asignando a cada nodo su propia subred aislada
      malicious_routing_table = {}
      nodes.each_with_index do |node, index|
        malicious_routing_table["isolated_subnet_#{index}".to_sym] = [node]
      end
      
      cluster.apply_partition!(malicious_routing_table)
      
      # Nota: Devimon intenta destruirlos aislados, pero la tolerancia a fallos
      # hace que los nodos simplemente sigan vivos en sus subredes.
    end
  end
end
