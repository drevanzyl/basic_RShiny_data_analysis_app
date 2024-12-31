# R Shiny Data Analysis Application

A comprehensive data analysis web application built with R Shiny, providing interactive tools for data manipulation, analysis, and visualization.

## Features

- **File Upload**
  - Supports CSV and Excel files
  - Maximum file size: 500MB
  - Preview uploaded data instantly

- **Data Preview & Management**
  - Interactive data table with search and filter
  - Column type inspection
  - Basic data cleaning options

- **Descriptive Analysis**
  - Summary statistics
  - Frequency tables
  - Cross-tabulations
  - Statistical tests

- **Data Exploration**
  - Interactive pivot tables
  - Dynamic filtering
  - Data aggregation tools

- **Visualization**
  - Custom chart creation
  - Multiple plot types (scatter, bar, line, etc.)
  - Customizable aesthetics
  - Export options

## Setup

### Prerequisites
- R (≥ 4.0.0)
- RStudio (recommended)

### Required Packages
```R
required_packages <- c(
    "shiny",
    "shinydashboard",
    "DT",
    "gtsummary",
    "rpivotTable",
    "esquisse",
    "readr",
    "readxl",
    "ggplot2",
    "shinyWidgets"
)
```

### Installation
1. Clone this repository
2. Open the project in RStudio
3. Run `app.R`
4. Access the application in your web browser

## Project Structure
```
├── app.R                  # Main application file
├── modules/              # Module components
│   ├── upload_module.R
│   ├── preview_module.R
│   ├── descriptive_module.R
│   ├── exploration_module.R
│   └── visualization_module.R
├── www/                  # Static assets
│   └── custom.css
└── README.md
```

## Usage

1. Start by uploading your dataset using the Upload Data tab
2. Preview and verify your data in the Data Preview tab
3. Generate summary statistics in the Descriptive Analysis tab
4. Explore relationships using the Data Exploration tools
5. Create custom visualizations in the Visualization tab

## License

This project is licensed under the MIT License.
