---
title       : Developing Data Products
subtitle    : Course Project
author      : Tianzhixi Yin
job         : Student
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : mathjax            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## What does my little Shiny App do?

- It simply calculates your body mass index for you. It can be accessed [here](https://tianzhixi.shinyapps.io/DataProductsProject).
- The BMI formula (in standard units):
$$\mbox{BMI} = \dfrac{\mbox{Weight(lb)}}{\mbox{(Height(in))}^2} \times 703$$

## How does it work?

1. Enter your height (inches) and weight (pounds) in the left panel.
2. Press the calculate button.
3. Your BMI will appear on the right panel.
4. If you do not know your height and weight in the standard units, you can use the third and fourth textboxes in the left panel to convert from the metric units to the standard units, the conversion results will appear on the right panel. Just copy the new measurements and follow the previous steps.

---

## Example R codes.
Here is an example of the R codes used to calculate the BMI.


```r
ht <- 69
wt <- 143
BMI <- wt/(ht^2)*703
BMI
```

```
## [1] 21.12
```

---
## ui.R
```
shinyUI(pageWithSidebar(
  headerPanel("Body Mass Index Calculator"),
  sidebarPanel(
    numericInput('ht1', 'Please enter your height (inches)', 0),
    numericInput('wt1', 'Please enter your weight (pounds)', 0),
    actionButton("goButton", "Calculate"),
    h6('If you only know metric, enter and use the conversion results on the right.'),
    numericInput('ht2', 'Please enter your height (centimeters)', 0),
    numericInput('wt2', 'Please enter your weight (kilograms)', 0)
  ),
  mainPanel(
    h5('Converted height (centimeters to inches):'), verbatimTextOutput("oht2"),
    h5('Converted weight (kilograms to pounds):'), verbatimTextOutput("owt2"),
    h5('Your height (inches):'), verbatimTextOutput("oht1"),
    h5('Your weight (pounds):'), verbatimTextOutput("owt1"),
    h5('Your BMI:'), verbatimTextOutput("prediction"),
    h5('BMI Categories:'), h6('Underweight = <18.5'), h6('Normal weight = 18.5-24.9'),
    h6('Overweight = 25-29.9'), h6('Obesity = BMI of 30 or greater')
  )
))
```

---
## server.r
```
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
```
