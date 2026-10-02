# PLANTILLA DE EPISODIO: 10 - Episodio 10

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Centarumon (Infectado por Engranaje Negro)
- **Vector de Ataque (Analogía):** Secuestro de Software de Seguridad / Falsos Positivos Inducidos (AV/EDR Hijacking)
- **Descripción del Escenario:** Centarumon es el guardián legítimo de las ruinas (simbolizando una zona central del sistema o base de datos). Un atacante inyecta un Engranaje Negro en este sistema de seguridad (Antivirus o EDR). El malware no ataca directamente los datos, sino que envenena las reglas heurísticas del guardián, provocando que este identifique a los administradores legítimos (Izzy y Mimi) como amenazas, bloqueando su acceso y atacándolos en un caso extremo de Denegación de Servicio por Falsos Positivos.
## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** La base de datos de firmas o el motor de reglas del software de seguridad (Endpoint Protection).
- **Mecanismos de Detección:** Los logs de auditoría (Audit Logs) muestran un pico masivo de bloqueos (Drops / Quarantine) contra cuentas con privilegios de administrador que intentan acceder a recursos normales.
- **Fallo Preventivo:** Ausencia de *Tamper Protection* (protección contra manipulación) en el propio agente de seguridad. El archivo de configuración de reglas pudo ser sobrescrito por un proceso externo sin validación criptográfica.
## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Palmon evoluciona a Togemon (junto con Kabuterimon). Togemon actúa como un *Rollback* forzado o una herramienta de depuración que inyecta *fuzzing* ("Chiku Chiku Bang Bang").
- **Acción Tomada:** Togemon ejecuta un ataque directo sobre el módulo de reglas del guardián. Este impacto (Rollback) depura y sobrescribe las reglas maliciosas inyectadas por el Engranaje Negro, purgando el malware de la memoria del EDR y restaurando la lista blanca original, devolviendo el acceso a los administradores.
## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Firmas maliciosas insertadas en la base de datos del EDR que clasificaban los perfiles de los administradores como *Malware/Threats*.
- **Recomendaciones (Post-mortem):** Implementar mecanismos de *Self-Defense* y *Tamper Protection* en los agentes EDR/Antivirus. Firmar digitalmente las actualizaciones de bases de datos de amenazas y alertar sobre cambios masivos en las heurísticas.
## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep10_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep10_centarumon.rb`
*(El test simula el `CentarumonEDR` que protege los recursos de `SystemRuins`. `BlackGearMalware` inyecta reglas que causan que el EDR bloquee al `AdminUser` (falso positivo). `TogemonDefense.rollback_signatures!` fuerza una restauración de la base de datos de firmas, eliminando la regla maliciosa y restaurando el acceso legítimo al administrador).*
