
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


