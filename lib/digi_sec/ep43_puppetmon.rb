module DigiSec
  class TkSession
    attr_accessor :controlled_by
    def initialize; @controlled_by = :self; end
  end
  class Puppetmon
    def self.rce!(session); session.controlled_by = :puppetmon; end
  end
  class TkSocialEngineering
    def self.reverse_hack!(session)
      session.controlled_by = :self if session.controlled_by == :puppetmon
    end
  end
end
