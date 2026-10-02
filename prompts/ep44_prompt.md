# PLANTILLA DE EPISODIO: 44 - Trash Day

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Garbagemon
- **Vector de Ataque (Analogía):** Buffer Overflow / Garbage Collection Exploitation
- **Descripción del Escenario:** Los Garbagemon atacan usando basura (Buffer Overflow). Intentan sobrescribir la pila de los defensores ahogándolos en datos basura.

## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Infraestructura general y Nodos Aliados.
- **Mecanismos de Detección:** Anomalías en el sistema o comportamiento inusual detectado por los defensores.
- **Fallo Preventivo:** La falta de segmentación o control riguroso permitió que la amenaza operara.

## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Lillymon & MetalGreymon
- **Acción Tomada:** Lillymon limpia el exceso de basura (Input Sanitization) y MetalGreymon destruye a los generadores de basura.

## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Volcados de pila llenos de caracteres nulos y basura.
- **Recomendaciones (Post-mortem):** Validación de entradas y protección contra desbordamiento de búfer (ASLR/DEP).

## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep44_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep44_garbagemon.rb`
