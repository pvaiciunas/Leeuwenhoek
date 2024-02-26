FetchDates <- function(json_file, statement, annual = TRUE) {
  # Fetches all available financial filing dates from a statement
  # 
  # args:
  #   json_file - input file
  #   statement - one of "Balance_Sheet", "Cash_Flow", "Income_Statement". These
  #               are names found in the JSON file.
  #   annual    - TRUE for annual, FALSE for quarterly
  
  if(annual) {
    dates <- json_file$Financials[[statement]]yearly |> names()  
  } else {
    dates <- json_file$Financials[[statement]]quarterly |> names()  
  }
  
  return(dates)
}

FetchFinancialData <- function(json_file, file_date, statement, line_item, annual = TRUE) {
  # Fetches financial statement line item for a specific date.
  # Defaults to annual data, but can be switched to quarterly if annual==FALSE
  # 
  # args:
  #   json_file - input file
  #   file_date - date of filing in "yyyy-mm-dd" format
  #   statement - one of "Balance_Sheet", "Cash_Flow", "Income_Statement". These
  #               are names found in the JSON file.
  #   line_item - name of line item. also something found in the JSON file
  #   annual    - TRUE for annual, FALSE for quarterly
  #   
  #   To lookup line items, use:
  #   json_file$Financials[[statement]]$quarterly[[file_date]] |> names()
     
  
  
  if(annual) {
    # retrieve annual line item
    fin_data <- json_file$Financials[[statement]]$yearly[[file_date]][[line_item]]

  } else {
    # retrieve quarterly line item
    fin_data <- json_file$Financials[[statement]]$quarterly[[file_date]][[line_item]]
    
  }
  
  return(as.numeric(fin_data))
}



Current Operating Income =
  Current Interest Expense =
  Current Capital Spending
Current Depreciation & Amort'n =
Effective tax rate (for use on operating income)
Marginal tax rate (for use on cost of debt)
Current Revenues =
Current Non-cash Working Capital =
Chg. Working Capital =
Book Value of Debt =
Book Value of Equity =



