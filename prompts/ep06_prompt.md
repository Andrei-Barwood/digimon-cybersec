# PLANTILLA DE EPISODIO: 06 - Palmon, Raging Evolution!

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Monzaemon (Infectado por Engranaje Negro)
- **Vector de Ataque (Analogía):** Ingeniería Social / Ataques de Phishing y Rogue Access Points
- **Descripción del Escenario:** La Ciudad de los Juguetes representa una fachada amigable y de confianza, análoga a un portal web falso (*Phishing*) o un punto de acceso WiFi trampa. El enemigo manipula las emociones y la credulidad de los usuarios legítimos (los Niños Elegidos), logrando capturar sus identidades y controlando sus acciones. Monzaemon mismo es un "caballo de Troya" muy convincente (un disfraz de oso de peluche que esconde el malware del Engranaje Negro en su interior).
## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** El factor humano (Capa 8). Los usuarios ingresaron credenciales y tokens en una red y sistema falsificados debido a engaños.
- **Mecanismos de Detección:** Un sistema *User and Entity Behavior Analytics* (UEBA) nota que los usuarios legítimos (Mimi, Tai, etc.) están realizando acciones automatizadas inusuales (ser perseguidos o controlados por juguetes).
- **Fallo Preventivo:** Ausencia total de capacitación en *Security Awareness* y carencia de validadores de identidad sólidos. Se confió ciegamente en un recurso no verificado (los juguetes/Numemon/Monzaemon).
## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Palmon evoluciona a Togemon. Representa un escáner de red antimalware que lanza *fuzzing* masivo ("Chiku Chiku Bang Bang" / Golpes de Agujas).
- **Acción Tomada:** Togemon ejecuta ataques de punción que penetran la "fachada" o *decoy* de Monzaemon, golpeando directamente el *payload* (el Engranaje Negro) alojado en su interior. Una vez destruido el malware, el sistema de Phishing colapsa, y el sistema de recuperación devuelve las cuentas al estado "Safe".
## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Un *payload* oculto envuelto en un *dropper* o señuelo amigable (el disfraz de peluche).
- **Recomendaciones (Post-mortem):** Campañas de concienciación sobre Phishing para los usuarios. Implementar soluciones anti-phishing basadas en DNS y filtros de correo, y usar llaves de hardware FIDO2 para prevenir robos de sesión.
## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep06_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep06_monzaemon.rb`
*(El test simula un array de `UserIdentity` (los niños). `PhishingCampaign` ataca a los usuarios y cambia su estado a `:compromised`. `TogemonDefense.needle_spray!` audita las identidades, remueve el payload de phishing y cambia el estado de regreso a `:safe`, validando que se restauraron los accesos legítimos).*
