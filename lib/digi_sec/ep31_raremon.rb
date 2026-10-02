module DigiSec
  class TokyoBaySystem
    attr_accessor :memory_status
    def initialize; @memory_status = :clean; end
  end
  class RaremonCorruption
    def self.leak_memory!(sys); sys.memory_status = :corrupted_leak; end
  end
  class KabuterimonGC
    def self.collect_garbage!(sys)
      sys.memory_status = :clean if sys.memory_status == :corrupted_leak
    end
  end
end
