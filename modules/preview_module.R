previewUI <- function(id) {
  ns <- NS(id)
  tagList(
    box(
      title = "Data Preview",
      width = 12,
      DTOutput(ns("table"))
    )
  )
}

previewServer <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    output$table <- renderDT({
      req(data())
      datatable(data(), options = list(scrollX = TRUE))
    })
  })
}
