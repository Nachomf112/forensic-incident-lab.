# Incident Scenario — Linux Server Suspicious Activity

## Contexto
Se detecta actividad anómala en un servidor Linux: accesos SSH fuera de horario y procesos desconocidos.

## Señales iniciales
- intentos de login SSH desde IPs no habituales
- picos de CPU intermitentes
- conexiones de red salientes sospechosas

## Objetivo del análisis
1) Preservar evidencias sin contaminar el sistema  
2) Identificar acciones del atacante (si aplica)  
3) Construir timeline de actividad  
4) Documentar hallazgos y recomendaciones

## Alcance
- Logs del sistema (auth/syslog/journal)
- Procesos y servicios activos
- Conexiones de red y puertos
- Usuarios/sesiones
- Artefactos de persistencia comunes
