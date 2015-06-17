library(shiny)
header <- headerPanel("Determining Species based on 
                      Petal Length and Petal Width - iris data set")
sliderPLength <- sliderInput("PLength","Please enter the Petal Length in cm",
                           value=4,min=1, max=7, step=0.05)
sliderPWidth <- sliderInput("PWidth", "Please enter the Petal Width in cm",
                            value=1.3,min=0.1,max=2.5, step=0.02)
submitPress <- submitButton("Predict")
mainArea <- mainPanel(verbatimTextOutput("PetalLength"),
                      verbatimTextOutput("PetalWidth"),
                      p("The predicted Species is: ",
                        verbatimTextOutput("Predicted")),
                      div(HTML("<hr/>The iris data set gives the measurements in 
                               centimeters of the variables sepal length and width
                               and petal length and width, respectively, for 50 flowers 
                               from each of 3 species of iris. 
                               The species are Iris <i>setosa</i>, 
                               <i>versicolor</i>, and <i>virginica</i>.")),
                      br(),
                      div(HTML("In this Shiny application, we predict Species as a
                                function of petal length and petal width.
                                Please select the values of petal length and petal width,
                                and then click Predict to see the species predicted. 
                                <br/><br/>
                                The prediction algorithm used is the CART approach.
                                When we predict Species as a function of all other
                                variables, we see that only two variables have 
                                high predictive
                                value = <i>Petal.Length</i> and <i>Petal.Width</i>.
                                Please note that the simplest CART model has been
                                applied. It is possible to improve this model by
                                optimizing the complexity parameter cp, and using
                                cross-validation.")),
                      br(),
                      div(HTML("The basic code used to construct the model is shown
                               below. Please note that for simplicity, training and test sets
                               have not been used. The objective is to illustrate how a 
                               prediction model can be used visually in an interactive
                               format")),
                      br(),
                      p(code("data(iris)")),
                      p(code("library(rpart)")),
                      p(code("library(rpart.plot)")),
                      p(code("fit <- rpart(Species~Petal.Length+Petal.Width, data=iris)")),
                      br(),
                      p("The CART model prediction mechanism  is shown below. 
                        Please check to see if you get results that tally!"),
                      br(),
                      plotOutput("Plot")
            
                     )

shinyUI(pageWithSidebar(header,sidebarPanel(sliderPLength, sliderPWidth,
                                            submitPress),mainArea))


