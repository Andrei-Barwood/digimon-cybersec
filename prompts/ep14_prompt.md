# PLANTILLA DE EPISODIO: 14 - Departure for a New Continent

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Whamon (Controlado por Engranaje Negro)
- **Vector de Ataque (Analogía):** Secuestro de Enrutador / Gateway Hijacking (Ataque a la Capa de Transporte)
- **Descripción del Escenario:** Los niños necesitan migrar los datos desde la Isla File al Continente Server, utilizando a Whamon como un túnel de transporte (VPN/Gateway). Sin embargo, Whamon ha sido comprometido internamente por un Engranaje Negro (en su estómago). En ciberseguridad, esto representa un Router infectado que actúa como un agujero negro (*Blackhole Routing*), secuestrando o reteniendo todo el tráfico de red en tránsito en lugar de enviarlo a su destino.
## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Dispositivos de red (Routers, Gateways) gestionando la migración.
- **Mecanismos de Detección:** Un análisis de *Traceroute* mostraría que los paquetes de datos se detienen en un salto intermedio (el router de la pasarela) y se produce un *Timeout*, indicando que los datos nunca llegan a su destino.
- **Fallo Preventivo:** Inexistencia de auditorías de integridad (Firmware Integrity Check) sobre la infraestructura de red subyacente. Se asumió que el medio de transporte era pasivo y seguro.
## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Tai y su dispositivo (Script de Diagnóstico Interno / DPI).
- **Acción Tomada:** Estando "dentro" del router (en tránsito), los datos (los niños) corren un script de autodiagnóstico. Identifican la rutina maliciosa (el Engranaje Negro en el estómago) y lanzan una orden de purga interna (ataques para destruir el engranaje). Una vez removido, el router reconfigura sus tablas de ruteo, libera el tráfico de red, y los datos logran migrar de forma segura a su destino (*Server Continent*).
## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Reglas de *iptables* o BGP modificadas que descartan (Drop) los paquetes en lugar de reenviarlos (Forward).
- **Recomendaciones (Post-mortem):** Exigir túneles IPsec extremo-a-extremo. Efectuar validaciones de salud (Health Checks) y auditorías de *firmware* en todos los nodos de transporte (Switches, Gateways) antes de usarlos para migraciones críticas.
## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep14_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep14_whamon.rb`
*(El test simula un proceso de migración de datos (`DataMigration`) a través de un `WhamonGateway`. Al estar infectado, el gateway altera la ruta y los datos quedan en estado `:blackhole`. Un agente interno (`InternalDiagnostic.run!`) detecta y destruye la regla de ruteo maliciosa (`:black_gear`). Finalmente, el gateway actualiza sus tablas y la migración se completa con el estado `:server_continent`).*
