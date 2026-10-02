module DigiSec
  class SIEMSystem
    attr_accessor :historical_logs, :target_profile

    def initialize
      @historical_logs = [
        { user: "Tai", location: "Hikarigaoka", event: "Parrotmon_Anomaly" },
        { user: "Matt", location: "Hikarigaoka", event: "Parrotmon_Anomaly" },
        { user: "Sora", location: "Hikarigaoka", event: "Parrotmon_Anomaly" },
        { user: "Unknown_8", location: "Hikarigaoka", event: "Parrotmon_Anomaly" }
      ]
      @target_profile = nil
    end
  end

  class IzzyAnalyzer
    def self.correlate_logs!(siem)
      # Encuentra a los usuarios afectados por la anomalía original
      affected = siem.historical_logs.select { |log| log[:event] == "Parrotmon_Anomaly" && log[:location] == "Hikarigaoka" }
      
      # Perfila al nodo desconocido
      unknown = affected.find { |log| log[:user] == "Unknown_8" }
      siem.target_profile = unknown if unknown
    end
  end

  class MyotismonAPT
    def self.scan!(siem)
      if siem.target_profile.nil?
        # Si los defensores no han correlacionado, el APT tiene ventaja
        :apt_advantage
      else
        # Si los defensores perfilaron al objetivo, pueden defenderlo
        :defenders_advantage
      end
    end
  end
end
