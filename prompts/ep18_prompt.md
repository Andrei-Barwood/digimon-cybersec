# PLANTILLA DE EPISODIO: 18 - Episodio 18

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Etemon (Vía Tyrannomon) / Fuga Interna
- **Vector de Ataque (Analogía):** Brecha de *Air-Gap* / Fuga de Señal y Telemetría (*Data Exfiltration* Involuntaria)
- **Descripción del Escenario:** Piximon oculta al equipo dentro de una barrera invisible, equivalente a un entorno de red completamente aislado (un *Air-Gapped Sandbox*). Sin embargo, Izzy y Matt cruzan el perímetro de seguridad. Izzy utiliza su laptop y emite una señal que es interceptada por la Dark Network de Etemon. Esto rompe el aislamiento de la red, exponiendo la IP (ubicación) del Sandbox y permitiendo que un ataque externo (Tyrannomon) penetre las defensas.
## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Dispositivos internos emitiendo tráfico de salida no autorizado desde el perímetro físico del *Sandbox*.
- **Mecanismos de Detección:** El IDS de red externo (Etemon) captura un paquete ICMP (Ping) o transmisión de telemetría proveniente del entorno oculto.
- **Fallo Preventivo:** Políticas de Egresos (*Egress Filtering*) inexistentes y fallas en la seguridad física. Los usuarios pudieron extraer hardware con capacidad de red (laptop) fuera del escudo aislante, comprometiendo la topología.
## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Greymon (Despliegue de un binario sanitizado post-entrenamiento).
- **Acción Tomada:** Tai y Agumon finalizan con éxito su "Entrenamiento", lo que significa que el Sandbox cumplió su propósito de compilar y sanitizar el proceso corrompido en el Ep 16. Agumon evoluciona limpiamente a Greymon y purga la amenaza (Tyrannomon) que se había infiltrado en la red. Con el ataque neutralizado, Piximon restaura el aislamiento (*Air-Gap*) de la barrera invisible.
## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Logs de tráfico de red muestran un intento de *Beaconing* (transmisión periódica) desde el interior que cruzó las fronteras del Sandbox.
- **Recomendaciones (Post-mortem):** Implementar estrictos controles físicos (jaulas de Faraday), confiscar dispositivos personales al ingresar al *Sandbox*, y establecer reglas de cortafuegos de *Egress Traffic* (Deny-All) para garantizar el *Air-Gap*.
## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep18_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep18_piximon.rb`
*(El test define un `PiximonSandbox` con un firewall que aisla la red (`:air_gapped`). Un `RecklessUser` (Izzy/Matt) intenta `transmit_beacon!`, pero falla al chocar con el firewall. Sin embargo, si el usuario evade la barrera y luego transmite, el estado pasa a `:exposed` y `TyrannomonMalware.infiltrate!` corrompe la red. La mitigación `TrainingRoutine.deploy_greymon!` purga la amenaza y devuelve el sistema a `:air_gapped`).*
