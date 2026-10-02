module DigiSec
  class ServerCore
    attr_accessor :kernel_status, :routing_table

    def initialize
      @kernel_status = :clean
      @routing_table = :digiworld_local
    end
  end

  class EtemonRootkit
    def self.fuse!(server)
      # El malware se arraiga en el núcleo del sistema
      server.kernel_status = :compromised_rootkit
    end
  end

  class MetalGreymonDefense
    def self.giga_destroyer!(server)
      if server.kernel_status == :compromised_rootkit
        # Purga el Rootkit pero daña la infraestructura subyacente
        server.kernel_status = :destroyed
        
        # Efecto secundario: Routing Loop/Rift Dimensional
        server.routing_table = :real_world_external
      end
    end
  end
end
