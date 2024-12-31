visualizationUI <- function(id) {
  ns <- NS(id)
  tagList(
    fluidRow(
      box(
        width = 12,
        title = "Data Visualization",
        uiOutput(ns("viz_content"))
      )
    )
  )
}

visualizationServer <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    
    output$viz_content <- renderUI({
      req(data())
      
      tagList(
        esquisse::esquisse_ui(
          id = ns("esquisse"), 
          header = FALSE,
          container = esquisse::esquisse_container(height = "600px")
        ),
        box(
          width = 12,
          title = "Generated Code",
          verbatimTextOutput(ns("code_output"))
        )
      )
    })
    
    # Initialize esquisse only when UI is ready
    observe({
      req(data())
      
      data_r <- reactiveValues(
        data = data(),
        name = "uploaded_data"
      )
      
      result <- esquisse::esquisse_server(
        id = "esquisse",
        data = data_r
      )
      
      output$code_output <- renderPrint({
        req(result$code_plot)
        cat("Plot code:\n")
        cat(result$code_plot)
        if (!is.null(result$code_filters$dplyr)) {
          cat("\n\nFilter code:\n")
          cat(deparse(result$code_filters$dplyr))
        }
      })
    })
  })
}
