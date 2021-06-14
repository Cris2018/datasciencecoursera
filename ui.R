library(shiny)
shinyUI(fluidPage(
  titlePanel("Quadratic Equations"),
  sidebarLayout(
    sidebarPanel(
      h3(strong("Hint to use this app:")),
      p("Please, enter in the input field below the equation to be resolved"),
      p("Mind to separate the values with a 'space' "),
      textInput("equation","What quadratic equation do you want to resolve?",
                placeholder = "ax2 +bx -c"),
      submitButton("Submit")
      ),
    mainPanel(
      h2("Quadratic Equation", align = "center"),
      verbatimTextOutput("equat"),
      br(),
      br(),
      h2("Quadratic Plot", align = "center"),
      plotOutput("plot1")
    )
  )
))