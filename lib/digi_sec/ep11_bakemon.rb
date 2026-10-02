module DigiSec
  class AuthRequest
    attr_accessor :is_spoofed, :is_obfuscated, :is_blocked

    def initialize
      @is_spoofed = false
      @is_obfuscated = false
      @is_blocked = false
    end
  end

  class AuthService
    attr_reader :status

    def initialize
      @status = :secure
    end

    def process(request)
      return if request.is_blocked
      
      # Si el request es falso y está ofuscado, el sistema confía en él (falla la prevención)
      if request.is_spoofed && request.is_obfuscated
        @status = :hijacked
      end
    end

    def status=(new_status)
      @status = new_status
    end
  end

  class BakemonSpoofing
    def self.spoof!(request)
      # Bakemon falsifica el certificado y ofusca el payload
      request.is_spoofed = true
      request.is_obfuscated = true
    end
  end

  class JoeSutra
    def self.deobfuscate!(request)
      # El "Sutra" debilita a Lord Bakemon revelando su firma original
      request.is_obfuscated = false
    end
  end

  class BirdramonDefense
    def self.meteor_wing!(request, service)
      # Purga la request expuesta y restaura la sesión
      if request.is_spoofed && !request.is_obfuscated
        request.is_blocked = true
        service.status = :secure
      end
    end
  end
end
