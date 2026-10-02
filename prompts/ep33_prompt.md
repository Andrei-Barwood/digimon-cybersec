# PLANTILLA DE EPISODIO: 33 - Out on the Town

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Pumpkinmon & Gotsumon
- **Vector de Ataque (Analogía):** Shadow IT / Rogue Processes
- **Descripción del Escenario:** Dos procesos no autorizados (Pumpkinmon y Gotsumon) de la botnet enemiga operan en Shibuya pero no causan daño, consumiendo recursos menores (Shadow IT). Myotismon los purga por inactividad maliciosa.

## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Infraestructura general y Nodos Aliados.
- **Mecanismos de Detección:** Anomalías en el sistema o comportamiento inusual detectado por los defensores.
- **Fallo Preventivo:** La falta de segmentación o control riguroso permitió que la amenaza operara.

## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Matt & T.K. (Observadores)
- **Acción Tomada:** El propio C2 (Myotismon) aplica un kill a los procesos rebeldes. La lección es auditar todos los procesos, incluso los aparentemente inofensivos.

## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Procesos huérfanos terminados por un kill remoto.
- **Recomendaciones (Post-mortem):** Implementar Application Whitelisting.

## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep33_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep33_pumpkinmongotsumon.rb`
