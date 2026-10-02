module DigiSec
  class UserIdentity
    attr_reader :name, :status

    def initialize(name)
      @name = name
      @status = :safe
    end

    def compromise!
      @status = :compromised
    end

    def restore!
      @status = :safe
    end
  end

  class PhishingCampaign
    def self.launch(users)
      # Monzaemon atrae a los usuarios con un señuelo (Toy Town)
      users.each do |user|
        user.compromise!
      end
    end
  end

  class TogemonDefense
    def self.needle_spray!(users)
      # Fuzzing de red/agujas que destruyen el payload oculto (Black Gear)
      # y liberan a las entidades comprometidas
      users.each do |user|
        if user.status == :compromised
          user.restore!
        end
      end
    end
  end
end
