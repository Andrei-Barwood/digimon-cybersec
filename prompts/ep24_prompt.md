# PLANTILLA DE EPISODIO: 24 - No Questions, Please

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Vademon
- **Vector de Ataque (Analogía):** *Memory Dumping* / Robo de Credenciales (Ingeniería Social)
- **Descripción del Escenario:** Izzy y Tentomon caen en la dimensión de Vademon. Mediante manipulación psicológica (Ingeniería Social), Vademon convence a Izzy de que "renuncie a su curiosidad", lo que se traduce en un volcado de memoria voluntario (*Memory Dump*) de sus datos personales y la entrega de su token de autenticación (el Emblema). El sistema de Izzy queda zombificado y sin capacidad de análisis.

## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** La interfaz de usuario (Ingeniería Social) y la gestión de memoria volátil.
- **Mecanismos de Detección:** El proceso centinela (Tentomon) detecta una baja drástica en la entropía del sistema y la exportación masiva de credenciales y *cache* hacia un servidor no autorizado.
- **Fallo Preventivo:** Ausencia de controles de *Data Loss Prevention* (DLP). El administrador (Izzy) poseía permisos para exportar tokens críticos sin un sistema de autorización de múltiples factores (MFA) que detuviera el volcado bajo coacción o engaño.

## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** MegaKabuterimon (Inyección de Memoria y Purga - *Horn Buster*).
- **Acción Tomada:** Tentomon alerta a Izzy, forzando un reinicio cognitivo. Izzy re-importa su *Memory Dump* (recuperando su curiosidad y credenciales). Tras restablecer su estado, escala privilegios. MegaKabuterimon elimina la amenaza aislando la dimensión corrupta y borrando los procesos de Vademon.

## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Archivos de volcado de memoria no encriptados encontrados en el servidor de Vademon.
- **Recomendaciones (Post-mortem):** Implementar *Data Loss Prevention* (DLP) estricto. Bloquear comandos como `procdump` y exigir hardware *tokens* (MFA) para exportar credenciales críticas.

## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep24_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep24_vademon.rb`
*(El test simula a `IzzySystem` sufriendo un `Vademon.memory_dump!`. Su estado pasa a `:zombified` y sus credenciales son robadas. `TentomonSentinel.restore_memory!` devuelve los datos, e `IzzySystem.evolve_to_megakabuterimon!` erradica al atacante).*
