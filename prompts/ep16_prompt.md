# PLANTILLA DE EPISODIO: 16 - SkullGreymon's Dark Evolution

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** SkullGreymon (Proceso Interno Corrompido / Zombie Process)
- **Vector de Ataque (Analogía):** *Buffer Overflow* / Fallo Crítico por Escalada de Privilegios Forzada
- **Descripción del Escenario:** Ante la presión de derrotar al Greymon de Etemon, Tai fuerza la evolución de Greymon inyectando coraje negativo. Esta sobrecarga de datos sin validación provoca una "Dark Evolution" (Evolución Oscura). En ciberseguridad, esto es análogo a un **Buffer Overflow**: un administrador inyecta un input malicioso o sobredimensionado para forzar una escalada de privilegios a *root*. Al no existir validación de límites, el proceso legítimo se corrompe y se convierte en un *Zombie Process* (SkullGreymon) altamente destructivo y fuera de control.
## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** La interfaz de paso de parámetros para el escalado de privilegios (El Emblema del Coraje).
- **Mecanismos de Detección:** El sistema detecta un evento *Out of Memory* (OOM) o *Kernel Panic* parcial, así como un proceso consumiendo el 100% de CPU y atacando la red interna de forma caótica.
- **Fallo Preventivo:** Ausencia total de sanitización de entradas (*Input Validation*) y comprobación de límites de memoria (*Bounds Checking*). El sistema aceptó incondicionalmente las instrucciones corruptas de Tai, permitiendo que el payload sobrescribiera el espacio de memoria reservado.
## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Rutina `OOM-Killer` (Out-Of-Memory Killer) del Sistema Operativo.
- **Acción Tomada:** Como no hay otro Digimon capaz de enfrentarlo, se debe esperar a que el proceso consuma toda su energía. En ciberseguridad, un proceso desbocado de este tipo desencadena una condición de *Resource Exhaustion* (Agotamiento de Recursos). La mitigación natural es que el kernel invoque su `OOM-Killer` para matar (Kill `-9`) forzosamente el proceso `SkullGreymon`. Una vez muerto el proceso zombie, el servicio se reinicia automáticamente en "Modo Seguro" o *Safe Mode* (representado por su regresión hasta Koromon).
## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** *Core Dumps* y *Stack Traces* que evidencian la sobreescritura de memoria más allá de los límites esperados (Buffer Overflow).
- **Recomendaciones (Post-mortem):** Auditar los inputs de los usuarios con mayores privilegios. Utilizar lenguajes *Memory-Safe* (como Rust, o configuraciones estrictas en Ruby/C), e implementar *Address Space Layout Randomization* (ASLR) y *Bounds Checking* obligatorios.
## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep16_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep16_skullgreymon.rb`
*(El test simula un `EvolutionProcess` que recibe un input. Si el payload supera el tamaño máximo permitido (`MAX_BUFFER_SIZE`), el proceso sufre un Buffer Overflow y su estado pasa a `:corrupted_skullgreymon`, consumiendo recursos masivos. `OOMKiller.monitor!` detecta el agotamiento de recursos, mata el proceso zombie y lo reinicia en estado `:safe_mode_koromon`).*
