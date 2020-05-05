# loading libraries
library(shiny)
library(tidyverse)
library(mosaic)
library(tidyverse)
library(lubridate)
library(shinyWidgets)
library(streamgraph)
library(imputeTS)
library(plotly)
library(plyr)
library(ggcorrplot)
library(hrbrthemes)
library(viridis)

# data
# elimates time component of the date variable
calendar_base <- read_csv('my_calendar_summary.csv') %>%
  mutate(date = floor_date(date, unit = "day"))

# defines category choices
cat_choices <- unique(calendar_base$description)

# defines class choices (or work)
class_choices <- unique(calendar_base$class)
class_choices <- class_choices[!is.na(class_choices)]

# defines outcome variables to measure
outcome_choices <- c('Time Spent', 'Frequency of Activity')

# defines the choices for activites
activity_choices <- unique(calendar_base$activity)

# Define UI for application that creates a line plot for a given name
ui <- fluidPage(
  
  # Application title
  titlePanel("Diary of a Wimpy Bakshandeh: Documenting my Time during COVID-19"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      # Select Daterange
      dateRangeInput(inputId = 'dateRange',
                     label = 'Enter a valid range of dates:',
                     start = '2020-04-08',
                     end = '2020-04-21'),
      
      # Select Category
      prettyCheckboxGroup(inputId = "cat", 
                  label = "Category of Interest:",
                  choices = cat_choices, 
                  selected = "School",
                  shape = 'curve',
                  thick = TRUE,
                  inline = TRUE,
                  animation = 'smooth'),
      
      # chooses classes
      prettyCheckboxGroup(inputId= "class",
                         label = "Choose your classes of interest:",
                         choices = class_choices,
                         selected = 'Groups',
                         shape = 'curve',
                         fill = TRUE,
                         inline = TRUE,
                         thick = TRUE,
                         animation = 'smooth'),
      
      # choose units of time
      prettyRadioButtons(inputId='time',
                         label='What units of time would you like?',
                         choices = c('Seconds', 'Minutes', 'Hours'),
                         fill=TRUE,
                         animation= 'smooth',
                         selected = 'Hours')
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      navbarPage(title='Questions',
                 tabPanel('Time Allocation between Classes', 
                          tabsetPanel(
                            tabPanel('Histogram', plotlyOutput(outputId = 'timeHist')),
                            tabPanel('Streamgraph', streamgraphOutput(outputId = 'classStream'))
                          ))
                 , tabPanel('Amount of Schoolwork Throughout the Day', plotlyOutput(outputId = 'timeLine'))
                 , tabPanel('Overall Allocation of Time', 
                            tabsetPanel(
                              tabPanel('Boxplot', plotlyOutput(outputId = 'overall')),
                              tabPanel('Violin Plot', plotlyOutput(outputId = 'violin'))
                            )
                 )
                 , tabPanel('Productivity vs Sleep Patterns',
                            tabsetPanel(
                              tabPanel('Correlation Matrix', plotOutput(outputId = 'stats')),
                              tabPanel('Productivity vs. Sleep Patterns', plotlyOutput(outputId = 'sleepProductivity'))
                            )
                 )
                 , tabPanel('Evolution of Time Spent by Category', streamgraphOutput(outputId = 'catStream'))
                 , tabPanel('Main Data Table', DT::dataTableOutput(outputId = 'data')))
      
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  # parameters for the server to check date-time bounds in calls
  lowerBound <- as.Date("2020-04-08")
  upperBound <- as.Date("2020-04-21")
  
  # function that selects the correct times based on user input
  time_units <- function(df, time){
    if(time == 'Seconds'){return(select(df, -c('length_min', 'length_hrs')))}
    else if(time == 'Minutes'){return(select(df, -c('length_sec', 'length_hrs')))}
    else {return(select(df, -c('length_min', 'length_sec')))}
  }
  ################################################
  ## reactive filtered dataset
  ################################################
  formatted_data <- reactive({

    data <- calendar_base %>%
      mutate(date = ymd(date),
             start_datetime = as_datetime(start_datetime, tz='EST'),
             end_datetime = as_datetime(end_datetime, tz='EST')) %>%
      # only descriptions determined by user...
      filter(description %in% input$cat) %>%
      # filters classes if user selected 'School'...
      filter(if(length(input$class) == 0 & length(input$cat)>1) description %in% input$cat
             else if (length(input$class) == 0 & 'School' %in% input$cat) !(description %in% 'School')
             else if (length(input$class) > 0 & 'School' %in% input$cat & length(input$cat)==1) class %in% input$class
             else description %in% input$cat) %>%
      # filters for appropriate dates...
      filter(date >= input$dateRange[1] & date <= input$dateRange[2]) %>%
      # filters for correct times..
      time_units(time=input$time)
    
  })
  
  spread_data <- reactive({
    
    spread_data <- formatted_data() %>%
      group_by_('description', 'date') %>%
      select(starts_with('length_')) %>%
      summarise_all(funs('total'=sum)) %>%
      spread(description, total) %>%
      arrange(date)
    
  })
  
  ################################################
  # plot 1: histogram of all activities by time
  ################################################
  output$timeHist <- renderPlotly({
    
    # to validate the date range and school in description
    validate(
      need('School' %in% input$cat & length(input$cat) < 2, "School must be the only selected category."),
      need(input$dateRange[1] >= lowerBound & input$dateRange[2] <= upperBound, 
           "Invalid date range.\n\nDates must be in between 2020-04-08 and 2020-04-21."),
      need(input$dateRange[1] <= input$dateRange[2] & input$dateRange[2] >= input$dateRange[1],
           "Yikes! This date range NEVER exists.\nMake sure the date on the left is smaller than the date on the right.")
    )
    
    # gets time per activity by day
    data <- formatted_data() %>%
      filter('School' %in% description) %>%
      group_by_('date', 'class') %>%
      select(starts_with('length_')) %>%
      summarise_all(funs('sum'=sum))
  
    p <- ggplot(data, aes_string(x='date', y='sum', fill='class')) +
      geom_col(position='dodge') +
      scale_x_date(date_breaks='1 day', date_labels = '%a %b %d') +
      scale_fill_viridis(discrete = TRUE, alpha=0.6, option='D') +
      theme_ipsum() +
      labs(
        x = 'Date',
        y = paste('Total Time in ', input$time),
        title = 'Time Spent on Particular Classes \nAnd Job-Related Endeavors'
      ) +
      theme(axis.text.x = element_text(angle = 90, hjust = 1))
    # ggplot(formatted_data(), aes(x=date))
      
    ggplotly(p)
    
  })
  
  output$data <- DT::renderDataTable({
    # to validate the date range
    validate(
      need(input$dateRange[1] >= lowerBound & input$dateRange[2] <= upperBound, 
           "Invalid date range.\n\nDates must be in between 2020-04-08 and 2020-04-21."),
      need(input$dateRange[1] <= input$dateRange[2] & input$dateRange[2] >= input$dateRange[1],
           "Yikes! This date range NEVER exists.\nMake sure the date on the left is smaller than the date on the right.")
    )
    
    # prints out data if date-range valid
    formatted_data()
  })
  
  ################################################
  ## plot 2: total time spent on schoolwork per day
  ################################################
  
  output$timeLine <- renderPlotly({
    # to validate the date range and school in description
    validate(
      need(input$time == 'Hours',
           "The order of magnitude will be too large for this time input.
           Make sure you have selected 'Hours' to show this graph."),
      need(length(input$class) > 0, "Make sure at least one class is selected."),
      need('School' %in% input$cat & length(input$cat) < 2, "School must be the one and only selected category."),
      need((input$dateRange[1] >= lowerBound & input$dateRange[2] <= upperBound), 
           "Invalid date range.\n\nDates must be in between 2020-04-08 and 2020-04-21."),
      need(input$dateRange[1] <= input$dateRange[2] & input$dateRange[2] >= input$dateRange[1],
           "Yikes! This date range NEVER exists.\nMake sure the date on the left is smaller than the date on the right.")
    )
    
    # figures out name of time variable
    my_time <- names(formatted_data())[str_detect(names(formatted_data()), 'length_')]
    print(time)
    
    #######################
    # data table manipulation
    ######################
    temp_data <- formatted_data() %>%
      filter('School' %in% description)
    
    # rbinds start and end datetimes, fixing times
    
    # start times only
    start_date_df <- temp_data %>%
      select(-end_datetime) %>%
      mutate(length_hrs=0)
    
    # end times only
    end_date_df <- temp_data %>%
      select(-start_datetime) %>%
      dplyr::rename(start_datetime = end_datetime)

    # start and end times
    my_data <- rbind(start_date_df, end_date_df) %>%
      arrange(date, start_datetime)
    
    #################
    #aggregated data in small df
    #################
    
    #resets cumsum at each date
    total_time_df <- ddply(my_data, .(date), summarise, cumsum(length_hrs))
    names(total_time_df)[2] <- 'total_time'
    total_time_df$start_datetime <- my_data$start_datetime
    total_time_df$class <- my_data$class
    total_time_df$activity <- my_data$activity
    
    # adds total_time variable to df
    my_data <- my_data %>%
      left_join(total_time_df, by=c('date'='date', 'start_datetime' = 'start_datetime', 
                                    'class'='class', 'activity'='activity')) %>%
      arrange(date) %>%
      mutate(time_of_day = format(start_datetime, "%H:%M %p")) %>%
      mutate(time_of_day = ifelse(time_of_day=='00:00 AM', '24:00 PM', time_of_day)) %>%
      arrange(desc(as_datetime(time_of_day)))
    

    ######################
    ## creates plot and incorporates plotly
    ######################
    p <- ggplot(my_data, aes_string(x='time_of_day', y='total_time')) +
      geom_point(aes(color=as.factor(date))) +
      geom_line(aes(group=date, color=as.factor(date))) +
      scale_color_viridis(discrete = TRUE, alpha=0.7, option='D') +
      theme_ipsum() +
      labs(
        x = 'Time of Day',
        y = 'Total Amount of Time On Day',
        title = 'Total Amount of Time doing Schoolwork per Day',
        color = 'Date'
      ) +
      theme(axis.text.x = element_text(angle = 90, hjust = 1))
    
    ggplotly(p)
  })
  
  ###################################################
  ## for the thrid panel: distributions of variables
  ##################################################
  
  ##############################
  ## option 1: boxplot
  ##############################
  output$overall <- renderPlotly({
    # conditions to validate plot
    validate(
      need(input$dateRange[1] >= lowerBound & input$dateRange[2] <= upperBound, 
           "Invalid date range.\n\nDates must be in between 2020-04-08 and 2020-04-21.")
    )
    
    # additional data manipulation
    # print(head(formatted_data()))
    # print(formatted_data() %>% group_by(date, description) %>% summarize(length_hrs = sum(length_hrs)))
    final_data <- formatted_data() %>%
      group_by_('description', 'date') %>%
      select(starts_with('length_')) %>%
      summarise_all(funs('total'=sum))
    
    print(head(final_data))
    # makes plotly plot
    # Basic stream graph: just give the 3 arguments
    # pp <- streamgraph(data, key="name", value="value", date="date", height="300px", width="1000px")
    p <- ggplot(final_data, aes_string(x='description', y='total', fill='description')) +
      geom_boxplot() +
      geom_jitter(aes(color=description), alpha=0.9, show.legend = FALSE) +
      scale_fill_viridis(discrete = TRUE, alpha=0.6, option='B') +
      theme_ipsum() +
      labs(
        x = 'Category',
        y = paste('Total Time Spent in', input$time),
        title = 'Distribution of Time Spent by Category'
      ) +
      theme(legend.position = 'none')
      # scale_x_date(date_breaks='1 day', date_labels = '%a %b %d')
    
    ggplotly(p)
  })
  
  ###################################
  ## option 2: violin plot
  ###################################
  output$violin <- renderPlotly({
    # conditions to validate plot
    validate(
      need(input$dateRange[1] >= lowerBound & input$dateRange[2] <= upperBound, 
           "Invalid date range.\n\nDates must be in between 2020-04-08 and 2020-04-21.")
    )
    
    # additional data manipulation
    # print(head(formatted_data()))
    # print(formatted_data() %>% group_by(date, description) %>% summarize(length_hrs = sum(length_hrs)))
    final_data <- formatted_data() %>%
      group_by_('description', 'date') %>%
      select(starts_with('length_')) %>%
      summarise_all(funs('total'=sum))
    
    # print(head(final_data))
    # makes plotly plot
    # Basic stream graph: just give the 3 arguments
    # pp <- streamgraph(data, key="name", value="value", date="date", height="300px", width="1000px")
    p <- ggplot(final_data, aes_string(x='description', y='total', fill='description')) +
      geom_violin() +
      geom_jitter(aes(color=description), alpha=0.9) +
      geom_jitter(aes(color=description), alpha=0.9) +
      scale_fill_viridis(discrete = TRUE, alpha=0.6, option='B') +
      theme_ipsum() +
      labs(
        x = 'Category',
        y = paste('Total Time Spent in', input$time),
        title = 'Distribution of Time Spent by Category'
      ) +
      theme(legend.position = 'none')
    # scale_x_date(date_breaks='1 day', date_labels = '%a %b %d')
    
    ggplotly(p)
  })
  
  ###################################################
  #### plot 4: productivity next day after I sleep
  ###################################################
  
  output$sleepProductivity <- renderPlotly({
    # conditions to validate
    validate(
      need('Sleep' %in% input$cat, "We're measuring productivity after you sleep.
           Make sure you have selected 'Sleep' as one of your categories!"),
      need(length(input$cat) > 1, "There isn't enough categories to make a scatterplot.
           Add at least one more category."),
      need(input$dateRange[1] >= lowerBound & input$dateRange[2] <= upperBound, 
           "Invalid date range.\n\nDates must be in between 2020-04-08 and 2020-04-21.")
    )
    
    #print(unique(final_data$description))
    #print(str(final_data))
    max <- length(names(spread_data()))
    
    final_data <- spread_data() %>%
      select(date, Sleep)
    
    final_data$total <- spread_data() %>%
      select(-date, -Sleep) %>%
      imputeTS::na.replace(0) %>%
      rowSums()
    
    print(head(final_data))
    
    # rends the plot
    p <- ggplot(final_data, aes(x=Sleep, y=total)) +
      geom_jitter() +
      geom_smooth() +
      labs(
        x = paste0('Sleep (', input$time, ")"),
        y = paste0('Activities during the Day (', input$time, ")"),
        title = 'Sleep vs Tasks Performed in Particular Category(s)'
      ) +
      theme_ipsum()
    
    ggplotly(p)
  })
  
  output$stats <- renderPlot({
    # print(head(spread_data()))
    # generates correlation matrix
    res <- cor(spread_data() %>% select(-date) %>% imputeTS::na.replace(0))
    
    # displays correlation matrix
    p <- ggcorrplot(res, method = 'circle', type = 'full', title = "Correlation Matrix for Variables")
    
    p
  })
  
  output$classStream <- renderStreamgraph({
    validate(
      need(input$dateRange[1] >= lowerBound & input$dateRange[2] <= upperBound, 
           "Invalid date range.\n\nDates must be in between 2020-04-08 and 2020-04-21."),
      need(length(input$cat) == 1 & 'School' %in% input$cat, "Make sure School is the only category selected.")
    )
    
    # formats data
    final_data <- formatted_data() %>%
      group_by_('class', 'date') %>%
      select(starts_with('length_')) %>%
      summarise_all(funs('total'=sum))
    
    # creates streamgraph, labels x axis w 1 day intervals
    pp <- streamgraph(final_data, key="class", value="total", date="date", interpolate='cardinal', 
                      order='inside-out') %>%
      sg_fill_brewer('Pastel2') %>%
      sg_axis_x(1, tick_interval='day', tick_format = '%a %b %d')
  })
  
  output$catStream <- renderStreamgraph({
    validate(
      need(input$dateRange[1] >= lowerBound & input$dateRange[2] <= upperBound, 
           "Invalid date range.\n\nDates must be in between 2020-04-08 and 2020-04-21."),
      need(length(input$cat) > 0, "Make sure that at least one category is selected.")
    )
    
    # formats data
    final_data <- formatted_data() %>%
      group_by_('description', 'date') %>%
      select(starts_with('length_')) %>%
      summarise_all(funs('total'=sum))
    
    # creates streamgraph, labels x axis w 1 day intervals
    pp <- streamgraph(final_data, key="description", value="total", date="date", interpolate='cardinal', 
                      order='inside-out') %>%
      sg_fill_brewer('Pastel2') %>%
      sg_axis_x(1, tick_interval='day', tick_format = '%a %b %d')
  })
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)

