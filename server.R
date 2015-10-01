
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

  output$barPlot <- renderPlot({

    # p, q
    p <- input$allelfreq
    q <- 1-p
    a <- input$genovala
    d <- input$genovald
    # popmean
    mu <- (p-q)*a + 2*p*q*d
    # alpha
    alpha <- a + (q-p)*d
    # ZWs
    ZW11 <- 2*q*alpha
    ZW12 <- (q-p)*alpha
    ZW22 <- -2*p*alpha
    # Dominance deviation
    D11 <- -2*q*q*d
    D12 <- 2*p*q*d
    D22 <- -2*p*p*d
    matZW <- matrix(data=c(mu, ZW11, D11, ZW12, D12, ZW22, D22), 
                    nrow = 1, 
                    dimnames = list(c(), c("Mean", "ZW11", "D11", "ZW12", "D12","ZW22", "D22")))
    # draw the barplot
    barplot(height = matZW, col = "red")
    
  })

})

#shinyServer(function(input, output) {
#  
#  output$distPlot <- renderPlot({
#    
#    # generate bins based on input$bins from ui.R
#    x    <- faithful[, 2]
#    bins <- seq(min(x), max(x), length.out = input$bins + 1)
#    
#    # draw the histogram with the specified number of bins
#    hist(x, breaks = bins, col = 'darkgray', border = 'white')
#    
#  })
#  
#})
