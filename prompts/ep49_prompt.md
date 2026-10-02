# PLANTILLA DE EPISODIO: 49 - The Crest of Light

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Machinedramon
- **Vector de Ataque (Analogía):** Hardware-level wipe / Bare-metal purge
- **Descripción del Escenario:** Machinedramon intenta destruir la ciudad completa (Wiper). Kari emite la Luz (Hard Reset) que cura a los Digimon. WarGreymon ejecuta un 'Dramon Destroyer', un exploit diseñado a nivel bare-metal contra dragones mecánicos.

## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Infraestructura general y Nodos Aliados.
- **Mecanismos de Detección:** Anomalías en el sistema o comportamiento inusual detectado por los defensores.
- **Fallo Preventivo:** La falta de segmentación o control riguroso permitió que la amenaza operara.

## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** WarGreymon (Zero-Day Específico)
- **Acción Tomada:** WarGreymon usa una firma ultra específica (Dramon Killers) que ignora las defensas lógicas y corta a Machinedramon a nivel de silicio.

## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Hardware del servidor despiezado sin recuperación posible.
- **Recomendaciones (Post-mortem):** Protección física de servidores.

## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep49_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep49_machinedramon.rb`
