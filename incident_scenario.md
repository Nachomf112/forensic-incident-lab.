# Incident Scenario – Unauthorized Access on Linux Endpoint

## 1. Contexto general

Se simula un incidente de seguridad en un endpoint Linux corporativo utilizado como servidor interno.
El sistema forma parte de un entorno controlado y el análisis se realiza con fines educativos y de entrenamiento DFIR.

El equipo SOC recibe una alerta relacionada con actividad anómala de red y posible ejecución de procesos no habituales
fuera del horario normal de operación.

---

## 2. Detección inicial

La detección inicial se produce a través de:

- Alertas de tráfico de red sospechoso (conexiones salientes no habituales).
- Indicadores de posible ejecución de comandos no autorizados.
- Incremento de actividad en procesos del sistema sin justificación operativa clara.

En este punto **no se confirma compromiso**, únicamente se detecta un comportamiento anómalo
que requiere análisis forense.

---

## 3. Alcance inicial conocido

En el momento de la detección:

- Se desconoce el vector de entrada.
- No se sabe si existen otros sistemas afectados.
- No hay evidencia confirmada de exfiltración de datos.
- El sistema continúa en funcionamiento.

El objetivo inicial del análisis es **preservar evidencias sin alterar el estado del sistema**.

---

## 4. Objetivos del análisis forense

Este ejercicio tiene como objetivos:

- Identificar posibles indicadores de compromiso (IOCs).
- Reconstruir la línea temporal de los eventos relevantes.
- Analizar procesos, red y logs del sistema.
- Determinar si existe acceso no autorizado.
- Documentar todo el proceso de forma defendible.

---

## 5. Restricciones y criterios forenses

Durante el análisis se aplican los siguientes principios:

- Preservación de evidencias antes del análisis.
- Separación entre recolección y análisis.
- Registro de acciones realizadas.
- Uso de hashes para verificar integridad.
- Enfoque alineado con buenas prácticas DFIR.

---

## 6. Resultado esperado

El resultado final del ejercicio será:

- Un timeline claro del incidente.
- Evidencias documentadas y verificables.
- Un informe forense estructurado.
- Conclusiones basadas en evidencias, no suposiciones.

Este escenario replica un caso típico de investigación forense en un entorno SOC.

