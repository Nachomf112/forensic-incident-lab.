# Network Analysis

## Objetivo
Analizar el estado de red del sistema para identificar conexiones sospechosas, puertos abiertos inesperados o rutas anómalas.

## Fuentes analizadas
- network_info.txt
- network_state.txt

## Observaciones

- No se detectan conexiones persistentes hacia direcciones externas sospechosas.
- Las interfaces de red activas corresponden al entorno esperado (máquina virtual).
- No se observan rutas manipuladas ni túneles no autorizados.

## Puertos y servicios
- Servicios activos coherentes con un sistema Linux estándar.
- No se identifican listeners inesperados en puertos críticos.

## Conclusión
No se identifican indicadores claros de exfiltración de datos ni comunicaciones maliciosas durante la captura.  
El estado de red es consistente con un sistema en funcionamiento normal.
