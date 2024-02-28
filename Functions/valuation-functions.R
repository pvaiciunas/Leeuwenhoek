
CapitalizeRandD <- function() {}

ConvertOpLeases <- function() {}

NormalizeOpInc <- function() {
  # Need to find industry average
  # Currently taking from Damodaran, but this needs data cleaning for 
  # industry names etc
  url <- "https://pages.stern.nyu.edu/~adamodar/pc/fcffginzu.xlsx"
  download.file(url, method = "curl", dest= "Data/fcffginzu.xlsx")
  ind_avg <- read_excel("Data/fcffginzu.xlsx", sheet= "US Industry averages")  
  
}

ValueFCFF <- function() {
  
  # Based on fcffginzu.xlsx
 
  currentRev <- FetchFinancialData(AAPL, "2023-12-31", "Income_Statement", "totalRevenue", FALSE)
   
}

# script verison of function above for testing


# Data Needs
# 
# Current Interest Expense =
# Current Capital Spending
# Current Depreciation & Amort'n =
# Effective tax rate (for use on operating income)
# Marginal tax rate (for use on cost of debt)
# Current Revenues =
# Current Non-cash Working Capital =
# Chg. Working Capital =
# Book Value of Debt =
# Book Value of Equity =

