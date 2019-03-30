# Copyright Sreekumar Pillai, 2017
# This is the server logic of a Shiny web application. 

setwd("/srv/shiny-server/estimatecdm/ecdm")
library(shiny)
library(plyr)
library(dplyr)
library(pryr)
library(dtplyr)

getEstimate <- function(c,r,a){
  
  estimate = (1.374 * as.integer(c)) + (1.126 * as.integer(r)) + (0.311 * as.integer(a))
  if(estimate <= 11.546 ){
    return("Error: Cannot Estimate for low values!")
  }
  else{
    return (estimate-11.546)
  }
}


shinyServer(function(input, output) {
  output$estimate <- renderText({
    # Simply accessing input$goButton here makes this reactive
    # object take a dependency on it. That means when
    # input$goButton changes, this code will re-execute.
    
    input$goButton
    
    # Use isolate() to avoid dependency on input$n
    isolate({
      if(input$c !=""){
        estimate <- getEstimate(input$c,input$r, input$a )
        estimate
       
      }else{
        "Please enter valid numbers"
     
      }
    })
   
  })
})
