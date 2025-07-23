# 🏛️ Proyecto Contingencias I - Sistema Pensional Colombiano

> **Proyecto académico de Contingencias I - Maestría en Actuaría y Finanzas** 📊  
> Implementación de modelos actuariales en R para análisis del sistema pensional colombiano

## 📋 Descripción del Proyecto

Este proyecto implementa y analiza diferentes modelos pensionales en Colombia, incluyendo el sistema actual de prima media, ahorro individual y una propuesta de sistema mixto. Se desarrollan cálculos actuariales para evaluar tasas de reemplazo, acumulaciones de capital y sostenibilidad fiscal.

## 🗂️ Estructura del Proyecto

```
proyecto-contingencias/
├── 📁 data/                    # Datos del proyecto
│   ├── 📁 input/              # Datos de entrada (tablas de mortalidad)
│   ├── 📁 output/             # Resultados generados
│   └── 📁 processed/          # Datos procesados
├── 📁 docs/                   # Documentación LaTeX
│   ├── 📁 config/            # Configuración de LaTeX
│   ├── 📁 content/           # Contenido por secciones
│   ├── 📄 main.tex           # Documento principal
│   └── 📄 referencias.bib    # Referencias bibliográficas
├── 📁 notebooks/             # Notebooks de Jupyter con kernel R
│   ├── 📓 ahorro_ind.ipynb   # Sistema de ahorro individual
│   ├── 📓 prima_media.ipynb  # Sistema de prima media
│   ├── 📓 nuevo_regimen.ipynb # Nuevo régimen (Ley 2381)
│   └── 📓 propuesta.ipynb    # Sistema propuesto
├── 📁 src/                   # Código fuente
│   ├── 📁 data/              # Scripts de procesamiento de datos
│   ├── 📁 models/            # Modelos actuariales
│   └── 📁 utils/             # Funciones utilitarias R
│       ├── 🔧 acumulacion.R  # Cálculos de acumulación
│       ├── 🔧 propuesta.R    # Modelo propuesto
│       └── 🔧 tasa_reemplazo_*.R # Tasas de reemplazo
├── 📁 images/                # Recursos gráficos
├── 📁 models/                # Modelos entrenados
├── 📄 environment.yml        # Configuración del entorno conda
├── 📄 CLAUDE.md             # Instrucciones para Claude Code
└── 📄 README.md             # Este archivo
```

## 🛠️ Configuración del Entorno

### Prerrequisitos
- 🐍 **Anaconda/Miniconda** instalado
- 📦 **R 4.2.3** o superior
- 📝 **TeXLive** completo para compilación de documentos

### 🚀 Instalación paso a paso

#### 1️⃣ Crear y activar el entorno conda

```bash
# Crear el entorno desde el archivo YAML
conda env create -f environment.yml

# Activar el entorno
conda activate Renv
```

#### 2️⃣ Verificar la instalación

```bash
# Verificar R
R --version

# Verificar Jupyter
jupyter --version

# Listar kernels disponibles
jupyter kernelspec list
```

### 📦 Dependencias principales

**Paquetes R incluidos:**
- `tidyverse` - Manipulación de datos 📊
- `ggplot2` - Visualización 📈
- `dplyr` - Transformación de datos 🔄
- `forecast` - Series temporales ⏰
- `quantmod` - Análisis financiero 💰
- `boot` - Bootstrap estadístico 🔢
- `survival` - Análisis de supervivencia ❤️

## 💻 Uso del Proyecto

### 🔬 Ejecutar análisis en Jupyter

```bash
# Activar el entorno
conda activate Renv

# Iniciar Jupyter Lab
jupyter lab

# Navegar a notebooks/ y ejecutar los análisis
```

**Notebooks disponibles:**
- `prima_media.ipynb` - Análisis del sistema actual de prima media
- `ahorro_ind.ipynb` - Sistema de ahorro individual  
- `nuevo_regimen.ipynb` - Análisis de la reforma (Ley 2381)
- `propuesta.ipynb` - Sistema mixto propuesto

### 📄 Compilar documentación LaTeX

#### Prerrequisitos para LaTeX
```bash
# Ubuntu/Debian
sudo apt-get install texlive-full

# macOS con Homebrew  
brew install --cask mactex

# Windows: Descargar e instalar MiKTeX o TeXLive
```

#### Compilación del documento
```bash
# Navegar al directorio de documentación
cd docs/

# Compilar con latexmk (recomendado)
latexmk -pdf main.tex

# O compilar manualmente
pdflatex main.tex
bibtex main
pdflatex main.tex  
pdflatex main.tex
```

## 🔧 Funciones Principales

### `acumulacion()`
Calcula acumulaciones de capital considerando:
- 💰 Inflación y tasas de interés
- 📅 Tiempo de cotización  
- 💼 Salarios y cotizaciones

### `propuesta()`
Implementa el sistema mixto propuesto con:
- 🏛️ Prima media hasta 1.7 SMMLV
- 💳 Ahorro individual para excedentes
- 📊 Cálculo de tasas de reemplazo combinadas

### Funciones de tasa de reemplazo
- `tasa_reemplazo_prima_media()` - Sistema público actual
- `tasa_reemplazo_ahorro_individual()` - Sistema privado

## 📊 Resultados Principales

El proyecto analiza:
- ✅ **Sostenibilidad fiscal** del sistema actual
- 📈 **Tasas de reemplazo** por nivel salarial
- 💰 **Acumulaciones de capital** en diferentes escenarios
- 🏛️ **Propuesta de reforma** con sistema mixto

## 🎓 Contexto Académico

**Curso:** Contingencias I - Maestría en Actuaría y Finanzas  
**Enfoque:** Matemáticas actuariales aplicadas al sistema pensional colombiano  
**Herramientas:** R, Jupyter, LaTeX, Git

## 📝 Notas de Desarrollo

- El proyecto usa **R** como lenguaje principal para cálculos actuariales
- Los notebooks permiten análisis interactivo y reproducible  
- La documentación se genera automáticamente con LaTeX
- Control de versiones con Git para seguimiento de cambios

## 👥 Autores

**Estudiantes:**  
👨‍🎓 **José Miguel Acuña Hernández**  
👨‍🎓 **Andrés Steven Puertas**  
👨‍🎓 **Santiago Hernández Bernal**  
👨‍🎓 **Yeferson Fabián Rubio Montero**  
👩‍🎓 **Anna Gabriela Salazar Castro**  
👨‍🎓 **Guillermo Eduardo Murillo**  
*Maestría en Actuaría y Finanzas*  
*Universidad Nacional de Colombia*

**Docente:**  
👨‍🏫 **Jaime Abel Huertas Campos**  
*Contingencias de vida 2025-I*  
*Departamento de Matemáticas - Facultad de Ciencias*

## 🤝 Contribución

Este es un proyecto académico individual. Para sugerencias o consultas, contactar al autor.

---

*Desarrollado con ❤️ para el análisis actuarial del sistema pensional colombiano* 🇨🇴