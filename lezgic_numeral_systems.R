library(tidyverse)
library(lingtypology)

setwd("D:/Учёба/Дагестанские карты/numeral bases/lezgic")
data <- read_delim("lezgic 2.0.csv", delim = ",")

data <- data[(data$map == "yes"),]

system_colors <- c("orchid4", "white", "darkgrey", "black")
irregu_colors <- c("darkgrey", "black", "white")

lang_colors <- c(
  "Aghul"="lightpink1",
  "Archi"="mediumorchid1",
  "Budukh"="olivedrab2",
  "Kryz"="limegreen",
  "Lezgian"="red3",
  "Rutul"="deepskyblue",
  "Tabasaran"="tomato",
  "Tsakhur"="dodgerblue3",
  "Udi"="yellow2"
)

#data |> 
#  count(lang, color)

data$color = as.character(lang_colors[data$lang])


# WIDTH  = 500
# HEIGHT = 400



# LEZGIC LANGUAGES

map.feature(
  languages = data$lang,
  label = data$lang,
  features = data$lang,
  title = data$value1_name[0],
  popup = data$idiom,
  latitude = data$latitude,
  longitude = data$longitude,
  color = lang_colors,
  width = 9,
  stroke.color = "black",
  stroke.features = c(1),
  stroke.legend = FALSE
)



# LEZGIC LANGUAGES AND SYSTEMS

map.feature(
  languages = data$lang,
  label = data$lang,
  features = data$lang,
  title = data$value1_name[0],
  popup = data$idiom,
  latitude = data$latitude,
  longitude = data$longitude,
  color = lang_colors,
  stroke.features = data$value1,
  stroke.color = system_colors,
  width = 6,
  line.lng = c(48.084, 47.603, 47.449, 47.545, 47.481, 47.503, 47.335),
  line.lat = c(41.828, 41.809, 41.752, 41.606, 41.530, 41.229, 41.163),
  line.width = 5,
  line.color="black"
)



# EAST LEZGIC LANGUAGES AND (IR)REGULARITY OF THE DERIVATION OF ‘40’

irregu_data <- data[!(is.na(data$value2)), ]

map.feature(
  languages = irregu_data$lang,
  label = irregu_data$lang,
  features = irregu_data$lang,
  title = irregu_data$value2_name[0],
  popup = irregu_data$idiom,
  latitude = irregu_data$latitude,
  longitude = irregu_data$longitude,
  color = c(
    "Aghul"="lightpink1",
    "Lezgian"="red3",
    "Tabasaran"="tomato"
  ),
  stroke.features = irregu_data$value2,
  stroke.color = irregu_colors,
  width = 6,
  line.lng = c(48.084, 47.603, 47.449, 47.545, 47.481, 47.503, 47.335),
  line.lat = c(41.828, 41.809, 41.752, 41.606, 41.530, 41.229, 41.163),
  line.width = 5,
  line.color="black"
)

# AGUL DIALECTS

agul_data <- data[(data$lang == "Aghul"),]

agul_colors <- c(
  "Central"="lightpink1",
  "Fite"="limegreen",
  "Keren"="red3",
  "Kurag"="deepskyblue",
  "Qushan"="mediumorchid1",
  "Tsirkhe"="yellow2"
)

map.feature(
  languages = agul_data$lang,
  label = agul_data$dialect,
  features = agul_data$dialect,
  title = agul_data$value1_name[0],
  popup = agul_data$idiom,
  latitude = agul_data$latitude,
  longitude = agul_data$longitude,
  color = agul_colors,
  stroke.features = agul_data$value1,
  stroke.color = system_colors,
  width = 6
)

