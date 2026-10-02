module DigiSec
  class SystemData
    attr_accessor :data
    def initialize; @data = :exists; end
  end
  class Apocalymon
    def self.total_wipe!(system)
      system.data = :deleted_binary_space
    end
  end
  class InternalEnclave
    def self.rebuild_from_memory!(system)
      system.data = :restored_from_hearts
    end
  end
end
