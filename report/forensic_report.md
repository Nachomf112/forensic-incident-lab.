# Forensic Incident Report  
**Proyecto:** Forensic Incident Lab – Linux  
**Analista:** Ignacio Menárguez Fernández  
**Fecha:** 2026-01-02  
**Entorno:** Linux (Kali / Debian) – Laboratorio controlado  

---

## 1. Resumen Ejecutivo

Se ha realizado un análisis forense básico sobre un sistema Linux con el objetivo de identificar posibles indicios de compromiso, actividad maliciosa o persistencia no autorizada.

La investigación se ha centrado en la recolección controlada de evidencias volátiles y no volátiles, el análisis de logs, procesos, red y la reconstrucción temporal de eventos relevantes.

**Resultado principal:**  
No se han identificado evidencias claras de compromiso activo durante el periodo analizado.

---

## 2. Alcance del Análisis

El análisis ha incluido las siguientes áreas:

- Identificación del sistema
- Sesiones de usuario y accesos
- Procesos en ejecución y servicios
- Estado de red y comunicaciones
- Persistencia y módulos del kernel
- Correlación temporal de eventos

No se ha realizado análisis de malware avanzado ni ingeniería inversa, al no detectarse indicadores que lo justificaran.

---

## 3. Evidencias Recolectadas

Las evidencias fueron recolectadas mediante un script propio de adquisición forense ejecutado en entorno controlado.

### Tipos de evidencia:
- Logs del sistema (journal)
- Información de usuarios y sesiones
- Procesos y servicios activos
- Estado de red, rutas e interfaces
- Snapshot de binarios y módulos del kernel

### Integridad:
- Todas las evidencias fueron almacenadas con control de hashes SHA256.
- Se mantuvo separación entre recolección y análisis.

---

## 4. Análisis Técnico

### 4.1 Logs
No se detectaron errores críticos, accesos no autorizados ni patrones anómalos en los logs del sistema durante el periodo analizado.

### 4.2 Procesos
Los procesos activos corresponden a servicios estándar del sistema y procesos del kernel.  
No se observaron binarios ejecutándose desde rutas sospechosas ni procesos persistentes anómalos.

### 4.3 Red
No se identificaron conexiones persistentes hacia destinos externos sospechosos ni listeners inesperados en puertos críticos.

### 4.4 Persistencia
No se detectaron mecanismos de persistencia evidentes ni módulos del kernel no reconocidos.

---

## 5. Línea Temporal

La correlación de eventos no muestra una secuencia clara de ataque:

- Funcionamiento normal del sistema
- Actividad de usuarios legítima
- Procesos estables
- Comunicaciones de red coherentes con el entorno

---

## 6. Conclusiones

- No existen evidencias suficientes para confirmar un compromiso del sistema.
- El sistema se encontraba estable en el momento de la adquisición.
- No se detectaron indicadores de intrusión, persistencia ni exfiltración.

**Importante:**  
La ausencia de evidencia no equivale a evidencia de ausencia. El análisis se limita al periodo y alcance definidos.

---

## 7. Recomendaciones

- Mantener monitorización continua de logs y red.
- Implementar alertas basadas en comportamiento.
- Integrar análisis forense como feedback para reglas SOC.
- Realizar capturas de memoria en incidentes activos futuros.
- Documentar siempre cadena de custodia desde el inicio.

---

## 8. Valor SOC / Blue Team

Este caso demuestra un enfoque estructurado de DFIR orientado a SOC:

- Recolección controlada
- Análisis basado en evidencias
- Documentación defendible
- Conclusiones sin suposiciones

---

**Fin del informe**

