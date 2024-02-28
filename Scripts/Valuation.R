
# Libraries ---------------------------------------------------------------

library(tidyverse)
library(readxl) 
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
