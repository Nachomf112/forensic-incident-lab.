# Log Analysis

## Objetivo
Analizar los logs del sistema para identificar eventos anómalos, intentos de acceso no autorizados o comportamientos sospechosos relevantes para un incidente de seguridad.

## Fuentes analizadas
- journal_last24h.txt
- users_sessions.txt
- processes_services.txt

## Observaciones

- No se detectan errores críticos recurrentes en los logs del sistema.
- No aparecen reinicios inesperados ni fallos de servicios clave.
- No se observan accesos interactivos anómalos en el periodo analizado.

## Eventos relevantes
- Actividad normal de servicios del sistema.
- Procesos del kernel coherentes con un entorno Linux estándar.

## Conclusión
En el periodo analizado no se identifican evidencias claras de compromiso a nivel de logs del sistema.  
Se recomienda correlacionar esta información con procesos activos, red y persistencia para confirmar el estado del sistema.
