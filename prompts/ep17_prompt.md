# PLANTILLA DE EPISODIO: 17 - Episodio 17

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Cockatrimon
- **Vector de Ataque (Analogía):** *Lock-Screen Ransomware* / Congelamiento de Procesos (`SIGSTOP`)
- **Descripción del Escenario:** Los niños abordan un crucero gigante en medio del desierto, que resulta ser una trampa (un servidor *Honeypot* malicioso). Cockatrimon utiliza su habilidad para "petrificar" a sus víctimas. En ciberseguridad, esto simula un ataque de Ransomware tipo *Locker* o un script malicioso que envía una señal de bloqueo (`SIGSTOP`) a los hilos de ejecución, inmovilizando (petrificando) por completo los procesos legítimos del sistema sin destruirlos, pero haciéndolos inaccesibles.
## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Ingeniería Social / Interacción de usuarios con un servidor no verificado (el crucero).
- **Mecanismos de Detección:** Los monitores de rendimiento muestran múltiples procesos vitales cayendo en estado `STOPPED` (T) o *Deadlock*. Interfaz gráfica inaccesible (*Lock-screen*).
- **Fallo Preventivo:** Los usuarios iniciaron sesión y ejecutaron rutinas dentro del servidor anfitrión sin pasarlo previamente por un entorno de pruebas aislado (*Sandbox*).
## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Togemon (Proceso *Watchdog* Fuera-de-Banda / OOB).
- **Acción Tomada:** Al estar los procesos principales inmovilizados, la respuesta debe provenir de un hilo independiente que esquivó el ataque. Togemon actúa como un *Watchdog Daemon* (demonio perro-guardián) que se ejecuta con altos privilegios. Togemon destruye el binario de Cockatrimon y revierte el estado de las víctimas, enviando una señal `SIGCONT` (Continue) que reactiva ("despetrifica") todos los procesos inmovilizados, restaurando el sistema a la normalidad.
## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Scripts de evasión que envían llamadas al sistema para suspender el *Window Manager* y aplicaciones en *foreground*.
- **Recomendaciones (Post-mortem):** Implementar demonios *Watchdog* en modo Kernel que puedan enviar `SIGCONT` o matar automáticamente cualquier proceso no autorizado que intente emitir `SIGSTOP` a nivel global. Aislar siempre las conexiones a servidores desconocidos.
## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep17_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep17_cockatrimon.rb`
*(El test simula un `CoreSystem` con procesos. `CockatrimonMalware.petrify!(system)` cambia el estado de todos los procesos a `:frozen` (Simulando un `SIGSTOP`). El sistema queda inoperable. Luego, un demonio externo `TogemonWatchdog.needle_spray!(malware, system)` destruye el malware y emite un `SIGCONT` (virtual) pasando los procesos de vuelta a `:active`).*
