# Koushiro "Izzy" Izumi — Digimon Adventure como Ciberseguridad

¡Prodigioso! Bienvenido al Mundo Digital. Este proyecto es un estudio de ciberseguridad en formato fanfic interactivo. Hemos mapeado cada uno de los **54 episodios de Digimon Adventure (1999)** a un incidente o concepto de ciberseguridad moderno.

Aquí no solo encontrarás teoría, sino código Ruby ejecutable con tests que "muerden". Si la vulnerabilidad existe, el test falla. Si el Digimon aliado aplica la mitigación correcta, el test pasa.

---

## 📚 Tabla de Contenidos

1. [Requisitos Previos](#requisitos-previos)
2. [Estructura del Proyecto](#estructura-del-proyecto)
3. [Interfaz Pi-Apple (Web GUI)](#interfaz-pi-apple-web-gui)
4. [Ejecución por Consola (CLI)](#ejecución-por-consola-cli)
5. [Mapeo de Conceptos (Ejemplos)](#mapeo-de-conceptos-ejemplos)

---

## 🛠 Requisitos Previos

Para ejecutar los escenarios y verificar las mitigaciones, tu computadora debe tener instalado:

- **Ruby** (Versión 2.7 o superior recomendada).
- **Bundler** (para instalar las dependencias).

Para instalar las dependencias necesarias del servidor web y PDF:
```bash
bundle install
```

---

## 📁 Estructura del Proyecto

El proyecto está organizado cuidadosamente para separar la narrativa, la lógica de negocio y las interfaces:

```text
/
├── bin/
│   └── pi_apple               # Script ejecutable para lanzar la interfaz Web GUI.
├── prompts/
│   └── ep01_prompt.md a ep54_prompt.md # Reportes Markdown de cada episodio.
├── lib/
│   ├── digi_sec/              # Código Ruby de producción (Malware, Defensas, Subredes).
│   └── pi_apple_web/          # Aplicación Sinatra (Backend) y Frontend (HTML/CSS) de la GUI.
└── test/
    └── episodios/             # Pruebas Minitest para validar los escenarios.
        └── ep01_test.rb a ep54_test.rb
```

---

## 💻 Interfaz Pi-Apple (Web GUI)

Hemos construido una Interfaz Gráfica (Dashboard) que simula el diseño retro y *hacker* de la laptop Pi-apple de Izzy. 

### Iniciar el servidor
Para arrancar la interfaz web, simplemente ejecuta desde la terminal:

```bash
ruby bin/pi_apple
```

El servidor local se levantará en el **puerto 9200**.
Abre tu navegador web favorito y dirígete a:
👉 **http://localhost:9200**

### Funciones de la Interfaz:
1. **Navegación Visual:** Selecciona cualquiera de los 54 episodios en la barra lateral.
2. **Reportes de Vulnerabilidad:** Lee el análisis detallado del incidente traducido de Markdown a HTML.
3. **Simulador Minitest (Terminal Integrada):** Presiona **"EJECUTAR TEST"** para correr la simulación de seguridad del episodio seleccionado en tiempo real. La terminal es verbosa, mostrándote el progreso exacto.
4. **Exportar a PDF:** Una vez cargado un episodio, puedes hacer clic en **"EXPORTAR PDF"** para que el backend compile y descargue el reporte de ciberseguridad formateado.

---

## 🚀 Ejecución por Consola (CLI)

Si prefieres auditar el sistema directamente desde la consola del sistema operativo (sin la interfaz web):

```bash
# Ejecutar un solo episodio con salida verbosa
ruby test/episodios/ep01_test.rb -v
```

Si deseas correr todos los incidentes masivamente (Auditoría completa del Mundo Digital):

```bash
# En sistemas basados en Unix (Linux / macOS) con Zsh o Bash:
for f in test/episodios/ep*_test.rb; do ruby $f; done
```

---

## 🔍 Mapeo de Conceptos (Ejemplos)

Para que te hagas una idea de cómo traducimos las aventuras en topologías de red:

- **Episodio 1 (Kuwagamon):** *Distributed Denial of Service (DDoS) / Escalamiento Básico.* Siete nodos sin parchear son atacados.
- **Episodio 13 (Devimon):** *APT Zero-Day / Disaster Recovery (Hard Reset).* Devimon fragmenta el disco (La Isla File). Angemon ejecuta un Hard Reset para reiniciar el MBR.
- **Episodio 26 (Myotismon en el Mundo Digital):** *Zero-Day Inmitigable / Fail-Safe Escape.* Ante una amenaza para la que no hay firmas (Myotismon), Garudamon actúa como cortina de humo para evacuar los nodos.
- **Episodio 36 (Phantomon):** *Ransomware / Aislamiento Físico.* Odaiba se desconecta del mundo exterior bajo un secuestro de red.
- **Episodio 51 (Piedmon):** *Ransomware Encriptador.* Convierte archivos/nodos en un formato propietario bloqueado (Llaveros).
- **Episodio 54 (Apocalymon):** *System Wipe / Disaster Recovery Total.* Borrado a nivel de silicio que requiere restaurar desde un hardware enclave inmutable.

¡Gracias por visitar este proyecto! Recuerda mantener siempre tus firmas de antivirus actualizadas y tus crestas sincronizadas.
