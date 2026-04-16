#| eval: false
## code to prepare `DATASET` dataset goes here
url <- "https://www.kaggle.com/datasets/rhythmghai/netflix-user-watching-behavior-dataset"
netflix <- read.csv("data/netflix_user_behavior_dataset.csv")

netflix <- netflix[1:100, ]
usethis::use_data(netflix, overwrite = TRUE)


