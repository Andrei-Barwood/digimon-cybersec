# PLANTILLA DE EPISODIO: 28 - It's All in the Cards

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Ninguno directo (Fase de Reconocimiento de Myotismon)
- **Vector de Ataque (Analogía):** *Threat Hunting* / *Log Correlation* (Correlación de Logs Históricos)
- **Descripción del Escenario:** Los niños regresan al mundo real (Campamento de Verano) y luego viajan a Hikarigaoka, buscando al Octavo Niño. Descubren que todos estuvieron allí años atrás durante un incidente pasado (la pelea de Greymon vs Parrotmon). En ciberseguridad, esto representa una fase de **Threat Hunting**: en lugar de un combate directo, los administradores (los niños) están correlacionando *logs* históricos (sus recuerdos) para perfilar a un objetivo de alto valor (el Octavo Nodo) antes de que el APT (Myotismon) ejecute su escaneo y lo comprometa.

## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Bases de datos de empadronamiento y registros históricos (Población de Hikarigaoka).
- **Mecanismos de Detección:** El sistema SIEM (el cerebro analítico de Izzy) detecta una anomalía compartida: todos los nodos actuales estuvieron conectados a la misma subred (Hikarigaoka) en el pasado.
- **Fallo Preventivo:** La falta de retención a largo plazo de *logs* hizo que este patrón no fuera evidente de inmediato. El atacante ya está realizando reconocimiento activo (*Footprinting*) sobre la misma región.

## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Análisis Heurístico / Extracción de Datos en Memoria.
- **Acción Tomada:** Los nodos aliados inician una auditoría interna retrospectiva (recordando el incidente). Esta correlación cruzada permite limitar la superficie de búsqueda (saber que el octavo niño vivió allí y vio la misma anomalía). Al identificar este patrón, los defensores se adelantan un paso al escaneo masivo del atacante.

## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Rastros de memoria de un evento *Zero-Day* pasado (Parrotmon) que afectó a múltiples usuarios simultáneamente.
- **Recomendaciones (Post-mortem):** Configurar los sistemas SIEM para retener *logs* de incidentes críticos durante años, permitiendo trazar correlaciones (Threat Intelligence) contra campañas APT futuras.

## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep28_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep28_threat_hunting.rb`
*(El test simula un `SIEMSystem` que analiza `historical_logs`. Al ejecutar `IzzyAnalyzer.correlate_logs!`, se cruzan los datos de ubicación y se identifica el `eighth_node_profile`, limitando la superficie de búsqueda antes de que `MyotismonAPT` lo encuentre).*
