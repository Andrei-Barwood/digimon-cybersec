# PLANTILLA DE EPISODIO: 21 - Home Away from Home

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Ogremon / Fallas de Enrutamiento (BGP Misrouting)
- **Vector de Ataque (Analogía):** *Split-Tunneling Risk* / Degradación a Subred Externa
- **Descripción del Escenario:** La onda expansiva del episodio anterior expulsó a Tai y Koromon hacia una red externa pública (El Mundo Real / Tokyo). Al perder la conexión con el clúster seguro (Mundo Digital), el proceso experimenta una degradación de estado (Agumon regresiona a Koromon). En esta subred externa desprotegida, comienzan a aparecer paquetes huérfanos y "fantasmas" (los hologramas de Digimon).

## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Conexiones en subredes públicas sin validación del servidor central.
- **Mecanismos de Detección:** El cliente (Tai) nota pérdida de comunicación con el *Active Directory* (los demás niños) y visualiza *Artifacts* gráficos en la interfaz debido a paquetes corruptos (hologramas).
- **Fallo Preventivo:** La infraestructura no disponía de redundancia de red o de un túnel *Always-On VPN* capaz de retener la sesión tras la caída del nodo central (la Pirámide).

## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Agumon (Reconexión de Túnel VPN de Emergencia).
- **Acción Tomada:** Al presentarse una amenaza en la red externa (Ogremon intentando interceptar la sesión), Koromon recupera suficientes recursos para escalar temporalmente a Agumon. Repele la amenaza, forzando un reinicio de la conexión que restaura el túnel hacia la red interna (la grieta dimensional en el cielo) y reincorporándose al clúster original.

## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Rastros temporales de tráfico (Ogremon) intentando interactuar con la sesión huérfana en la red pública.
- **Recomendaciones (Post-mortem):** Implementar túneles VPN resilientes (*Always-On*) y políticas estrictas que impidan que un nodo cliente continúe procesando datos sensibles si pierde contacto con su controlador de dominio.

## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep21_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep21_koromon.rb`
*(El test simula un `TaiClient` que está en `:external_subnet` tras un `BGP_Misrouting`. `OgremonThreat.intercept!` ataca. `AgumonVPN.reconnect_tunnel!` bloquea la amenaza y restaura el estado del cliente a `:internal_cluster`).*
