module DigiSec
  class MyotismonProcess
    attr_accessor :status
    def initialize; @status = :running; end
  end
  class AngewomonEngine
    def self.celestial_arrow!(process, tokens)
      process.status = :terminated if tokens == 8
    end
  end
end
