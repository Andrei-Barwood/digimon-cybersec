# PLANTILLA DE EPISODIO: 48 - My Sister's Keeper

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Machinedramon
- **Vector de Ataque (Analogía):** Infrastructure DDoS / Availability Loss
- **Descripción del Escenario:** Kari cae enferma (Fallo de Hardware/Disponibilidad). Tai busca medicinas, pero Machinedramon monitorea la red, rastreando su IP cada vez que usan una computadora (Red de Vigilancia / Spyware masivo).

## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Infraestructura general y Nodos Aliados.
- **Mecanismos de Detección:** Anomalías en el sistema o comportamiento inusual detectado por los defensores.
- **Fallo Preventivo:** La falta de segmentación o control riguroso permitió que la amenaza operara.

## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Izzy (IP Spoofing / Camuflaje)
- **Acción Tomada:** Izzy altera las conexiones de los hospitales, inundando la red de Machinedramon con falsos positivos (IP Spoofing) para ocultar a Tai.

## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Rastreo de logs de red de Machinedramon.
- **Recomendaciones (Post-mortem):** Uso de VPNs y Tor para evadir la vigilancia masiva de red.

## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep48_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep48_machinedramon.rb`
