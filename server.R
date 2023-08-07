library(shiny)
library(plotly)
shinyServer(function(input, output) {
    data <- diamonds[sample(nrow(diamonds), 1000), ]
    model1 <- lm(price ~ carat, data = data)
    
    model1pred <- reactive({
        caratInput <- input$sliderCarat
        predict(model1, newdata = data.frame(carat = caratInput))
    })
    
    output$plot1 <- renderPlot({
        caratInput <- input$sliderCarat
        # plot(diamonds$carat, diamonds$price, xlab = "Carat",
        #      ylab = "Price (in US Dollars)")
        model1 <- lm(price ~ carat, data = data)
        scatter <- ggplot(data, aes(x = carat, y = price, color = carat, size = carat)) +
            geom_point() + geom_abline(intercept = coef(model1)[1], slope = coef(model1)[2], col = "red", lwd = 0.5) +
            scale_color_gradientn(colors = c("darkblue", "lightblue")) +
            scale_size_continuous(range = c(2, 10)) +
            labs(x = "Carat", y = "Price (in US Dollars)", title = "Carat vs Price of Diamonds") +
            theme_minimal()
        scatter
        
    })
    
    output$pred1 <- renderText({
        model1pred()
    })
    

})
