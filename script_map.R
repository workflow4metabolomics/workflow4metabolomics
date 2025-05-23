# Script pour generer la carte des labos et personnes de W4M
library(sf)
library(openxlsx)
library(mapview)
library(sfheaders)
library(leaflet)
library(leafpop)
library(leafem)

setwd("./LABERCA/W4M/workflow4metabolomics/")
logo <- "https://avatars.githubusercontent.com/u/17082156?s=200&v=4"
people <- read.xlsx("./people_location.xlsx")
people$lon <- as.double(people$lon)
people$lat <- as.double(people$lat)
labs <- read.xlsx("./lab_location.xlsx")
labs$lon <- as.double(labs$lon)
labs$lat <- as.double(labs$lat)

map_people <- st_as_sf(people, coords = c("lon","lat"), crs = 4326)
map_labs <- sf_polygon(labs, x = "lon", y = "lat", polygon_id = "lab")

# mapview(list(map_people, map_labs), layer.name = c("People", "Laboratories"),
#         popup = popupTable(map_people, zcol = c("people", "lab", "city")),
#         alpha.regions = 0.2, alpha = 1) %>% 
#   leafem::addLogo(logo, url = "https://jsaintvanne.github.io/workflow4metabolomics/") %>%
#   addMarkers(~lon, ~lat)
#popup = popupImage(img, src = "remote")) 

leaflet(data = people) %>% addTiles() %>% leafem::addLogo(logo, url = "https://jsaintvanne.github.io/workflow4metabolomics/") %>%
  addMarkers(~lon, ~lat, popup = paste0(people$people,"<hr>","text1<br>LAlala:", people$city))# %>% addPolygons(map_labs)
