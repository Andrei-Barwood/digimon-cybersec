# PLANTILLA DE EPISODIO: 27 - The Gateway to Home

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Castillo de Myotismon / Puerta Dimensional
- **Vector de Ataque (Analogía):** *Gateway Infiltration* / *Cryptographic Bypass*
- **Descripción del Escenario:** Myotismon ha abierto un *Gateway* desde el Mundo Digital hacia el Mundo Real (saltando la segmentación de red hacia Internet). Tras su partida, la pasarela queda protegida por un sistema de autenticación basado en un algoritmo criptográfico (el sistema de las cartas). El equipo debe descifrar este algoritmo (*Cryptographic Puzzle*) antes de que el *timeout* expire para poder seguirlo y detener su ataque.

## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Puerta de enlace perimetral (Gateway) controlada por la clave de cartas.
- **Mecanismos de Detección:** El sistema bloquea los intentos de acceso que no presentan el *token* criptográfico correcto (Gatomon fallando, Tai equivocándose al principio).
- **Fallo Preventivo:** El atacante (Myotismon) dejó la interfaz de autenticación expuesta y operativa en lugar de deshabilitar el servicio *Gateway* tras cruzar, permitiendo un ataque de fuerza bruta analítica.

## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Izzy (Análisis Criptográfico) y Tai (Input de Credenciales).
- **Acción Tomada:** Usando ingeniería inversa y análisis deductivo, Izzy descifra el patrón criptográfico (alineando los atributos de Vacuna, Datos y Virus con los Digimon adecuados). Tai inyecta la solución en la interfaz, eludiendo la restricción y abriendo el puerto (la Puerta Dimensional), lo que permite al equipo transitar por el túnel.

## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** La "Puerta Dimensional", un túnel de red que unifica dos entornos sin políticas de firewall.
- **Recomendaciones (Post-mortem):** Implementar validación temporal estricta y bloquear interfaces de administración tras su uso (Cerrar los puertos y destruir los tokens de sesión tras un inicio de sesión único).

## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep27_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep27_gateway.rb`
*(El test simula un `DimensionalGateway` con un `unlock!(cards)`. Un *array* incorrecto levanta un `:access_denied`. `IzzyAnalyzer.solve_puzzle` devuelve el *array* de cartas correcto. Al pasarlo, el Gateway retorna `:access_granted` y abre el túnel).*
