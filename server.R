library(shiny)
shinyServer(function(input, output) {
  
  bhaskara = function(eq){
    break1 <- strsplit(eq," ")
    a <- (unlist(break1)[1])
    a <- strsplit(a,"x")
    a <- (unlist(a)[1])
    if (a == "-" | a == "+"| a == "")
      a <- 1
    a <- as.numeric(a)
    
    b <- (unlist(break1)[2])
    b <- strsplit(b,"x")
    b <- (unlist(b)[1])
    if (b == "-" | b == "+"| b == "")
      b <- 1
    b <- as.numeric(b)
    
    c <- (unlist(break1)[3])
    if (c == "-" | c == "+"| c == "")
      c <- 1
    c <- as.numeric(c)
    
    delta = b^2-4*a*c
    X1 = (-b+(sqrt(delta)))/(2*a)
    X2 = (-b-(sqrt(delta)))/(2*a)
    vertX = (-b)/(2*a)
    vertY = (-delta)/(4*a)
    
    deltaret <- paste("Delta =",delta)
    X1ret <- paste("X1=",X1)
    X2ret <- paste("X2=",X2)
    VertXret <- paste("Vertice of X=",vertX)
    VertYret <- paste("Vertice of Y=",vertY)
    ret <- paste(deltaret,X1ret,X2ret,VertXret,VertYret,sep="\n")
    cat(ret)
    
  }
  
  bhaskaraplot <- function(eq){
    break1 <- strsplit(eq," ")
    a <- (unlist(break1)[1])
    a <- strsplit(a,"x")
    a <- (unlist(a)[1])
    if (a == "-" | a == "+"| a == "")
      a <- 1
    a <- as.numeric(a)
    
    b <- (unlist(break1)[2])
    b <- strsplit(b,"x")
    b <- (unlist(b)[1])
    if (b == "-" | b == "+"| b == "")
      b <- 1
    b <- as.numeric(b)
    
    c <- (unlist(break1)[3])
    if (c == "-" | c == "+"| c == "")
      c <- 1
    c <- as.numeric(c)
    
    #Plot
    curve(a*x^2+b*x+c, -5, 5, col = "blue", lwd = 2)
    title(main = as.character(eq), font.main=4, cex.main = 2)
    abline(h=0, v=0, lty=1, col = "red", lwd = 2)
    grid(col = "lightgray", lwd = 1)
  }
  
  resolveBhaskara <- reactive({
    bhaskara(req(tolower(input$equation)))
  })
  
  output$equat <- renderPrint({
    resolveBhaskara()
  })
  
  output$plot1 <- renderPlot({
    bhaskaraplot(req(tolower(input$equation)))
  })
})
