# PLANTILLA DE EPISODIO: 12 - Episodio 12

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Electmon (Guardián Legítimo / Falso Positivo)
- **Vector de Ataque (Analogía):** *Incident Response Misconfiguration* / Fuego Amigo por un IDS (Sistema de Detección de Intrusos)
- **Descripción del Escenario:** TK y Patamon llegan a la "Primary Village" (que representa el repositorio central o el entorno Core del sistema). Electmon, el guardián de la red, los identifica erróneamente como intrusos y los ataca. No hay malware involucrado; se trata de un Falso Positivo donde un IDS/Firewall está bloqueando tráfico interno legítimo debido a reglas de red desactualizadas (fuego amigo).
## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Políticas de firewall perimetral y Listas de Control de Acceso (ACLs) desactualizadas.
- **Mecanismos de Detección:** Un aluvión de alertas de seguridad del IDS, acompañadas de *Drop/Deny logs* sobre tráfico que operativamente es necesario para el negocio (TK y Patamon).
- **Fallo Preventivo:** Falta de automatización en la sincronización de las ACL. Cuando la red se segmentó en el Episodio 8, la IP de TK cambió, pero las reglas del IDS de Electmon nunca fueron actualizadas para reflejar esa nueva subred de confianza.
## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Resolución de Confianza / *Whitelisting* Manual (Representado por la diplomacia de TK y Patamon). No hay evolución ni destrucción.
- **Acción Tomada:** En lugar de lanzar un ataque para destruir el proceso, TK y Patamon inician un "Handshake" (apretón de manos de la paz, la competencia de fuerza). Esto renegocia la relación de confianza (Trust Resolution), demostrando que no son amenazas. La mitigación consiste en actualizar en caliente el IDS de Electmon, añadiendo la subred de TK a la lista blanca (*Whitelist*) y permitiendo la conexión.
## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Ninguno. Los logs revelan falsos positivos (False Positives) generados por reglas *Legacy* sobre tráfico interno.
- **Recomendaciones (Post-mortem):** Desplegar políticas *Infrastructure as Code* (IaC) para sincronizar listas blancas automáticamente en toda la red, y utilizar *Dry-Run Modes* antes de aplicar bloqueos estrictos.
## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep12_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep12_electmon.rb`
*(El test simula un `LegitimateNode` intentando conectar a `PrimaryVillage`. `ElectmonIDS`, con reglas legacy, retorna `:connection_dropped`. Tras ejecutar `TrustResolution.renegotiate!(node, ids)`, el IDS actualiza su lista y permite el tráfico, retornando `:accepted`).*
