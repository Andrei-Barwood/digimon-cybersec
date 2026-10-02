# PLANTILLA DE EPISODIO: 29 - Return to Hikarigaoka

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Mammothmon
- **Vector de Ataque (Analogía):** *Brute Force Scanning* / *DDoS* (Denegación de Servicio Distribuida) para forzar exposición.
- **Descripción del Escenario:** Los niños llegan a Hikarigaoka. Myotismon envía a Mammothmon, quien comienza a destruir indiscriminadamente la ciudad. En ciberseguridad, esto es equivalente a un ataque de Fuerza Bruta ruidoso y masivo o un escaneo agresivo (tipo DDoS) sobre una subred específica. El objetivo no es solo causar daño, sino forzar al "Octavo Nodo" oculto a que responda y revele su IP/ubicación por error al intentar defenderse.

## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Infraestructura de red pública (Hikarigaoka).
- **Mecanismos de Detección:** Los monitores de tráfico detectan un pico masivo de peticiones maliciosas (tráfico ruidoso) impactando los enrutadores locales y saturando los puertos.
- **Fallo Preventivo:** La red pública carecía de un *Web Application Firewall* (WAF) capaz de absorber y bloquear el escaneo masivo antes de que impactara la infraestructura física.

## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Garudamon (*Intrusion Prevention System* / WAF Dinámico).
- **Acción Tomada:** Biyomon evoluciona hasta Garudamon, actuando como un sistema de prevención dinámico que absorbe el tráfico malicioso y responde con reglas de bloqueo inmediato. Garudamon purga la amenaza (Mammothmon), deteniendo la saturación de la subred antes de que el nodo oculto se vea forzado a revelarse.

## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** 	Picos de tráfico volumétrico con firmas conocidas de *Brute Force*.
- **Recomendaciones (Post-mortem):** Configurar *Rate Limiting* estricto y desplegar WAFs en el borde de la red (*Edge*) para mitigar ataques volumétricos ruidosos sin saturar la red interna.

## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep29_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep29_mammothmon.rb`
*(El test simula una `HikarigaokaSubnet` recibiendo un `Mammothmon.brute_force_attack!`, elevando el `traffic_load` a niveles críticos. `GarudamonWAF.block_and_purge!` intercepta el ataque, elimina al bot y normaliza el tráfico, protegiendo al `hidden_node`).*
