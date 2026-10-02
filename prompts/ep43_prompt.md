# PLANTILLA DE EPISODIO: 43 - Playing Games

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Puppetmon
- **Vector de Ataque (Analogía):** Remote Code Execution / Social Engineering
- **Descripción del Escenario:** Puppetmon usa muñecos vudú para controlar físicamente a los niños (Remote Code Execution a través de vectores sociales). Manipula las variables de entorno de T.K.

## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Infraestructura general y Nodos Aliados.
- **Mecanismos de Detección:** Anomalías en el sistema o comportamiento inusual detectado por los defensores.
- **Fallo Preventivo:** La falta de segmentación o control riguroso permitió que la amenaza operara.

## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** T.K. (Spoofing the Spoofer)
- **Acción Tomada:** T.K. usa ingeniería social inversa para engañar a Puppetmon, destruyendo el servidor de RCE (el cuarto de juegos).

## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Artefactos de control remoto no autorizados (Muñecos).
- **Recomendaciones (Post-mortem):** Deshabilitar la ejecución de macros remotas y RDP no autenticado.

## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep43_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep43_puppetmon.rb`
