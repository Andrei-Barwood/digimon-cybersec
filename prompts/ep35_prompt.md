# PLANTILLA DE EPISODIO: 35 - Flower Power

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** DarkTyrannomon
- **Vector de Ataque (Analogía):** Privilege Escalation / Evasion
- **Descripción del Escenario:** DarkTyrannomon ataca causando estragos, pero Togemon no puede detenerlo. Lillymon aparece, neutralizando la amenaza con evasión y encantos (aislamiento de red suave sin destrucción).

## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Infraestructura general y Nodos Aliados.
- **Mecanismos de Detección:** Anomalías en el sistema o comportamiento inusual detectado por los defensores.
- **Fallo Preventivo:** La falta de segmentación o control riguroso permitió que la amenaza operara.

## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Lillymon (Network Isolation / Sandboxing)
- **Acción Tomada:** Lillymon pacifica al malware, encapsulándolo en un entorno seguro (Sandbox) en lugar de destruirlo, deteniendo la carga de CPU.

## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Malware en estado de suspensión (Sleep).
- **Recomendaciones (Post-mortem):** Utilizar Sandboxes para analizar malware sin destruirlo.

## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep35_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep35_darktyrannomon.rb`
