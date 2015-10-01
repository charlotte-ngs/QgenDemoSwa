
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Breeding Values"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("allelfreq",
                  "Allele Frequency p:",
                  min = 0,
                  max = 1,
                  value = 0.5,
                  step = 0.05),
      sliderInput("genovala",
                  "Genotypic Value a:",
                  min = -10,
                  max = 10,
                  value = 0,
                  step = 1),
      sliderInput("genovald",
                  "Genotypic Value d:",
                  min = -10,
                  max = 10,
                  value = 0,
                  step = 1)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("barPlot")
    )
  )
))

#shinyUI(fluidPage(
#  
#  # Application title
#  titlePanel("Old Faithful Geyser Data"),
#  
#  # Sidebar with a slider input for number of bins
#  sidebarLayout(
#    sidebarPanel(
#      sliderInput("bins",
#                  "Number of bins:",
#                  min = 1,
#                  max = 50,
#                  value = 30)
#    ),
#    
#    # Show a plot of the generated distribution
#    mainPanel(
#      plotOutput("distPlot")
#    )
#  )
#))
