# Mapas com Leaflet

#install.packages("dplyr")
library(dplyr)
#install.packages("ggplot2")
library(ggplot2)
#install.packages("rjson")
library(rjson)
#install.packages("jsonlite", dependencies = T)
library(jsonlite)
#install.packages("leaflet",dependencies = T)
library(leaflet)
#install.packages("RCurl")
library(RCurl)

# https://rstudio.github.io/leaflet/
r = "oi"
 
r %>% print()

leaflet() %>% addTiles()

leaflet() %>% addTiles() %>% addProviderTiles(providers$MtbMap) %>% 
  addProviderTiles(providers$Stamen.TonerLines, 
                   options = providerTileOptions(opacity = 0.50)) %>% 
  addProviderTiles(providers$Stamen.TonerLabels, 
                   options = providerTileOptions(opacity = 0.90))

lat = -31.333019
long = -54.100074

leaflet() %>% addTiles() %>% addMarkers(long,lat)

leaflet() %>% addTiles() %>% addCircleMarkers(long,lat)

#Diversos Pontos No Mapa

p <- pontosMapa
rm(pontosMapa)
leaflet() %>% addTiles() %>% addMarkers(p$long,p$lat)

class(p$lat)

p$lat <- as.numeric(p$lat)
p$long <- as.numeric(p$long)

leaflet() %>% addTiles() %>% addMarkers(p$long,p$lat)

leaflet() %>% addTiles() %>% addMarkers(p$long,p$lat, popup = p$ponto)

leaflet() %>% addTiles() %>% addCircleMarkers(p$long,p$lat)


###Mudando as cores dos marcadores

#p = pontosMapa
#class(p$long)

#p$lat = as.numeric(p$lat)
#p$long = as.numeric(p$long)

cor = c()
nrow(p)

for(i in 1 : nrow(p)){
  
  if(p$tipo[i] == 1){
    cor[i] = "green"
  }else if(p$tipo[i] == 2){
    cor[i] = "red"
  }else if(p$tipo[i] == 3){
    cor[i] = "pink"
  }else{
    cor[i] = "blue"
  }
}
cor

icone <- awesomeIcons(icon = "pin",library = "ion", markerColor = cor)

leaflet() %>% addTiles() %>% addAwesomeMarkers(p$long,p$lat, icon = icone,
                                               popup = p$ponto, label = p$ponto)
#Clusters

icone = awesomeIcons(icon=" ",markerColor = cor)

leaflet() %>% addTiles() %>% addAwesomeMarkers(p$long,p$lat, icon = icone,
                                               popup = p$ponto, label = p$ponto,
                                               clusterOptions = markerClusterOptions())

#Alterando Marcadores Circulares

leaflet()%>% addTiles() %>% addCircleMarkers(p$long,p$lat, color = cor,
                                             label = p$ponto,
                                             stroke = T,
                                             fillOpacity = 0.4,
                                             radius = ifelse(p$tipo == 1, 10, 6))


#Adicionando formas - Círculos
#leaflet()%>% addTiles()

lat = -31.333019
long = -54.100074

leaflet()%>% addTiles() %>% addCircles(long,lat)

pf = populacaoFronteira

class(pf$lat)
class(pf$log)
class(pf$Populacao_estimada)

pf$pop = as.character(pf$Populacao_estimada)

leaflet()%>% addTiles() %>% addCircles(lng = pf$log, lat = pf$lat,
                                       radius = sqrt(pf$Populacao_estimada)*20,
                                       stroke = F,fillOpacity = 0.4,
                                       label = pf$pop)



#Adicionando formas - Retângulos
lat = -31.328593
lng = -54.101329

lat1 = -31.327218
lng1 = -54.100138
leaflet()%>% addTiles() %>% addRectangles(lng,lat,lng1,lat1,
                                          fillOpacity = .5)
