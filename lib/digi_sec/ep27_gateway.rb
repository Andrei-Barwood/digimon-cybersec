module DigiSec
  class DimensionalGateway
    def initialize
      @status = :closed
      @correct_hash = "Agumon-Gomamon-Pattern"
    end

    def unlock!(cards)
      if cards.join("-") == @correct_hash
        @status = :open
        :access_granted
      else
        :access_denied
      end
    end

    def status
      @status
    end
  end

  class IzzyAnalyzer
    def self.solve_puzzle
      # Descifra el patrón criptográfico de las cartas
      ["Agumon", "Gomamon", "Pattern"]
    end
  end
end
