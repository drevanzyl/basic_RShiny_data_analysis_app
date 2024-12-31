descriptiveUI <- function(id) {
  ns <- NS(id)
  tagList(
    box(
      title = "Descriptive Analysis",
      width = 12,
      uiOutput(ns("var_select")),
      gt::gt_output(ns("summary_table"))
    )
  )
}

descriptiveServer <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    output$var_select <- renderUI({
      req(data())
      ns <- session$ns
      selectizeInput(ns("selected_vars"),
                    "Select variables for analysis",
                    choices = names(data()),
                    multiple = TRUE)
    })
    
    output$summary_table <- gt::render_gt({
      req(data(), input$selected_vars)
      data() %>%
        select(all_of(input$selected_vars)) %>%
        tbl_summary() %>%
        as_gt()
    })
  })
}
