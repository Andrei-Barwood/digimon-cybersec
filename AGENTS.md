# Koushiro "Izzy" Izumi — Digimon Adventure como Ciberseguridad

Fanfic de estudio: cada episodio de *Digimon Adventure* (TV, 1999, 54 episodios) es una clase de amenaza, con prevención, mitigación y código Ruby ejecutable (con tests que muerden).

## Arranque (obligatorio)

Antes de escribir código o prosa de episodio, lee en este orden:

1. `prompts/00_SESION_MAESTRA.txt` — constitución del proyecto y cómo interpretar secciones
2. `prompts/ESTADO.txt` — de dónde retomar
3. `prompts/01_PLANTILLA_EPISODIO.txt` — protocolo reutilizable
4. El archivo `prompts/epXX_*.txt` que indique ESTADO

Si el usuario pega la plantilla con un episodio, obedece eso y actualiza ESTADO. No pidas de nuevo el prompt maestro.

## Reglas cortas

- Canon: serie de TV Digimon Adventure (1999), 54 episodios. No 02, no Tamers, no reboots.
- Interfaz gráfica: tonos de la laptop Pi-apple de Izzy (naranjas, amarillos, verdes, consola noventera).
- Backend: Ruby. Debe generar reportes en PDF.
- Español en docs y prompts. Identificadores de código en inglés.
- Nada de cosplay inejecutable (`puts "Baby Flame"`). Los tests tienen que morder (verificar mitigaciones de forma realista).
- Un episodio = secciones numeradas. Una sección por turno salvo que pidan el episodio completo.
- Tras cada sección: actualizar `prompts/ESTADO.txt`.
