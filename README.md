# Forensic Incident Lab — Evidence Collection & Analysis (Linux)

Proyecto práctico de **DFIR / Forensic en Linux**, orientado a demostrar un flujo real de:
- **preservación de evidencias**
- **cadena de custodia**
- **recolección**
- **análisis**
- **documentación profesional**

> Enfoque: método + trazabilidad + reporting (estilo SOC/DFIR).

---

## 🎯 Objetivo
Simular un caso forense realista en un endpoint Linux y documentar:
- qué evidencias se recolectan
- cómo se asegura su integridad (hash)
- cómo se analizan logs, procesos y red
- cómo se construye un timeline y conclusiones defendibles

---

## 🧪 Caso práctico
📄 Ver: `case_description/incident_scenario.md`

---

## 🗂️ Estructura del repositorio

- `collection/` → scripts de recolección y hashes
- `evidence/` → evidencias recolectadas (logs/disk/memory)
- `analysis/` → análisis paso a paso (logs/procesos/red/timeline)
- `report/` → informe final tipo DFIR

---

## ✅ Flujo recomendado (orden correcto)
1. **Preservar** (recolectar evidencias + hashes)
2. **Analizar** (sin contaminar evidencias)
3. **Documentar** (timeline + hallazgos + conclusiones)
4. **Recomendar** (mejoras defensivas)

---

## 🔐 Cadena de custodia (resumen)
Toda evidencia recolectada debe tener:
- fecha/hora
- herramienta usada
- origen
- hash (SHA256) antes y después de empaquetar

---

## 📚 Referencias (fuentes)
- NIST SP 800-86: Guide to Integrating Forensic Techniques into Incident Response  
  https://csrc.nist.gov/publications/detail/sp/800-86/final
- NIST SP 800-61r2: Computer Security Incident Handling Guide  
  https://csrc.nist.gov/publications/detail/sp/800-61/rev-2/final
