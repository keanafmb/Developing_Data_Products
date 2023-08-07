library(shiny)
shinyUI(fluidPage(
    titlePanel("Predict Diamond Price from Carat"),
    sidebarLayout(
        sidebarPanel(
            helpText("This application predicts the price of a diamond based on carat"),
            sliderInput("sliderCarat", "What is the carat?", 0.2, 5.01, value = 3)
         
        ),
        mainPanel(
            plotOutput("plot1"),
            h3("Predicted Price in US Dollars:"),
            h4(textOutput("pred1"))
            
        )
    )
))