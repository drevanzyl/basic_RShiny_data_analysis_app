# Load required packages
# Install and load required packages
required_packages <- c("shiny", "shinydashboard", "DT", "gtsummary", "rpivotTable", "esquisse", "readr", "readxl", "ggplot2", "shinyWidgets")

# Install missing packages
new_packages <- required_packages[!(required_packages %in% installed.packages()[,"Package"])]
if(length(new_packages)) install.packages(new_packages)

# Load packages
lapply(required_packages, library, character.only = TRUE)

# Set maximum file upload size to 500MB
options(shiny.maxRequestSize = 500*1024^2)

# Source modules
source("modules/upload_module.R")
source("modules/preview_module.R")
source("modules/descriptive_module.R")
source("modules/exploration_module.R")
source("modules/visualization_module.R")

# UI
ui <- dashboardPage(
  dashboardHeader(title = "Data Analysis App"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Upload Data", tabName = "upload", icon = icon("upload")),
      menuItem("Data Preview", tabName = "preview", icon = icon("table")),
      menuItem("Descriptive Analysis", tabName = "descriptive", icon = icon("chart-bar")),
      menuItem("Data Exploration", tabName = "exploration", icon = icon("search")),
      menuItem("Visualization", tabName = "visualization", icon = icon("palette"))
    )
  ),
  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
    ),
    tabItems(
      tabItem(tabName = "upload", uploadUI("upload")),
      tabItem(tabName = "preview", previewUI("preview")),
      tabItem(tabName = "descriptive", descriptiveUI("descriptive")),
      tabItem(tabName = "exploration", explorationUI("exploration")),
      tabItem(tabName = "visualization", visualizationUI("visualization"))
    )
  )
)

# Server
server <- function(input, output, session) {
  # Initialize reactive data storage
  data <- uploadServer("upload")
  
  # Call other module servers
  previewServer("preview", data)
  descriptiveServer("descriptive", data)
  explorationServer("exploration", data)
  
  # Initialize visualization server only when data is loaded and tab is selected
  observe({
    req(data())
    visualizationServer("visualization", data)
  })
}

# Run the app
shinyApp(ui = ui, server = server)
