# PLANTILLA DE EPISODIO: 30 - Digimon, Digimon Everywhere

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Gesomon
- **Vector de Ataque (Analogía):** Sabotaje a Infraestructura Crítica (ICS/SCADA) / Bloqueo de Enrutamiento Físico
- **Descripción del Escenario:** Gesomon ataca la bahía de Tokio y los puentes, paralizando el transporte de los niños hacia Odaiba. En ciberseguridad, esto es un ataque directo contra Sistemas de Control Industrial (ICS) o Tecnología Operativa (OT). El malware interrumpe los semáforos, controles de puentes y rutas lógicas, causando un *Denial of Service* (DoS) físico que impide a los paquetes (los niños) alcanzar su nodo de destino.

## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Dispositivos IoT y sistemas SCADA conectados a redes públicas sin segmentar.
- **Mecanismos de Detección:** Los sistemas de telemetría reportan fallos masivos en los actuadores mecánicos (puentes y metros bloqueados) y sensores de la bahía.
- **Fallo Preventivo:** Convergencia IT/OT sin seguridad adecuada. Los sistemas que controlan infraestructura física estaban expuestos a la misma red donde operaban los atacantes, careciendo de *Air-Gaps* o *Firewalls* industriales dedicados.

## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Ikkakumon (Despliegue de Parches de Firmware en caliente / *Harpoon Torpedo*).
- **Acción Tomada:** Gomamon evoluciona a Ikkakumon, quien está diseñado para operar en este entorno (redes marítimas/SCADA). Ikkakumon intercepta a Gesomon y despliega una ráfaga de actualizaciones críticas ("Harpoon Torpedo") que destruyen el proceso de sabotaje. Las rutas de transporte se reinician y los niños pueden cruzar a Odaiba de forma segura.

## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** 	Comandos maliciosos en los PLCs (*Programmable Logic Controllers*) del puente.
- **Recomendaciones (Post-mortem):** Implementar el modelo de Purdue para aislar completamente las redes operativas (OT) de las redes corporativas (IT) y el internet público.

## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep30_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep30_gesomon.rb`
*(El test define un `TransportSCADA` con `bridge_status = :operational`. `GesomonMalware.sabotage!` lo pasa a `:blocked`. `IkkakumonFirmware.deploy_torpedo!` erradica el malware y devuelve el estado a `:operational`, permitiendo el `data_transit`).*
