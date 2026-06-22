#creating people.yml for people.qmd to use. basically we have the google sheet
#which has relevant information and we have the google drive which has the
#associated headshots. The .qmd uses YAML to put everything together, and one
#.yml can have multiple documents inside it, so lets create a yaml document that
#contains the headshots and info of the people

#whenever the sheet or headshots get updatated just rerun this whole script


library(yaml)
library(tidyverse)
library(googledrive)
library(googlesheets4)

#add in headshots to repo

#get filenames in folder
files <- drive_ls(path = "https://drive.google.com/drive/folders/142uzq6myiLz_6QY_JGt5LKjkz4_KeVTz?usp=share_link")

for (i in 1:nrow(files)) {
drive_download(overwrite = TRUE,
  file = files$id[i],
  path = paste0("img/headshots/" , files$name[i]))
}
  


#I WISH THAT i had known this beforehand, but the names in yaml need to be
#exactly "title" "subtitle" and "image" for it to work

current <- read_sheet(
  ss = "https://docs.google.com/spreadsheets/d/1p4d0mhtqWc9HJQJQqUMVdAtjllwz1uKYFLjmbRqjUMk/edit?usp=sharing",
  sheet = 2, .name_repair = "universal") |> 
  lapply(as.character) |>
  as.data.frame() |> 
  #drop_na(exact_filename_of_headshot_including_filetype_extension) |> 
  mutate(exact_filename_of_headshot_including_filetype_extension = paste0("/img/headshots/",exact_filename_of_headshot_including_filetype_extension),
         title = paste0(first, " ", last),
         graduation_year = paste0("'", str_extract(graduation_year, pattern = "..(..)", group = 1)),
         PEPPER_start_year = as.integer(PEPPER_start_year))|> 
  rename(subtitle = graduation_year, image = exact_filename_of_headshot_including_filetype_extension)

write_csv(current, file = "data/people-current.csv")

alum <-  read_sheet(
  ss = "https://docs.google.com/spreadsheets/d/1p4d0mhtqWc9HJQJQqUMVdAtjllwz1uKYFLjmbRqjUMk/edit?usp=sharing",
  sheet = 3, .name_repair = "universal")|> 
  lapply(as.character) |>
  as.data.frame()|> 
  #drop_na(exact_filename_of_headshot_including_filetype_extension) |> 
  mutate(exact_filename_of_headshot_including_filetype_extension = paste0("/img/headshots/",exact_filename_of_headshot_including_filetype_extension),
         title = paste0(first, " ", last),
         graduation_year = paste0("'", str_extract(graduation_year, pattern = "..(..)", group = 1)),
         PEPPER_start_year = as.integer(PEPPER_start_year)) |> 
  rename(subtitle = graduation_year, image = exact_filename_of_headshot_including_filetype_extension)


write_csv(alum, file = "data/people-alum.csv")


for (i in 1:nrow(current)) {
  print(i)
  text <- as.yaml(x = current[i ,])
  write_lines(x = c("---",text), file = paste0("data/people/current/", current$first[i],"-",current$last[i], ".yml" ))}

for (i in 1:nrow(alum)) {
  print(i)
  text <- as.yaml(x = alum[i ,])
  write_lines(x = c("---",text), file = paste0("data/people/alum/", alum$first[i],"-",alum$last[i], ".yml" ))
}

