# PLANTILLA DE EPISODIO: 32 - Gatomon Comes Calling

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Gatomon
- **Vector de Ataque (Analogía):** Insider Threat / Unauthorized Scanning
- **Descripción del Escenario:** Gatomon busca al octavo niño dentro de la red aliada. Actúa como un Insider Threat escaneando permisos (buscando el emblema) sin levantar alarmas de los IDS perimetrales.

## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Infraestructura general y Nodos Aliados.
- **Mecanismos de Detección:** Anomalías en el sistema o comportamiento inusual detectado por los defensores.
- **Fallo Preventivo:** La falta de segmentación o control riguroso permitió que la amenaza operara.

## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Falta de Autenticación Mutua
- **Acción Tomada:** Los defensores no la detectan a tiempo. Se requiere monitoreo interno (User Entity Behavior Analytics).

## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Logs de escaneo de puertos internos.
- **Recomendaciones (Post-mortem):** Implementar segmentación interna y Zero Trust.

## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep32_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep32_gatomon.rb`
