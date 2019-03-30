library(shiny)

shinyUI(fluidPage(
  titlePanel("Get estimated Lines of Code - KLOC"),
  fluidRow(
    column(4,
           h3(textOutput(outputId = "estimate"))),
    column(8, wellPanel(
      sliderInput("c", label = h4("Number of classes in the CDM"), min=1, max=100,value=4) ,
      sliderInput("r", label = h4("Number of relationships"), min=1, max=100,value=5) ,
      sliderInput("a", label = h4("Average number of Attributes"), min=1, max=100,value=3) ,
      actionButton("goButton", "Estimate Size"),
      br(),
      br(),
      p("Enter number of classes, relationships and average class attributes in the text boxes",
        br(),
        "The estimate in KSLOC is displayed on top.  Increase the number of attributes if there is an error."))
    )
  )
))
