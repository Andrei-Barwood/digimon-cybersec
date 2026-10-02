# PLANTILLA DE EPISODIO: 02 - Explosive Evolution! Greymon

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Shellmon
- **Vector de Ataque (Analogía):** Ransomware / Secuestro de Sesión Root
- **Descripción del Escenario:** Tras encontrar las cabinas telefónicas (una antigua infraestructura legacy/Terminal Services), el equipo es emboscado por Shellmon. El atacante logra comprometer la cuenta de administrador principal (simbolizado por Tai siendo capturado) impidiendo que el equipo de respuesta ejecute comandos básicos. Shellmon actúa como un ransomware que bloquea y restringe el acceso al sistema central; si la sesión root no es liberada rápidamente, el sistema entero colapsará bajo su presión.
## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** APIs y servicios obsoletos expuestos (las cabinas telefónicas en la playa) que sirvieron como honeypot o punto de inyección para el atacante.
- **Mecanismos de Detección:** El SIEM levanta alertas por bloqueos anómalos de la sesión de administrador (Account Lockout) y pérdida del control de E/S.
- **Fallo Preventivo:** Inexistencia de MFA (Multi-Factor Authentication) y el uso de terminales no confiables por parte del usuario root (Tai), permitiendo que la sesión sea secuestrada fácilmente.
## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Agumon evoluciona a Greymon. Actúa como una herramienta de escalamiento de privilegios de emergencia y una utilidad de desencriptación pesada.
- **Acción Tomada:** Los ataques estándar no afectan a la encriptación de Shellmon. Se requiere escalar el proceso a Greymon (Elevación de nivel Adulto) para ejecutar "Mega Flame", un barrido de fuerza bruta que corrompe el proceso malicioso en memoria, forzándolo a soltar el bloqueo de la sesión (liberando a Tai).
## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Un binario durmiente incrustado en el entorno legacy. Cuando el usuario root interactuó (las cabinas telefónicas), el malware secuestró su PID y modificó sus permisos (`chmod 000`) para que nadie más pudiera liberarlo.
- **Recomendaciones (Post-mortem):** Implementar modelo *Zero Trust*, requiriendo MFA para toda cuenta de alto privilegio. Desactivar y aislar la infraestructura legacy (las cabinas) del entorno de producción.
## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep02_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep02_shellmon.rb`
*(El test debe inicializar una `AdminSession`. Shellmon llamará a `hijack!(session)`. Los intentos de `unlock!` por herramientas de nivel bajo/infantil deben lanzar una excepción de permisos. Solo tras invocar el escalado de privilegios `Greymon#mega_flame(session)` se logrará matar el proceso y cambiar el estado de la sesión a `liberada`).*
