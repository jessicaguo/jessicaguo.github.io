#update pubs using web of science API
library(tidyverse)
library(httr2)
library(jsonlite)



token <- Sys.getenv("API_TOKEN")

baseURL <- "https://api.clarivate.com/apis/wos-starter/v1/"

#here is info about the api https://developer.clarivate.com/apis/wos-starter
author_id <- "QPB-2439-2026"


#still modifying this, but it uses a combination of AU (author) and AI (author
#identifier) to get all j s guo results
response <- request(baseURL)|> 
  req_headers("X-ApiKey" = token,"Accept" = "application/json") |>
  req_url_path_append("documents") |>
  req_url_query(q = paste0("AU=", author_id, " OR AI=", author_id),
                limit = 50) |>
  # req_dry_run()
  req_perform()|> 
  resp_body_json(simplifyVector = TRUE)


responseDF <- response[[2]] |> 
  unnest(cols = everything() ) |> 
  unnest(cols = pages , names_sep = "") |> 
  rename_with(~ str_replace_all(., "\\$", replacement = "_")) |> 
  mutate(sourceTitle = str_to_title(sourceTitle) |> 
           tools::toTitleCase(), # Lowercases minor words
         publishMonth = str_to_title(publishMonth),
         authorsList = map(authors, "wosStandard"),
         authorsList = map_chr(authorsList, ~ str_c(.x, collapse = "; ")),
         link = paste0("https://doi.org/", doi),
         title = str_remove_all(title, "<[^<>]*>|&lt;[^&;]*&gt;")  #removes html whatevers from titles
          )


write_csv(responseDF, "data-and-scripts/api_authorship.csv")
