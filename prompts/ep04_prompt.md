# PLANTILLA DE EPISODIO: 04 - Red Hot! Birdramon

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Meramon (Controlador de Sistemas Infectado por Engranaje Negro)
- **Vector de Ataque (Analogía):** Malware Wiper / Ataque a Sistemas de Control Industrial (ICS)
- **Descripción del Escenario:** Meramon representa un proceso legítimo del sistema que controla recursos críticos (la temperatura del Monte Mihirashi). Es comprometido por un "Engranaje Negro" (un inyector de malware), convirtiéndolo en un *Wiper* o virus destructivo diseñado para sobrecargar la CPU y destruir el hardware (sobrecalentamiento). El ataque no busca exfiltrar datos, sino causar daño físico y denegación permanente de servicio.
## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Módulo de control interno sin aislamiento (sandboxing), expuesto a inyecciones de código.
- **Mecanismos de Detección:** Monitoreo de recursos (APM) reporta picos sostenidos del 100% de CPU y escalada crítica en la temperatura de los servidores (fuego expandiéndose).
- **Fallo Preventivo:** Falta de File Integrity Monitoring (FIM). El proceso legítimo fue modificado en memoria por el Engranaje Negro sin que el sistema operativo lo detectara y detuviera a tiempo.
## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Biyomon evoluciona a Birdramon. Actúa como una herramienta de mitigación térmica y un inyector de parches anti-malware.
- **Acción Tomada:** Birdramon ejecuta "Meteor Wing", lo que representa un parcheo en caliente (Hotpatching) combinado con una terminación forzada del hilo malicioso (destruyendo el Engranaje Negro). Esto purga el malware de la memoria sin matar el proceso principal (Meramon), permitiendo que la CPU regrese a niveles normales y estabilizando el sistema.
## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Un *DLL / inyector* (Engranaje Negro) residente en memoria que secuestra los ciclos de CPU y anula las rutinas de seguridad térmica del sistema huésped.
- **Recomendaciones (Post-mortem):** Implementar EDR (Endpoint Detection and Response) para detectar inyección de código. Aplicar cuotas estrictas (cgroups / resource limits) a los procesos de sistema para evitar que uno solo consuma el 100% de los recursos.
## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep04_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep04_meramon.rb`
*(El test simula un `SystemController` que administra la temperatura. `BlackGearInjector` inyectará un malware que altera el método `tick!` para sobrecargar el uso de CPU a 100 y llevar el estado a `:overheating`. `BirdramonDefense` debe invocar `meteor_wing!` para aplicar un hotpatch que remueva el hilo inyectado, devolviendo la CPU a 10 y el estado a `:normal`, validando la purga del Wiper sin matar el `SystemController`).*
