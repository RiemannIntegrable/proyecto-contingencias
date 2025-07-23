# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Proyecto Overview

Este es un proyecto académico de **Contingencias I** de la Maestría en Actuaría y Finanzas, enfocado en la implementación de modelos actuariales en R.

## Estructura del Proyecto

### Directorios principales:
- `src/`: Código fuente principal
  - `utils/`: Funciones utilitarias (actualmente contiene `acumulacion.R`)
  - `models/`: Modelos actuariales
  - `data/`: Scripts de procesamiento de datos
- `data/`: Datos del proyecto
  - `input/`: Datos de entrada
  - `output/`: Resultados generados
  - `processed/`: Datos procesados
- `notebooks/`: Notebooks de Jupyter con kernel R
- `docs/`: Documentación LaTeX del proyecto
- `models/`: Directorio para modelos entrenados

## Ambiente de Desarrollo

### Entorno conda:
- **Nombre del entorno**: `Renv`
- **Lenguaje principal**: R 4.2.3
- **Herramientas**: Jupyter Lab con kernel R, LaTeX para documentación

### Dependencias R principales:
- `tidyverse`: Manipulación de datos
- `ggplot2`: Visualización 
- `dplyr`: Manipulación de datos
- `forecast`: Modelos de series temporales
- `quantmod`: Análisis cuantitativo financiero
- `boot`: Bootstrap estadístico
- `caret`: Machine learning
- `survival`: Análisis de supervivencia

## Comandos Comunes

### Activar entorno:
```bash
conda activate Renv
```

### Ejecutar notebooks:
```bash
jupyter lab
```

### Trabajar con LaTeX:
```bash
cd docs
latexmk -pdf main.tex
```

## Características del Código

### Funciones actuariales:
- `acumulacion()`: Calcula acumulaciones de pensiones considerando inflación, tasas de cotización y tiempo
- Validación estricta de parámetros numéricos y positivos
- Cálculos actuariales con tasas de interés reales y nominales

### Estilo de código R:
- Validación de entrada exhaustiva con mensajes de error descriptivos
- Uso de funciones base de R para cálculos actuariales
- Comentarios explicativos para fórmulas matemáticas complejas

## Flujo de Trabajo

1. **Desarrollo**: Código R en `src/` con funciones modulares
2. **Pruebas**: Notebooks de Jupyter en `notebooks/` 
3. **Documentación**: LaTeX en `docs/` con configuración modular
4. **Datos**: Procesamiento y almacenamiento en `data/`

## Contexto Académico

Este proyecto implementa modelos de **teoría del riesgo actuarial** y **contingencias de vida**, con enfoque en:
- Cálculos de acumulación de pensiones
- Análisis de supervivencia
- Modelos de riesgo financiero
- Matemáticas actuariales aplicadas