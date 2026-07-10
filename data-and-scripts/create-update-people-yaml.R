#creating people.yml for people.qmd to use. basically we have the google sheet
#which has relevant information and we have the google drive which has the
#associated headshots. The .qmd uses YAML to put everything together, so lets
#make yaml documents that contains the headshots and info of the people

#whenever the sheet or headshots get updatated just rerun this whole script


library(yaml)
library(tidyverse)
library(googledrive)
library(googlesheets4)

#add in headshots to repo

#get filenames in folder
files <- drive_ls(path = "https://drive.google.com/drive/folders/142uzq6myiLz_6QY_JGt5LKjkz4_KeVTz")

for (i in 1:nrow(files)) {
drive_download(overwrite = TRUE,
  file = files$id[i],
  path = paste0("img/headshots/" , files$name[i]))
}
  


#I WISH THAT i had known this beforehand, but the names in the yamls need to be
#exactly "title" "path" subtitle" and "image" for it to work

current <- read_sheet(
  ss = "https://docs.google.com/spreadsheets/d/1p4d0mhtqWc9HJQJQqUMVdAtjllwz1uKYFLjmbRqjUMk/edit?usp=sharing",
  sheet = 2, .name_repair = "universal") |> 
  lapply(as.character) |>
  as.data.frame() |> 
  #drop_na(exact_filename_of_headshot_including_filetype_extension) |> 
  mutate(exact_filename_of_headshot_including_filetype_extension = paste0("/img/headshots/",exact_filename_of_headshot_including_filetype_extension),
         title = paste0(first, " ", last),
         graduation_year = ifelse(
           is.na(graduation_year),NA,
           paste0("'", str_extract(graduation_year, pattern = "..(..)", group = 1))),
         PEPPER_start_year = as.integer(PEPPER_start_year),
         link_to_share_ie_linkedIn = paste0("https://",link_to_share_ie_linkedIn))|> 
  mutate(subtitle = if_else(is.na(abrev), "",paste0(abrev, " ", graduation_year,"<br>", major)), 
         image = exact_filename_of_headshot_including_filetype_extension, 
         path = link_to_share_ie_linkedIn,
         description = major,
         across(school:major, ~ replace_na(.x, "&nbsp;")))

  write_csv(current, file = "data-and-scripts/people-current.csv")

alum <-  read_sheet(ss = "https://docs.google.com/spreadsheets/d/1p4d0mhtqWc9HJQJQqUMVdAtjllwz1uKYFLjmbRqjUMk/edit?usp=sharing",
                    sheet = 3,
                    .name_repair = "universal") |>
  lapply(as.character) |>
  as.data.frame() |>
  #drop_na(exact_filename_of_headshot_including_filetype_extension) |>
  mutate(
    exact_filename_of_headshot_including_filetype_extension = paste0(
      "/img/headshots/",
      exact_filename_of_headshot_including_filetype_extension
    ),
    title = paste0(first, " ", last),
    graduation_year = ifelse(is.na(graduation_year), "", paste0(
      "'", str_extract(graduation_year, pattern = "..(..)", group = 1)
    )),
    PEPPER_start_year = as.integer(PEPPER_start_year),
    link_to_share_ie_linkedIn = paste0("https://",link_to_share_ie_linkedIn)
  ) |>
  mutate(subtitle = paste0(abrev, " ", graduation_year),
         image = exact_filename_of_headshot_including_filetype_extension,
         path = link_to_share_ie_linkedIn,
         description = major) 
  

write_csv(alum, file = "data-and-scripts//people-alum.csv")

# Make individual YAML's for current people
for (i in 1:nrow(current)) {
  print(i)
  text <- as.yaml(x = current[i ,])
  write_lines(x = c("---",text), file = paste0("data-and-scripts//people/current/", current$first[i],"-",current$last[i], ".yml" ))}

# Make individual YAML's for alumns
for (i in 1:nrow(alum)) {
  print(i)
  text <- as.yaml(x = alum[i ,])
  write_lines(x = c("---",text), file = paste0("data-and-scripts//people/alum/", alum$first[i],"-",alum$last[i], ".yml" ))
}

