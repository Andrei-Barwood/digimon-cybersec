# PLANTILLA DE EPISODIO: 19 - Episodio 19

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Datamon (Hacker Rival / APT de Terceros)
- **Vector de Ataque (Analogía):** Riesgo de Terceros (Third-Party Risk) / *Data Kidnapping* (Secuestro de Datos Críticos)
- **Descripción del Escenario:** Izzy intercepta un mensaje de auxilio y el grupo se infiltra en la pirámide (Red Principal de Etemon) para liberar al prisionero: Datamon. Asumen que "el enemigo de mi enemigo es mi amigo". Sin embargo, Datamon resulta ser una amenaza avanzada (APT). Una vez que Izzy rompe el firewall que lo mantenía en cuarentena, Datamon realiza un movimiento lateral, traicionando al grupo y secuestrando a Sora y Biyomon (Datos Críticos del Sistema) para utilizarlos en su propia botnet contra Etemon.
## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Integración con proveedores de terceros o librerías externas no validadas (Datamon).
- **Mecanismos de Detección:** El sistema alerta de movimientos laterales rápidos (Pivoting) desde una zona recién liberada de cuarentena hacia las bases de datos maestras.
- **Fallo Preventivo:** Falta de *Zero Trust* y Principio de Menor Privilegio (PoLP). Izzy (el Admin) confió implícitamente en la identidad del mensaje y concedió acceso a la red interna sin restringir los permisos de lectura/escritura del tercero liberado.
## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Tai asume su rol de líder (Declaración de Respuesta a Incidentes / `IncidentResponse.declare_p0!`).
- **Acción Tomada:** Al fallar Greymon contra Datamon y huir este con los datos hacia las capas más profundas, no existe una mitigación mágica inmediata (sucede un *Cliffhanger*). La acción tomada es aislar la red para que no se propaguen más robos, declarar un Incidente de Prioridad 0 (P0) y entrar en un estado de confinamiento (*Lockdown*), estableciendo un centro de comando (la reunión de los niños) para planificar la recuperación de datos (que ocurrirá en el próximo episodio).
## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Un *payload* que simulaba ser un mensaje de diagnóstico (Auxilio) pero que, al ejecutarse, alteraba permisos locales.
- **Recomendaciones (Post-mortem):** Implementar estrategias *Zero Trust Network Access* (ZTNA). Toda entidad (incluso si parece ser aliada) debe ser autenticada y autorizada continuamente antes de acceder a recursos críticos, y sus permisos deben ser mínimos.
## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep19_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep19_datamon.rb`
*(El test simula un sistema `CoreNetwork` con datos críticos. Un ente tercero (`DatamonAPT`) está en `:quarantined`. El administrador (`IzzyAdmin`) lo libera. Datamon aprovecha el acceso excesivo y ejecuta `kidnap_data!`, robando los datos críticos. Como respuesta inmediata, `IncidentResponse.declare_p0!` aísla la red a estado `:lockdown` y previene una mayor fuga, preparando el terreno para la recuperación).*
