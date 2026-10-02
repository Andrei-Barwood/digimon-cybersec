# PLANTILLA DE EPISODIO: 51 - The Crest of Friendship

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Piedmon
- **Vector de Ataque (Analogía):** Ransomware Encryption (File Locking)
- **Descripción del Escenario:** Piedmon convierte a los niños y Digimon en llaveros (Ransomware que cifra y bloquea los archivos/nodos, haciéndolos inutilizables). Matt vuelve para reconectar el cluster.

## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Infraestructura general y Nodos Aliados.
- **Mecanismos de Detección:** Anomalías en el sistema o comportamiento inusual detectado por los defensores.
- **Fallo Preventivo:** La falta de segmentación o control riguroso permitió que la amenaza operara.

## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Matt (Reconexión de Red) / Garurumon
- **Acción Tomada:** Matt restaura su emblema (Sincronización de Red). Aunque no los desencripta aún, evita que T.K. sea cifrado, asegurando el backup final.

## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Nodos convertidos a un formato propietario encriptado (Llavero).
- **Recomendaciones (Post-mortem):** Backups inmutables y segregados.

## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep51_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep51_piedmon.rb`
