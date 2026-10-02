module DigiSec
  class ShibuyaServer
    attr_accessor :rogue_processes
    def initialize; @rogue_processes = [:pumpkinmon, :gotsumon]; end
  end
  class MyotismonC2
    def self.purge_rogues!(server)
      server.rogue_processes.clear
    end
  end
end
