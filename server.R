library(shiny)
data(iris)
library(rpart)
library(rpart.plot)
fit <- rpart(Species~Petal.Length+Petal.Width, data=iris)

shinyServer(
            function(input, output)
            {
              execwhenNeeded1 <- reactive({as.numeric(input$PLength)})
              execwhenNeeded2 <- reactive({as.numeric(input$PWidth)})
              output$PetalLength <- renderPrint({
                paste0("The value entered for Petal.Length is: ", execwhenNeeded1(),
                       "cm")})
              output$PetalWidth <- renderPrint({
                paste0("The value entered for Petal.Width is: ", execwhenNeeded2(),
                       "cm")})
              output$Predicted <- renderPrint({
                as.character(predict(fit,data.frame(Petal.Length=input$PLength
                                                    , Petal.Width=input$PWidth),
                                     type="class"))})
              output$Plot <- renderPlot({prp(fit)})
              }
)
