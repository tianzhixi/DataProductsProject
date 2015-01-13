BMI <- function(ht, wt) {
  wt/(ht^2)*703
}

shinyServer(
  function(input, output) {
    converted.ht <- reactive({(input$ht2)*0.393701})
    converted.wt <- reactive({(input$wt2)*2.20462}) 
    output$oht1 <- renderPrint({input$ht1})
    output$owt1 <- renderPrint({input$wt1})
    output$oht2 <- renderPrint({converted.ht()})
    output$owt2 <- renderPrint({converted.wt()})
    output$prediction <- renderPrint({
      if (input$goButton == 0) "You haven't pressed the calculate button yet."
      else round(BMI(input$ht1, input$wt1), digits=2)
    })
  }
)