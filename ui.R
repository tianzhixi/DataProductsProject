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
    h5('Converted height (centimeters to inches):'),
    verbatimTextOutput("oht2"),
    h5('Converted weight (kilograms to pounds):'),
    verbatimTextOutput("owt2"),
    h5('Your height (inches):'),
    verbatimTextOutput("oht1"),
    h5('Your weight (pounds):'),
    verbatimTextOutput("owt1"),
    h5('Your BMI:'),
    verbatimTextOutput("prediction"),
    h5('BMI Categories:'),
    h6('Underweight = <18.5'),
    h6('Normal weight = 18.5-24.9'),
    h6('Overweight = 25-29.9'),
    h6('Obesity = BMI of 30 or greater')
  )
))