## Aula mapas 1

#install.packages("maps")
library(maps) #mapas simples, eixos, escala, cidades
#install.packages("mapproj")
library(mapproj)

map("world")

par(mar=c(0.5,0.5,0.5,0.5)) # < dar zoom, > tirar zoom
map("world","Brazil")

# state, county - USA

par(mar=c(0.5,0.5,0.5,0.5))
map("state","California")
map("county","California")
map("state",c("california","nevada","texas"))
map("county",c("california","nevada","texas"))

par(mar=c(0.8,0.8,0.8,0.8)) # < dar zoom, > tirar zoom
brazil <- map("world","Brazil")
map.axes(cex.axis = 0.8) #cex.axis = 0.8

abline(h=-31.332487, lty = 2, lwd = 1)
abline(v=-54.072540, lty = 2, lwd = 1)

map.scale(ratio = F, cex = 0.6)
map(,,add = T)
map.scale(x=-47,y=-30, ratio = F, cex = .5)

par(mar=c(0.8,0.8,0.8,0.8))
map("world","Brazil",fill = T, col = "lightgray")
abline(h=-31.332487, lty = 2, lwd = 1)
abline(v=-54.072540, lty = 2, lwd = 1)

map.scale(ratio = F, cex = 0.6)
map(,,add = T)
map.scale(x=-47,y=-30, ratio = F, cex = .5)

map.axes()
abline(h=-31.332952, lty = 2, lwd = 1)
abline(v=-54.099830, lty = 2, lwd = 1)

map("world","Brazil",fill = T, col = "lightgray",xlim = c(-58,-49),
    ylim = c(-35,-27))

map("world", c("Brazil","France"))

par(mar=c(1,1,1,1))
m = map("world","Brazil",fill = T, col = "lightgray", plot = T)
map.grid(m,col = "grey50", font = 1, cex=0.7, pretty = T)
map.grid(m,nx = 5, ny = 5, col = "grey50", font = 1, cex=0.7, pretty = T)


map.cities(country = "Brazil")
par(mar=c(0.8,0.8,0.8,0.8))
map("world","Brazil")
map.cities(country = "Brazil", minpop = 7000000, pch = 20,cex = 1.5)

#install.packages("RgoogleMaps")
library(RgoogleMaps)

center <- c(-31.332952, -54.099830)
zoom <- 5

mapaBage <- GetMap(center = center, zoom = zoom, maptype = "terrain",
                   destfile = "mapa_bage_if.png")

library(ggplot2)
#criando o shape como uma camada no fundo
ggplot()
brazil <- ggplot() + borders("world", regions = "Brazil")
brazil
brazil <- ggplot() + borders("world", regions = "Brazil", fill = "yellow")
brazil
brazil <- ggplot() + borders("world", regions = "Brazil", fill = "green", colour = "black") + coord_equal()
france <- ggplot() + borders("world", regions = "France", fill = "blue", colour = "black") +coord_equal()
brazil
france

