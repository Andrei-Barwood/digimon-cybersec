# PLANTILLA DE EPISODIO: 11 - Episodio 11

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Bakemon (Botnet Polimórfica)
- **Vector de Ataque (Analogía):** Spoofing de Identidad / Falsificación de Certificados (Ataque Man-in-the-Browser)
- **Descripción del Escenario:** Los Bakemon se disfrazan de humanos en una iglesia para engañar a Joe y Sora, atrayéndolos para ser sacrificados (fusionándose luego en "Lord Bakemon"). En ciberseguridad, esto es un ataque de *Spoofing* masivo: múltiples bots (fantasmas) falsifican certificados digitales o cabeceras (disfraces) para hacerse pasar por nodos de confianza. Al capturar la sesión de los usuarios legítimos, agrupan recursos en un super-nodo malicioso (Lord Bakemon).
## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Entradas de validación de identidad (handshake TLS sin autenticación estricta).
- **Mecanismos de Detección:** Anomalías en el comportamiento del emisor (Sora nota que la gente no actúa normal). Los logs muestran cabeceras HSTS ausentes o certificados autofirmados.
- **Fallo Preventivo:** Falta de *Certificate Pinning* y validación de autenticidad mutua (Mutual TLS). El sistema confió ciegamente en la fachada sin verificar la firma criptográfica raíz.
## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Joe (Sutra de desofuscación) + Birdramon/Ikkakumon.
- **Acción Tomada:** Joe repite el Sutra budista ("Kyo kyo kyo"), que en nuestro modelo actúa como un script de de-ofuscación criptográfica. Esto desestabiliza a Lord Bakemon, exponiendo su verdadera naturaleza (rompe el disfraz). Al quedar expuesta la vulnerabilidad subyacente de la botnet, Birdramon ejecuta "Meteor Wing", purgando el clúster expuesto y liberando a los usuarios cautivos.
## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Certificados digitales falsificados (Spoofed Certificates) y código altamente ofuscado que se desenvuelve dinámicamente en memoria (Botnet Polimórfica).
- **Recomendaciones (Post-mortem):** Implementar HSTS estricto (HTTP Strict Transport Security), *Certificate Transparency Logs*, y rutinas de escaneo de memoria en tiempo de ejecución para de-ofuscar payloads maliciosos.
## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep11_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep11_bakemon.rb`
*(El test simula un `AuthRequest` que inicialmente es válido. `BakemonSpoofing.spoof!(request)` lo disfraza, haciendo que `AuthService.process(request)` caiga en la trampa (sesión secuestrada). `JoeSutra.deobfuscate!(request)` marca `is_obfuscated = false`, y `BirdramonDefense.meteor_wing!(request)` bloquea definitivamente el request expuesto, salvando el sistema).*
