# Koushiro "Izzy" Izumi — Digimon Adventure como Ciberseguridad

¡Prodigioso! Bienvenido al Mundo Digital. Este proyecto es un estudio de ciberseguridad en formato fanfic interactivo. Hemos mapeado cada uno de los **54 episodios de Digimon Adventure (1999)** a un incidente o concepto de ciberseguridad moderno.

Aquí no solo encontrarás teoría, sino código Ruby ejecutable con tests que "muerden". Si la vulnerabilidad existe, el test falla. Si el Digimon aliado aplica la mitigación correcta, el test pasa.

---

## 📚 Tabla de Contenidos

1. [Requisitos Previos](#requisitos-previos)
2. [Estructura del Proyecto](#estructura-del-proyecto)
3. [Tutorial: ¿Cómo usar este repositorio?](#tutorial-cómo-usar-este-repositorio)
4. [Ejecución de Tests](#ejecución-de-tests)
5. [Mapeo de Conceptos (Ejemplos)](#mapeo-de-conceptos-ejemplos)

---

## 🛠 Requisitos Previos

Para ejecutar los escenarios y verificar las mitigaciones, tu computadora debe tener instalado:

- **Ruby** (Versión 2.7 o superior recomendada).
- La gema estándar **Minitest** (incluida por defecto en la mayoría de las instalaciones de Ruby).

Puedes verificar tu versión de Ruby abriendo tu terminal y ejecutando:
```bash
ruby -v
```

---

## 📁 Estructura del Proyecto

El proyecto está organizado cuidadosamente para separar la narrativa, la lógica de negocio y las pruebas de validación:

```text
/
├── prompts/
│   ├── ESTADO.txt           # Rastrea el progreso y estado actual de la saga.
│   ├── 00_SESION_MAESTRA.txt # Reglas de comportamiento del agente IA.
│   ├── 01_PLANTILLA_EPISODIO.txt # Estructura base para crear episodios.
│   └── ep1_prompt.md a ep54_prompt.md # Archivos Markdown con la historia y el análisis de cada episodio.
├── lib/
│   └── digi_sec/            # Código Ruby de producción (Malware, Defensas, Subredes).
│       └── ep1_kuwagamon.rb a ep54_apocalymon.rb
└── test/
    └── episodios/           # Pruebas Minitest para validar los escenarios.
        └── ep1_test.rb a ep54_test.rb
```

---

## 📖 Tutorial: ¿Cómo usar este repositorio?

Imagina que eres Izzy sentado frente a su laptop Pi-apple. Tu objetivo es estudiar cómo las amenazas de la red (Digimon enemigos) comprometen los sistemas y cómo los administradores (Los Niños Elegidos) aplican parches y aislamientos (Digimon aliados).

### Paso 1: Leer el Caso de Estudio (El Prompt)
Dirígete a la carpeta `/prompts/` y abre cualquier archivo Markdown (por ejemplo, `ep14_prompt.md`). Allí encontrarás 5 secciones:
1. **Contexto del Incidente:** Breve resumen de la analogía entre el canon y la ciberseguridad.
2. **Detección Temprana:** Explicación del fallo preventivo.
3. **Mitigación:** La acción de respuesta a incidentes tomada por el Digimon aliado.
4. **Análisis Forense:** Recomendaciones *Post-mortem*.
5. **Rutas:** Ubicación de los archivos ejecutables.

### Paso 2: Revisar la Lógica del Ataque
Abre el archivo Ruby correspondiente en `/lib/digi_sec/`. Verás clases que simulan el ecosistema de red. 
Por ejemplo, verás cómo `DevimonAPT` ejecuta un ataque, y cómo `AngemonDisasterRecovery` lo mitiga aislando la amenaza o reiniciando el sistema.

### Paso 3: Ejecutar la Simulación
¡Aquí es donde ocurre la magia! Ve a tu terminal y ejecuta las pruebas del episodio que estás estudiando. Si el ataque no tiene defensas, el sistema fallará. Si el parche se aplica correctamente, el test pasará en verde.

---

## 🚀 Ejecución de Tests

Puedes ejecutar los tests de un episodio individual usando el comando `ruby`:

```bash
# Ejecutar un solo episodio (Ejemplo: Episodio 1)
ruby test/episodios/ep1_test.rb
```

Si deseas correr todos los incidentes masivamente (Auditoría completa del Mundo Digital):

```bash
# En sistemas basados en Unix (Linux / macOS) con Zsh o Bash:
for f in test/episodios/ep*_test.rb; do ruby $f; done
```

**Salida Esperada:**
Si las defensas (Digimon aliados) funcionaron correctamente, verás mensajes como:
```text
Run options: --seed 12345
# Running:
.
Finished in 0.0001s, 10000 runs/s, 20000 assertions/s.
1 runs, 2 assertions, 0 failures, 0 errors, 0 skips
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
