#update pubs using web of science API

library(tidyverse)
library(httr2)
library(jsonlite)
library(readxl)
library(fuzzyjoin)
library(countrycode)
library(openxlsx)




token <- Sys.getenv("API_TOKEN")

baseURL <- "https://api.clarivate.com/apis/wos-starter/v2"

token <- Sys.getenv("API_TOKEN")

#still modifying this
allAPI <- request(baseURL)|> 
  req_headers("Authorization" = paste("X-ApiKey", token, sep = " "),"Accept" = "application/json") |>
  req_url_path("api/database/") |>
  #req_url_query(label = "gef") |>
  #req_dry_run()
  req_perform()|> 
  resp_body_json(simplifyVector = TRUE)