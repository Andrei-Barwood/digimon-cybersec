# PLANTILLA DE EPISODIO: 15 - The Dark Network of Etemon

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Etemon (y los Pagumon)
- **Vector de Ataque (Analogía):** Rogue Access Point / *Signal Jamming* (Denegación de Servicio en Capa Física/Inalámbrica)
- **Descripción del Escenario:** Al llegar al Continente Server, los niños caen en una trampa orquestada por los Pagumon, conectándose a una "aldea" insegura. Etemon despliega su "Dark Network" (Red Oscura) y canta su "Love Serenade". Esto actúa como un *Signal Jammer* o un Punto de Acceso Falso (Rogue AP) que satura el espectro, drenando el ancho de banda y bloqueando las señales de los Digivice. Al estar *Jammed*, los servicios de defensa (Digimon) no pueden escalar privilegios (evolucionar).
## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Redes inalámbricas de área local (WLAN). Conexión automática a redes no confiables (Aldea Koromon suplantada por Pagumon).
- **Mecanismos de Detección:** Aumento drástico en la latencia, *Packet Loss* altísimo, y dispositivos fallando al intentar validar *handshakes* para subir de privilegios.
- **Fallo Preventivo:** Falta de Autenticación Mutua (ej. 802.1X, WPA3-Enterprise) y validación de BSSID. Los usuarios (los niños) se conectaron ciegamente a la red local asumiendo que era segura.
## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Enrutamiento *Fallback* (Evasión a zona segura / *Faraday Cage* subterránea).
- **Acción Tomada:** Como la red actual no permite escalar defensas, el sistema defensivo opta por la Evasión (Flee). Se desconectan del Rogue AP hostil (Air-gap) y enrutan la conexión a través de un túnel subterráneo blindado, aislando los sistemas de la interferencia inalámbrica de Etemon. Dentro del búnker descubren la "Etiqueta" (Tag), equivalente a un *Hardware Security Module (HSM)* necesario para futuras escaladas.
## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Torres emisoras ("Dark Network") transmitiendo tramas de desautenticación (*Deauth frames*) e inundación de ruido RF (Jamming).
- **Recomendaciones (Post-mortem):** Configurar detección de *Rogue APs* (WIDS), forzar conexiones a través de VPNs seguras sin importar la red local, y asegurar canales OOB (Out-Of-Band) de emergencia cableados.
## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep15_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep15_etemon.rb`
*(El test simula un `DefenseService` conectado a la `DarkNetwork`. Etemon lanza `jamming_signal!`, y el servicio falla al intentar escalar (`upgrade_privileges!` retorna `:jammed`). La mitigación es aislar la red: `FallbackRoute.evade!(service)`, moviéndolo a una red cableada segura. Luego, el servicio puede operar y recolectar el `SecurityTag` (HSM)).*
