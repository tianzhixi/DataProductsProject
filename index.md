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

## What is a Shiny App?

- Shiny is a web application framework for R.

- It can turn your codes in R into interactive web applications.

- No HTML, CSS, or JavaScript knowledge are required.

---

## What does my little Shiny App do?

- It simply calculates your body mass index for you.

- The BMI formula (in standard units):
$$\mbox{BMI} = \dfrac{\mbox{Weight(lb)}}{\mbox{(Height(in))}^2} \times 703$$

- My Shiny application can be accessed [here](https://tianzhixi.shinyapps.io/DataProductsProject).

---

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