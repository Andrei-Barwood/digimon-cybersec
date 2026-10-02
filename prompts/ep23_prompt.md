# PLANTILLA DE EPISODIO: 23 - WereGarurumon's Diner

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Digitamamon & DemiDevimon
- **Vector de Ataque (Analogía):** *Crypto-Jacking* / *Denial of Wallet* (Agotamiento de Recursos)
- **Descripción del Escenario:** Matt y Joe están atrapados trabajando en el restaurante de Digitamamon para pagar una deuda. DemiDevimon sabotea su trabajo para alargar la deuda indefinidamente. En ciberseguridad, esto equivale a un ataque de **Crypto-Jacking** o botnet de minería. Los nodos (Matt y Joe) son secuestrados para procesar ciclos de CPU infinitos a favor del atacante (Digitamamon). DemiDevimon inyecta cargas falsas para asegurar que el consumo de recursos se mantenga al 100%, perpetuando la esclavitud del sistema.

## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Contratos de servicio o procesos no validados (La comida que Joe no pudo pagar).
- **Mecanismos de Detección:** Uso sostenido e inexplicable del 100% de CPU y RAM (*High Load Average*), con picos generados artificialmente por subprocesos ocultos.
- **Fallo Preventivo:** Ausencia de *Timeouts* y cuotas de recursos (*Resource Quotas*). Se permitió que un proceso externo (el Diner) acaparara todos los ciclos de procesamiento del nodo sin un límite temporal o de consumo.

## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** WereGarurumon (Escalada a Nivel Supervisor / `SIGKILL`).
- **Acción Tomada:** Gabumon evoluciona a WereGarurumon, obteniendo privilegios de Supervisor (*root*). Desde esta posición de alto nivel, identifica la alianza fraudulenta entre Digitamamon y DemiDevimon, terminando forzosamente el proceso parasitario (`kill -9`) y liberando los recursos de Matt y Joe.

## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Scripts de minería ocultos que generaban fallos falsos para evadir la finalización de los hilos.
- **Recomendaciones (Post-mortem):** Implementar límites de consumo (Cgroups en Linux) y monitorizar el comportamiento de los procesos para detectar y aniquilar mineros no autorizados.

## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep23_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep23_digitamamon.rb`
*(El test simula un `JoeNode` infectado por `DigitamamonMiner`. La CPU está atrapada al `100%`. `DemiDevimon.sabotage!` asegura que la deuda/ciclos no bajen. `WereGarurumon.terminate_process!` purga el malware y devuelve la CPU a un estado de reposo).*
