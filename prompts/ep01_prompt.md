# PLANTILLA DE EPISODIO: 01 - Adrift? Island of Adventure!

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Kuwagamon
- **Vector de Ataque (Analogía):** Gusano de Red / Ataque DDoS de fuerza bruta
- **Descripción del Escenario:** El equipo del SOC (los Niños Elegidos) acaba de conectarse a la red central corporativa ("El Mundo Digital") e inmediatamente se enfrentan a un evento de tráfico anómalo masivo. Kuwagamon representa un ataque DDoS de fuerza bruta o un gusano de red extremadamente ruidoso y destructivo. No hay tácticas de sigilo; el atacante busca saturar los recursos y romper el perímetro a pura fuerza. Las herramientas defensivas iniciales (Digimon en etapa Entrenamiento) no tienen la capacidad de procesamiento para frenar la avalancha, obligando al equipo a instanciar soluciones más robustas (Evolución a etapa Infantil).
## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Puertos perimetrales expuestos a la internet pública sin filtrado. El "bosque" de la Isla File representa un entorno desprotegido donde cualquier paquete malicioso puede transitar libremente.
- **Mecanismos de Detección:** Monitoreo de tráfico y telemetría de red. Los sistemas reportan latencia extrema y un pico masivo de peticiones SYN/UDP (simbolizado por los temblores y árboles cayendo a medida que se acerca Kuwagamon).
- **Fallo Preventivo:** Inexistencia de un Web Application Firewall (WAF) o de políticas de "rate limiting" en el borde de la red. No había segmentación que separara la red de "Entrenamiento" de amenazas externas.
## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Auto-escalado de defensas perimetrales (Evolución de nivel Bebé/Entrenamiento a etapa Infantil: Agumon, Gabumon, Biyomon, etc.). Se levantan múltiples instancias de filtrado activo.
- **Acción Tomada:** Los sistemas infantiles ejecutan un filtrado de paquetes coordinado ("Baby Flame", "Petit Fire", etc.). El volumen del ataque es tan grande que la mitigación final consiste en un "Failover" destructivo: desconectar físicamente el segmento de red comprometido (el borde del acantilado colapsando), enviando la sesión del SOC a un entorno seguro y aislado (el río/agua) mientras el atacante pierde el objetivo.
## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Firmas de red altamente repetitivas, IPs de origen ruidosas o spoofeadas, y un payload con alta concurrencia pero de muy baja sofisticación lógica. Es un ataque irracional que solo busca denegación de servicio.
- **Recomendaciones (Post-mortem):** Implementación inmediata de un WAF (Web Application Firewall). Creación de reglas de Auto-Scaling (Evolución) proactivas, y alertas automáticas (SIEM) ante incrementos de latencia superiores al umbral base del sistema.
## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep01_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep01_kuwagamon.rb`
*(El test debe simular una ráfaga de peticiones simulando el ataque de Kuwagamon. Si no se invoca el método de escalado/mitigación `evolve_and_filter`, la red debe marcar un estado de 'Denial of Service' (OOM o Timeout). Si se invoca, debe marcar 'Mitigated' mediante el descarte de paquetes).*
