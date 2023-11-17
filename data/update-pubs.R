library(dplyr)
library(readr)

#publications <- 
tibble(
  status = character(),
  type_of_publication = character(),
  year = integer(),
  title = character(),
  authors = character(),
  item_info = character(),
  url_text = character(),
  url_code = character(),
  url_slides = character(),
  url_youtube = character()
) |> 
  add_row(
    status = "Published",
    type_of_publication = "Article",
    year = 2023,
    title = "Predicting spring phenology in deciduous broadleaf forests: NEON phenology forecasting community challenge.",
    authors = "Wheeler, K., M. Dietze, D. LeBauer, J. Peters, A.D. Richardson, Q. Thomas, K. Zhu, U. Bhat, S. Munch, R.F. Buzbee, M. Chen, B. Goldstein, J.S. Guo, D. Hao, C. Jones, M. Kelly-Fair, H. Liu, C. Malmborg, N. Neupane, D. Pal, A.A. Ross, V. Shirey, Y. Song, M. Steen, E.A. Vance, W. Woelmer, J. Wynne, L. Zachmann.",
    item_info = "Agricultural and Forest Meteorology.",
    url_text = "https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4542703"
    # url_code = character(),
    # url_slides = character(),
    # url_youtube = character()
  ) |> 
  add_row(
    status = "Published",
    type_of_publication = "Article",
    year = 2023,
    title = "Use of biological feedback as a health behavior change technique in adults: scoping review.",
    authors = "Richardson, K.M., M.R. Jospe, A.A. Saleh, T.N. Clarke, A.R. Bedoya, N. Behrens, K.M.K. Marano, L. Cigan, Y. Liao, E.R. Scott, J.S. Guo, A. Aguinaga, S.M. Schembre.",
    item_info = "Journal of Medical Internet Research.",
    url_text = "https://doi.org/10.2196/44359"
    # url_code = character(),
    # url_slides = character(),
    # url_youtube = character()
  ) |> 
  add_row(
    status = "Published",
    type_of_publication = "Article",
    year = 2023,
    title = "The importance of monsoon precipitation for foundation tree species across the semiarid Southwestern U.S.",
    authors = "Samuels-Crow, K.E., D.M. Peltier, Y. Liu, J.S. Guo, J.M. Welker, W.R.L. Anderegg, G.W. Koch, C. Schwalm, M. Litvak, J.D. Shaw, K. Ogle.",
    item_info = "Frontiers in Forests and Global Change.",
    url_text = "https://doi.org/10.3389/ffgc.2023.1116786"
    # url_code = character(),
    # url_slides = character(),
    # url_youtube = character()
  ) |> 
  add_row(
    status = "Published",
    type_of_publication = "Article",
    year = 2023,
    title = "Pre-fire grazing and herbicide treatments can affect post-fire vegetation in a Great Basin rangeland.",
    authors = "Gornish, E.S., J.S. Guo, L.M. Porensky, B.L. Perryman, E.A. Leger.",
    item_info = "Ecological Solutions and Evidence.",
    url_text = "https://doi.org/10.1002/2688-8319.12215"
    # url_code = character(),
    # url_slides = character(),
    # url_youtube = character()
  ) |> 
  add_row(
    status = "Published",
    type_of_publication = "Article",
    year = 2023,
    title = "Quantifying the drivers of ecosystem fluxes and water potential across the soil-plant-atmosphere continuum in an arid woodland.",
    authors = "Kannenberg, S.A., M.L. Barnes, D.R. Bowling, A.W. Driscoll, J.S. Guo, W.R.L. Anderegg.",
    item_info = "Agriculture and Forest Meteorology.",
    url_text = "https://doi.org/10.1016/j.agrformet.2022.109269"
    # url_code = character(),
    # url_slides = character(),
    # url_youtube = character()
  ) |> 
  add_row(
    status = "Published",
    type_of_publication = "Article",
    year = 2022,
    title = "Contemporary tree growth shows altered climate memory.",
    authors = "Peltier, D.M.P., W.R.L. Anderegg, J.S. Guo, K. Ogle.",
    item_info = "Ecology Letters.",
    url_text = "https://doi.org/10.1111/ele.14130"
    # url_code = character(),
    # url_slides = character(),
    # url_youtube = character()
  ) |> 
  add_row(
    status = "Published",
    type_of_publication = "Article",
    year = 2022,
    title = "Temporal variation in stomatal sensitivity to vapor pressure deficit in western riparian forests.",
    authors = "Guo, J.S., S.E. Bush, K.R. Hultine.",
    item_info = "Functional Ecology.",
    url_text = "https://doi.org/10.1111/1365-2435.14066"
    # url_code = character(),
    # url_slides = character(),
    # url_youtube = character()
  ) |> 
  add_row(
    status = "Published",
    type_of_publication = "Article",
    year = 2022,
    title = "A 3-D groundwater isoscape of the contiguous USA for forensic and water resource science.",
    authors = "Bowen, G.J., J.S. Guo, S.T. Allen.",
    item_info = "PLOS One.",
    url_text = "https://doi.org/10.1371/journal.pone.0261651",
    # url_code = character(),
    # url_slides = character(),
    # url_youtube = character()
  ) |> 
  add_row(
    status = "Published",
    type_of_publication = "Article",
    year = 2022,
    title = "Opportunities, challenges, and pitfalls in characterizing plant water-use strategies.",
    authors = "Kannenberg, S., J.S. Guo, K. Novick, W. Anderegg, X. Feng, D. Kennedy, A. Konings, J. Martínez-Vilalta, A. Matheny.",
    item_info = "Functional Ecology.",
    url_text = "https://doi.org/10.1111/1365-2435.13945"
    # url_code = character(),
    # url_slides = character(),
    # url_youtube = character()
  ) |>
  add_row(
    status = "Published",
    type_of_publication = "Article",
    year = 2022,
    title = "Temperature memory and NSC mediate legacies of a hot drought in trees across the southwestern US.",
    authors = "Peltier, D.M.P., J.S. Guo, P. Nguyen, M. Bangs, L. Gear, M. Wilson, S. Jefferys, K. Samuel-Crow, L.L. Yocom, Y. Liu, M.K. Fell, D. Auty, C. Schwalm, W.R.L. Anderegg, G.W. Koch, M.E. Litvack, K. Ogle.",
    item_info = "Tree Physiology.",
    url_text = "https://doi.org/10.1093/treephys/tpab091"
    # url_code = character(),
    # url_slides = character(),
    # url_youtube = character()
  ) |> 

  add_row(
    status = "Published",
    type_of_publication = "Article",
    year = 2021,
    title = "Harnessing the NEON data revolution to advance open environmental science with a diverse and data‐capable community.",
    authors = "Nagy, R.C., J.K. Balch, [...] J.S. Guo [...].",
    item_info = "Ecosphere.",
    url_text = "https://doi.org/10.1002/ecs2.3833"
    # url_code = character(),
    # url_slides = character(),
    # url_youtube = character()
  ) |> 
  add_row(
    status = "Published",
    type_of_publication = "Article",
    year = 2021,
    title = "Adaptive versus non-adaptive responses to drought in a non-native riparian tree/shrub, Tamarix spp.",
    authors = "Bush, S.E., J.S. Guo, D. Dehn, K. Grady, J. Hull, E. Johnson, D. Koepke, R. Long, D. Potts, K. Hultine.",
    item_info = "Agricultural and Forest Meteorology.",
    url_text = "https://doi.org/10.1016/j.agrformet.2021.108342"
    #url_code = character(),
    # url_slides = character(),
    # url_youtube = character()
  ) |> 
  add_row(
    status = "Published",
    type_of_publication = "Article",
    year = 2021,
    title = "Calibration strategies for detecting macroscale patterns in NEON atmospheric carbon isotope observations.",
    authors = "Fiorella, R.P., S.P. Good, S.T. Allen, J.S. Guo, C.J. Still, D.C. Noone, W.R.L. Anderegg, C.R. Florian, H. Luo, N. Pingintha-Durden, G.J. Bowen",
    item_info = "Journal of Geophysical Research – Biogeosciences",
    url_text = "https://doi.org/10.1029/2020JG005862"
    #url_code = character(),
    # url_slides = character(),
    # url_youtube = character()
  ) |> 
  add_row(
    status = "Published",
    type_of_publication = "Article",
    year = 2021,
    title = "Temporal controls on crown nonstructural carbohydrates in southwestern US tree species.",
    authors = "Peltier, D.M.P., J.S. Guo, P. Nguyen, M. Bangs, L. Gear, M. Wilson, S. Jefferys, K. Samuel-Crow, L.L. Yocom, Y. Liu, M.K. Fell, D. Auty, C. Schwalm, W.R.L. Anderegg, G.W. Koch, M.E. Litvack, K. Ogle.",
    item_info = "Tree Physiology.",
    url_text = "https://doi.org/10.1093/treephys/tpaa149"
    #url_code = character(),
    # url_slides = character(),
    # url_youtube = character()
  ) |> 
  add_row(
    status = "Published",
    type_of_publication = "Article",
    year = 2021,
    title = "On-farm land management strategies and production challenges in United States organic agricultural systems.",
    authors = "Mpanga, I.K., R. Tronstad, J.S. Guo, D. LeBauer, J. Idowu.",
    item_info = "Current Research in Environmental Sustainability.",
    url_text = "https://doi.org/10.1016/j.crsust.2021.100097"
    # url_code = character(),
    # url_slides = character(),
    # url_youtube = character()
  ) |> 
  add_row(
    status = "Published",
    type_of_publication = "Article",
    year = 2020,
    title = "Non‐structural carbohydrate dynamics associated with antecedent stem water potential and air temperature in a dominant desert shrub.",
    authors = "Guo, J.S., L. Gear, K.R. Hultine, G.W. Koch, K. Ogle.",
    item_info = "Plant, Cell & Environment",
    url_text = "https://doi.org/10.1111/pce.13749"
    # url_code = character(),
    # url_slides = character(),
    # url_youtube = character()
  ) |> 
  add_row(
    status = "Published",
    type_of_publication = "Article",
    year = 2020,
    title = "Temporal shifts in iso/anisohydry revealed from daily observations of plant water potential in a dominant desert shrub.",
    authors = "Guo, J.S., K.R. Hultine, G.W. Koch, H. Kropp, K. Ogle.",
    item_info = "New Phytologist.",
    url_text = "https://doi.org/10.1111/nph.16196"
    # url_code = character(),
    # url_slides = character(),
    # url_youtube = character()
  ) |> 
  add_row(
    status = "Published",
    type_of_publication = "Article",
    year = 2019,
    title = "Should we be concerned about multiple comparisons in hierarchical Bayesian models?",
    authors = "Ogle, K., D.M.P. Peltier, M.K. Fell, J.S. Guo, H. Kropp, J.J. Barber.",
    item_info = "Methods in Ecology and Evolution.",
    url_text = "https://doi.org/10.1111/2041-210X.13139"
    # url_code = character(),
    # url_slides = character(),
    # url_youtube = character()
  ) |> 
  add_row(
    status = "Published",
    type_of_publication = "Article",
    year = 2019,
    title = "Antecedent soil water content and vapor pressure deficit interactively control water potential in Larrea tridentata.",
    authors = "Guo, J.S. and K. Ogle.",
    item_info = "New Phytologist",
    url_text = "https://doi.org/10.1111/nph.15374"
    # url_code = character(),
    # url_slides = character(),
    # url_youtube = character()
  ) |> 
  add_row(
    status = "Published",
    type_of_publication = "Article",
    year = 2018,
    title = "Water source niche overlap increases with site moisture availability in woody perennials.",
    authors = "Guo, J.S., B.A. Hungate, T.E. Kolb, G.W. Koch.",
    item_info = "Plant Ecology.",
    url_text = "https://doi.org/10.1007/s11258-018-0829-z"
    # url_code = character(),
    # url_slides = character(),
    # url_youtube = character()
  ) |> 
  
  
  write_csv("data/academic_dataset.csv")

