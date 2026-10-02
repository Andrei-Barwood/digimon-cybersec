module DigiSec
  class DataTraffic
    attr_accessor :interceptor
    def initialize; @interceptor = :ladydevimon; end
  end
  class AngewomonCrypto
    def self.heavens_charm!(traffic)
      traffic.interceptor = :cleared if traffic.interceptor == :ladydevimon
    end
  end
end
