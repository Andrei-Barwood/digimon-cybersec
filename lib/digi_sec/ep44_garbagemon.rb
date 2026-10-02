module DigiSec
  class MemoryStack
    attr_accessor :capacity
    def initialize; @capacity = :normal; end
  end
  class Garbagemon
    def self.overflow!(stack); stack.capacity = :overflowed; end
  end
  class LillymonSanitizer
    def self.sanitize!(stack)
      stack.capacity = :normal if stack.capacity == :overflowed
    end
  end
end
