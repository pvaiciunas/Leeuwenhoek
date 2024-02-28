
# Sample Data -------------------------------------------------------------

library(httr)
library(jsonlite)
library(tidyjson)


# Download data


url <- 'https://eodhd.com/api/fundamentals/AAPL.US?api_token=demo&fmt=json'
response <- GET(url)

if (http_type(response) == "application/json") {
  content <- content(response, "text", encoding = "UTF-8")
  #cat(content)
}

AAPL <- fromJSON(content)
AAPL$Financials$Income_Statement$quarterly$'2023-12-31' |> names()



# Financial Data ----------------------------------------------------------



FetchDates <- function(json_file, statement, file_freq = "yearly") {
  # Fetches all available financial filing dates from a statement
  # 
  # args:
  #   json_file - input file
  #   statement - one of "Balance_Sheet", "Cash_Flow", "Income_Statement". These
  #               are names found in the JSON file.
  #   file_freq - "yearly" or "quarterly"
  
  dates <- json_file$Financials[[statement]][[file_freq]] |> names()  

  return(dates)
}

FetchFinancialData <- function(json_file, file_date, statement, line_item, file_freq = "yearly", periods = 1) {
  # Fetches financial statement line item for a specific date.
  # Defaults to annual data, but can be switched to quarterly if annual==FALSE
  # 
  # args:
  #   json_file - input file
  #   file_date - date of filing in "yyyy-mm-dd" format
  #   statement - one of "Balance_Sheet", "Cash_Flow", "Income_Statement". These
  #               are names found in the JSON file.
  #   line_item - name of line item. also something found in the JSON file
  #   file_freq - one of 'yearly', 'quarterly'
  #   periods   - number of periods to return before file_date inclusive
  #   
  #   To lookup line items, use:
  #   json_file$Financials[[statement]]$quarterly[[file_date]] |> names()
     
  
  # Retrieve the vector of dates we want date for 
  all_dates <- FetchDates(json_file, statement, file_freq)
  date_idx <- which(all_dates == file_date)
  fin_dates <- all_dates[date_idx:(date_idx + periods - 1)] 
  
  # Fetch the fundamental date for each date
  fin_data <- []
  for(dates in fin_dates) {
    fin_data <- json_file$Financials[[statement]][[file_freq]][[file_date]][[line_item]]
  }
  
  return(as.numeric(fin_data))
}





# External DAta -----------------------------------------------------------

FetchIndAvgs <- function() {
  
  # Currently taking from Damodaran's excel sheet, but this needs data cleaning
  # for industry names etc. Will want to find more stable source or calc
  # directly
  # 
  url <- "https://pages.stern.nyu.edu/~adamodar/pc/fcffginzu.xlsx"
  download.file(url, method = "curl", dest= "Data/fcffginzu.xlsx")
  ind_avg <- read_excel("Data/fcffginzu.xlsx", sheet= "US Industry averages")  
} 






