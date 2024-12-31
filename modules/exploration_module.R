explorationUI <- function(id) {
  ns <- NS(id)
  tagList(
    box(
      title = "Data Exploration",
      width = 12,
      rpivotTableOutput(ns("pivot"))
    )
  )
}

explorationServer <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    output$pivot <- renderRpivotTable({
      req(data())
      rpivotTable(data(),
                  rows = names(data())[1],
                  cols = names(data())[2],
                  aggregatorName = "Count",
                  rendererName = "Table")
    })
  })
}
