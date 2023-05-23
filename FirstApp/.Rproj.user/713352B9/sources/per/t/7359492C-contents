library("tidyverse")
library("DT")
library("gapminder")
library(ggplot2)

function(input,output,session)
{
  thematic::thematic_shiny()
  output$curve_plot<- renderPlot({
    curve(x^input$slider, from = -5, to = 5)
  })
  
  df_products_upload <- reactive({
    inFile <- input$target_upload
    if (is.null(inFile))
      return(NULL)
    df <- read.csv(inFile$datapath, header = TRUE,sep = input$separator)
    return(df)
  })
  
  output$sample_table<- DT::renderDataTable({
    df <- df_products_upload()
    DT::datatable(df)
  })
  
  updateSelectInput(session,
                    "selected_continent1",
                    choices = unique(gapminder$continent)
  )
  
  observeEvent(input$selected_continent1, {
    available_years <- gapminder %>%
      filter(continent == input$selected_continent1) %>%
      select(year) %>%
      unique() %>%
      .[[1]]
    
    updateSelectInput(session,
                      "selected_year",
                      choices = available_years
    )
  })
  
  output$species_table <- renderDataTable({
    gapminder %>%
      filter(continent == input$selected_continent1) %>%
      filter(year == input$selected_year) %>%
      select(-continent, -year) %>%
      datatable(rownames = FALSE)
  })
  
  output$plotchart <- renderPlot(plot(1:5), res = 96)
  
  output$PredeictCustomerChurn <- renderPlot({
    ggplot(mtcars, aes(wt, mpg)) +
      geom_point() +
      geom_smooth()
  }, res = 96)
}