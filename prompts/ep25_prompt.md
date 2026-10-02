# PLANTILLA DE EPISODIO: 25 - Princess Karaoke

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** ShogunGekomon (Servicio Corrupto) / Mimi (Administrador Negligente)
- **Vector de Ataque (Analogía):** *Insider Threat* (Retención de Privilegios) y Servicio Corrupto Post-Activación
- **Descripción del Escenario:** Mimi posee la clave única (su voz/canción) para despertar el servicio principal del castillo (ShogunGekomon). Al disfrutar de sus privilegios como "princesa" (Administradora del sistema), se niega a ingresar la clave, causando una Denegación de Servicio (DoS) administrativa para el resto de los usuarios. Cuando finalmente es convencida de ingresar las credenciales, el servicio que despierta resulta estar corrupto y hostil (ShogunGekomon ataca a todos).

## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Políticas de acceso y gestión de claves criptográficas de un solo usuario (Single Point of Failure).
- **Mecanismos de Detección:** Los demás usuarios (Tai, Joe) están bloqueados fuera de las funciones del sistema. La administradora ignora los *tickets* de soporte repetidamente.
- **Fallo Preventivo:** Ausencia de control de acceso por Quórum (Separation of Duties). El sistema dependía de una única clave sin un mecanismo de anulación o recuperación en caso de negligencia del administrador.

## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Sora (Revisión por Pares) y MetalGreymon (Purga del Servicio).
- **Acción Tomada:** Mediante ingeniería social benigna (revisión y presión por pares liderada por Sora), Mimi ingresa la clave. Al detectar que el servicio reactivado (ShogunGekomon) es malicioso/corrupto, MetalGreymon interviene de inmediato y derriba el proceso defectuoso, restaurando la estabilidad de la red.

## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Un demonio de sistema (ShogunGekomon) que consumía todos los recursos y atacaba las conexiones locales tras su inicialización.
- **Recomendaciones (Post-mortem):** Implementar *Multi-Party Authorization* para acciones críticas (despertar servicios de nivel 0) y testear los servicios en entornos seguros antes de pasarlos a producción.

## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep25_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep25_shogungekomon.rb`
*(El test simula un `MimiAdmin` con `key_held = true`. `TaiUser` no puede acceder al sistema. Tras `SoraAudit.enforce_policy!(mimi)`, se ingresa la clave. `CastleSystem.wake_up!(key)` revela que el estado es `:corrupted_service`. Finalmente, `MetalGreymonDefense.terminate_service!` detiene al servicio corrupto).*
