uploadUI <- function(id) {
  ns <- NS(id)
  tagList(
    box(
      title = "Upload Data",
      width = 12,
      fileInput(ns("file"), "Choose CSV/Excel File",
                multiple = FALSE,
                accept = c(".csv", ".xls", ".xlsx")),
      radioButtons(ns("file_type"), "File Type",
                  choices = c("CSV" = "csv", "Excel" = "excel")),
      actionButton(ns("upload"), "Upload Data"),
      tags$hr(),
      tags$small("Maximum file size: 500MB"),
      uiOutput(ns("upload_status")),
      shinyWidgets::progressBar(
        ns("progress"),
        value = 0,
        total = 100,
        title = "Upload progress:",
        display_pct = TRUE
      )
    )
  )
}

uploadServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    data <- reactiveVal(NULL)
    
    output$upload_status <- renderUI({
      req(input$file)
      size_mb <- round(input$file$size / 1024^2, 2)
      tags$p(sprintf("File size: %s MB", size_mb))
    })
    
    observeEvent(input$upload, {
      req(input$file)
      
      shinyWidgets::updateProgressBar(
        session = session,
        id = "progress",
        value = 0
      )
      
      tryCatch({
        withProgress(message = 'Loading data...', value = 0, {
          shinyWidgets::updateProgressBar(
            session = session,
            id = "progress",
            value = 30
          )
          
          if (input$file_type == "csv") {
            df <- read_csv(input$file$datapath, progress = FALSE)
          } else {
            df <- read_excel(input$file$datapath, progress = FALSE)
          }
          
          shinyWidgets::updateProgressBar(
            session = session,
            id = "progress",
            value = 100
          )
        })
        
        data(df)
        showNotification(
          "Data loaded successfully!",
          type = "message"  # Changed from "success" to "message"
        )
        
      }, error = function(e) {
        showNotification(
          paste("Error loading file:", e$message),
          type = "error",
          duration = 10
        )
      })
    })
    
    return(data)
  })
}
