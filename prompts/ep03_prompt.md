# PLANTILLA DE EPISODIO: 03 - The Blue Wolf! Garurumon

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Seadramon
- **Vector de Ataque (Analogía):** Man-in-the-Middle (MITM) / Sniffing en red no cifrada
- **Descripción del Escenario:** El equipo acampa cerca de un lago, que representa un medio de red compartido o un *Data Lake* interno que transmite datos en texto claro. Durante un período de baja vigilancia, una actividad ruidosa (Tai y Matt haciendo fuego) alerta a un proceso *sniffer* inactivo (Seadramon). El atacante emerge, intercepta las comunicaciones y aísla un nodo crítico (Matt), demostrando la vulnerabilidad de transmitir por un medio no seguro sin cifrado de extremo a extremo (E2EE).
## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Red local (LAN) o medio compartido no segmentado y sin cifrado de transporte (el "lago" pacífico).
- **Mecanismos de Detección:** Un nodo de monitoreo pasivo alerta de la pérdida de comunicación con un host específico (Matt siendo arrastrado al agua) y la presencia de tramas MAC suplantadas.
- **Fallo Preventivo:** Transmisión de paquetes críticos sin cifrado (texto plano). La falta de segmentación permitió que un sniffer promiscuo escuchara el tráfico tras una actividad inusual.
## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Gabumon evoluciona a Garurumon. Garurumon representa la instanciación de un protocolo criptográfico robusto (ej. IPsec VPN / TLS avanzado).
- **Acción Tomada:** Garurumon ejecuta su "Fox Fire" (Fuego de Zorro). En nuestra analogía, este ataque "congela" al sniffer aislando su capacidad de escucha e impone una capa de cifrado sobre el flujo de red. Al congelar a Seadramon (inhabilitar la interfaz promiscuo), se recupera el nodo interceptado y se estabiliza el canal.
## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Interfaz de red operando en modo promiscuo dentro del segmento local, realizando *ARP Spoofing* silencioso hasta que fue gatillado por un incremento de tráfico.
- **Recomendaciones (Post-mortem):** Cifrar absolutamente todo el tráfico (HTTPS/TLS) incluso dentro de la red local. Implementar *Dynamic ARP Inspection* (DAI) en los switches de capa de acceso.
## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep03_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep03_seadramon.rb`
*(El test simula un `DataLakeChannel` que transmite información en `plain_text`. `SeadramonSniffer` debe ser capaz de leer el contenido. Luego, `GarurumonDefense` aplicará un cifrado que transforme los paquetes. Cuando `SeadramonSniffer` intente leer de nuevo, no debe poder entender el payload, validando la mitigación del MITM).*
