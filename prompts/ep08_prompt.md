# PLANTILLA DE EPISODIO: 08 - The Messenger of Darkness, Devimon!

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Devimon (Actor APT y Botnet Master)
- **Vector de Ataque (Analogía):** Advanced Persistent Threat (APT) / Segmentación Maliciosa de Red (BGP Hijacking / VLAN Hopping)
- **Descripción del Escenario:** Se revela la presencia de Devimon, una Amenaza Persistente Avanzada (APT) que ha estado operando en las sombras (usando una Botnet C2 mediante Engranajes Negros). Al ser descubierto, el APT lanza un ataque devastador sobre la topología de la red: altera las tablas de enrutamiento y divide físicamente la "Isla File", fragmentando el clúster defensivo (el SOC de los Niños Elegidos) para aislar los nodos y eliminarlos uno por uno.
## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Topología lógica de la red de la Isla File. Vulnerabilidad en los protocolos de descubrimiento (ej. STP/BGP).
- **Mecanismos de Detección:** Detección tardía de tráfico de control y comando (*Beaconing*) desde múltiples nodos infectados simultáneamente (el ejército de Devimon).
- **Fallo Preventivo:** Ausencia de validación criptográfica para actualizaciones de enrutamiento y falta de un esquema de *Network Access Control* (NAC) sólido, lo que permitió que la infraestructura fundamental de la isla fuera reorganizada arbitrariamente.
## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Arquitectura Resiliente / Autonomía Descentralizada de Nodos. (En este episodio no hay un Digimon individual que lo derrote; la defensa es la *supervivencia* del sistema).
- **Acción Tomada:** Al ocurrir la partición de la red (`NetworkPartition`), el sistema defensivo (los Niños Elegidos) entra en modo *Fail-safe*: los nodos caen en segmentos aislados pero logran mantenerse "vivos" (`:alive`). La mitigación inmediata es evitar el Punto Único de Fallo (Single Point of Failure). El cluster se desincroniza, pero ninguna unidad es eliminada, frustrando el objetivo primario de Devimon.
## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Scripts de inyección de rutas (ej. BGP Hijacking) orquestados desde un C2 remoto (Infinity Mountain).
- **Recomendaciones (Post-mortem):** Cifrar y autenticar mensajes intra-segmento y aplicar *Spanning Tree Protocol* (STP) endurecido con *BPDU Guard* para prevenir alteraciones topológicas de red. Asegurar la redundancia y supervivencia descentralizada en caso de partición.
## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep08_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep08_devimon.rb`
*(El test simula un `SocCluster` que inicialmente tiene a todos los `DefenseNodes` en la misma red `master_subnet`. `DevimonAPT.partition_network!` corrompe las tablas de enrutamiento y divide el cluster creando múltiples subredes. El test debe asertar que el `SocCluster` ya no tiene los nodos centralizados, pero gracias a la redundancia descentralizada, el estado de cada nodo sigue siendo `:alive` y no `:destroyed`, sobreviviendo a la emboscada APT).*
