library("DT")
library(ggplot2)

navbarPage(
  "CGS Data app",
  tabPanel("Home", fluidPage("Home Page", title = "Home Page",
                             sidebarLayout(
                               sidebarPanel(
                                 selectInput("selected_continent1",
                                             label = "Select a continent",
                                             choices = "Europe"
                                 ),
                                 selectInput("selected_year",
                                             label = "Select a year",
                                             choices = NULL
                                 )
                               ),
                               mainPanel(  dataTableOutput("species_table"))
                             )
  )),
  tabPanel("Prediction Reports", fluidPage( theme = bslib::bs_theme(bootswatch = "flatly"),
                                title = "Reports Page",
                                sliderInput("slider",
                                label="choose an exponenet",
                                min =-10, max =10, value =1),
                                plotOutput("curve_plot"),
                                plotOutput("PredeictCustomerChurn"),
                                plotOutput("plotchart", width = "400px")
                                
  )),
  tabPanel("CSV Report", fluidPage("Loading CSV",
    
    fileInput('target_upload', 'Choose file to upload',
              accept = c(
                'text/csv',
                'text/comma-separated-values',
                '.csv'
              )),
    radioButtons("separator","Separator: ",choices = c(";",",",":"), selected=";",inline=TRUE),
    DT::dataTableOutput("sample_table")
  )),
  tabPanel("Contact", fluidPage("Contact us", titlePanel("CGS Data solution"), tags$head(tags$style(HTML(".not_bold label {font-weight:normal;}"))),
                               div(class="bold")  
                               ,p("infor@cgs-online.de")))
  
)

