library("shiny")
library("shinythemes")
library("shinyWidgets")



ui <- shinyUI(
    fluidPage(theme = shinytheme("darkly"),
        includeCSS("www/style.css"),
              fluidRow(
                  column(width = 10,offset = 1,
                         navbarPage("Meu CV",
                                    # position = "fixed-top",
                                    tabPanel("Apresentação"),
                                    tabPanel("Skillz",
                                             br(),
                                             br(),
                                             br(),
                                             br(),
                                             br(),
                                             br(),
                                             column(4,
                                                    h3("Linguagens:"),
                                                    progressBar(title = "R", id = "skillzbar1", value = 73, total = 100, status = "light", striped = T),
                                                    progressBar(title = "CSS", id = "skillzbar1", value = 13, total = 100, status = "light", striped = T))),
                                    tabPanel("Experiências Acadêmicas"),
                                    tabPanel("Experiências Profissionais"),
                                    tabPanel("Portifólio"),
                                    tabPanel("Contato"),
                                    navbarMenu("more",
                                               tabPanel("Panel_M1"),
                                               tabPanel("Panel_M2"),
                                               tabPanel("Panel_M3"),
                                               tabPanel("Panel_M4"))
                         ))
              )
    )
)




















# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
