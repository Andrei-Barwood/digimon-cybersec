# PLANTILLA DE EPISODIO: 07 - Roar! Ikkakumon

**Voz de Izzy (Koushiro):** "¡Prodigioso! Tenemos un nuevo incidente de seguridad."

## 1. Contexto del Incidente (Canon vs Cybersec)
- **Digimon Enemigo:** Unimon (Servicio de Confianza Infectado)
- **Vector de Ataque (Analogía):** Ataque de Cadena de Suministro (Supply Chain) / Watering Hole
- **Descripción del Escenario:** Unimon es una entidad "sagrada", un proceso interno o de *lista blanca* (Whitelisted) con altos privilegios. Al beber de una fuente infectada (descargar una actualización o dependencia comprometida de un repositorio), un Engranaje Negro se incrusta en su espalda. Esto transforma al nodo seguro en una amenaza interna (*Insider Threat*), utilizando sus altos privilegios para evadir las políticas del firewall y atacar a la infraestructura central.
## 2. Prevención y Detección Temprana (Analyzer)
- **Superficie de Ataque:** Dependencias de terceros o fuentes de actualización compartidas (el estanque de agua).
- **Mecanismos de Detección:** El sistema EDR advierte que un proceso firmado y confiable (Unimon) está ejecutando *syscalls* anómalas (lanzando ataques).
- **Fallo Preventivo:** Confianza implícita. Al estar en la *Whitelist*, los firewalls y antivirus tradicionales ignoraron la actividad sospechosa inicial. No existía una política de *Zero Trust Architecture* (ZTA).
## 3. Mitigación de Daños (Evolution)
- **Herramienta de Defensa (Digimon Aliado):** Gomamon evoluciona a Ikkakumon. Actúa como un Sistema de Prevención de Intrusos (IPS) o un EDR con capacidad de remediación quirúrgica.
- **Acción Tomada:** Ikkakumon lanza su "Harpoon Torpedo" (Torpedo Arpón). Este ataque intercepta la firma del inyector (el Engranaje Negro en la espalda de Unimon) y lo destruye físicamente de la memoria del proceso, sin detener ni dañar al servicio legítimo (Unimon), devolviéndolo a la lista blanca.
## 4. Análisis Forense y Reporte (PDF Export)
- **Artefactos del Malware:** Un *payload* malicioso oculto en una actualización o librería de terceros legítima (Watering hole / Supply Chain).
- **Recomendaciones (Post-mortem):** Implementar modelo *Zero Trust*, auditar y firmar dependencias externas (SCA - Software Composition Analysis), y establecer reglas heurísticas EDR incluso para binarios *Whitelisted*.
## 5. Código Ejecutable (Prodigious Tests)
- **Ruta del test:** `test/episodios/ep07_test.rb`
- **Ruta de la lógica:** `lib/digi_sec/ep07_unimon.rb`
*(El test simula un `TrustedService`. Cuando bebe de la `InfectedDependency`, su lista de procesos se infecta con `:black_gear` y su estado cambia a `:hostile`, evadiendo los firewalls básicos al tener `is_whitelisted = true`. `IkkakumonDefense.harpoon_torpedo!` debe detectar el proceso anómalo en memoria y removerlo, restaurando el servicio a `:benign`).*
