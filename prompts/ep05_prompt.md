# PLANTILLA DE EPISODIO: 05 - Lightning! Kabuterimon

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Andromon (Cyborg / Controlador SCADA)
- **Vector de Ataque (Analogía):** Ataque a Sistemas ICS/SCADA y secuestro de Operational Technology (OT)
- **Descripción del Escenario:** El equipo llega a una fábrica automatizada (infraestructura crítica). Su supervisor principal (Andromon, un sistema SCADA) tiene incrustado un Engranaje Negro en su hardware. Esto provoca un secuestro del entorno físico (OT), haciendo que la maquinaria de la fábrica ataque a los usuarios humanos y paralice la cadena de producción legítima. Es un ataque clásico al estilo *Stuxnet*, donde el malware salta del entorno digital para causar daños en el plano físico/mecánico.
## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Dispositivos IoT / Controladores lógicos programables (PLC) de la fábrica con *air-gap* deficiente y puertos físicos de depuración expuestos.
- **Mecanismos de Detección:** Izzy descifra el código fuente de la fábrica en su laptop (revisión de logs estáticos) y detecta una rutina de código alienígena insertada (el Engranaje).
- **Fallo Preventivo:** Ausencia de *Secure Boot* o verificación de firmas criptográficas a nivel hardware. Un implante físico (Engranaje) pudo acoplarse y sobreescribir la memoria de ejecución sin generar alertas previas en el sistema.
## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Tentomon evoluciona a Kabuterimon. Representa una herramienta de Hard Reset o un EMP (Pulso Electromagnético) focalizado para depurar hardware.
- **Acción Tomada:** Izzy identifica el módulo exacto infectado en la pierna de Andromon (el código alienígena). Kabuterimon ejecuta "Electro Shocker", aplicando una sobrecarga eléctrica/reseteo forzado específicamente sobre ese bus de hardware. Esto expulsa el componente malicioso físico y fuerza al controlador Andromon a reiniciar en modo seguro con su *firmware* original (aliado).
## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Un microcontrolador / implante malicioso (*Black Gear*) que interceptaba las señales de los actuadores y reescribía las directivas de control de fábrica en tiempo real.
- **Recomendaciones (Post-mortem):** Implementar *Trusted Platform Module* (TPM) y *Secure Boot*. Reforzar el control de acceso físico a las instalaciones de la fábrica (seguridad física para evitar implantes hardware).
## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep05_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep05_andromon.rb`
*(El test simula un `ScadaFactory` manejado por `AndromonController`. Inicialmente el estado es `:friendly`. Un `HardwareImplante` altera el controlador a `:hostile`, lo que causa que la fábrica ataque a los usuarios en el método `run_production!`. Kabuterimon aplica `electro_shocker!(controller)` lo cual causa un `hardware_reset!`, purgando el implante y devolviendo a Andromon a `:friendly` y la fábrica a operación normal).*
