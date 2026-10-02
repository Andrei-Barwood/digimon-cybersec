# PLANTILLA DE EPISODIO: 36 - City Under Siege

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Phantomon
- **Vector de Ataque (Analogía):** Ransomware / Network Isolation
- **Descripción del Escenario:** Una barrera de niebla aísla Odaiba del resto del mundo (Network Isolation). Los adultos son capturados y puestos a dormir (Denial of Service / Ransomware a nivel de infraestructura).

## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Infraestructura general y Nodos Aliados.
- **Mecanismos de Detección:** Anomalías en el sistema o comportamiento inusual detectado por los defensores.
- **Fallo Preventivo:** La falta de segmentación o control riguroso permitió que la amenaza operara.

## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Sora & Biyomon
- **Acción Tomada:** Los defensores intentan romper el aislamiento físico. Sora es capturada (Ransomware retiene un nodo clave).

## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Pérdida total de telemetría exterior.
- **Recomendaciones (Post-mortem):** Crear canales de comunicación Out-of-Band (OOB).

## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep36_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep36_phantomon.rb`
