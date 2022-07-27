#2. Mapas com Shapefile + ggplot2

#Malha cartográfica = https://mapas.ibge.gov.br/bases-e-referenciais/bases-cartograficas/malhas-digitais

#Arquivo = http://datasus.saude.gov.br/informacoes-de-saude-tabnet/

#install.packages("ggplot2")
library(ggplot2)
# install.packages("rgdal") # Se der erro, tente rodar antes: sudo apt-get install gdal-bin proj-bin libgdal-dev libproj-dev
library(rgdal)
#install.packages("rgeos")
library(rgeos)
#install.packages("gpclib")
library(gpclib)
#install.packages("maptools")
library(maptools)


rs <- readOGR("/home/rodrigo/Área de Trabalho/RStudio","43MUE250GC_SIR")
head(rs@data)

rs$CD_GEOCMU <- substr(rs$CD_GEOCMU,1,6)

populacao <- read.csv2(file.choose(), header = T, sep = ",")

head(populacao)

populacao <- na.omit(populacao)

names(populacao) <- c("Municipio", "Populacao")

head(rs@data)

populacao$CD_GEOCMU <- substr(populacao$Municipio,1,6)

head(populacao)

dim(populacao)
dim(rs@data)

head(rs@data)

populacao <- populacao[order(populacao$CD_GEOCMU),]
malhaRS <- rs@data[order(rs@data$CD_GEOCMU),]

head(malhaRS)
dim(populacao)
dim(malhaRS)

linhas <- c(1,2)
malhaRS = malhaRS[-linhas,]
dim(populacao)
dim(malhaRS)

#Dica
#malhaRS = subset(malhaRS,CD_GEOCMU!="430000")
head(malhaRS)
head(populacao)

rs2 <- merge(malhaRS,populacao)

head(rs2)

head(rs)

rs.rsf <- fortify(rs, region = "CD_GEOCMU")

head(rs.rsf)

rs.rsf <- subset(rs.rsf,id!="430000")

rs.rsf <- merge(rs.rsf, rs@data, by.x = "id", by.y = "CD_GEOCMU")

rs2$PopulacaoCat <- cut(rs2$Populacao, breaks = c(0,20000,40000,60000,80000,100000,2000000),
                       labels = c('0-20000',
                                  '20000-40000',
                                  '40000-60000',
                                  '60000-80000',
                                  '80000-100000',
                                  '+100000'),
                       include.lowest = T)

head(rs2)

#rm(rs2)
#rm(rs.rsf)

rs.rsf <- merge(rs.rsf, rs2, by.x = "id", by.y = "CD_GEOCMU")

head(rs.rsf)

#names(rs2)[1]=c("id")

#install.packages("RColorBrewer",dependencies = T)
library(RColorBrewer)

ggplot(rs.rsf, aes(rs.rsf$long,rs.rsf$lat, group=rs.rsf$group,fill=rs.rsf$PopulacaoCat))

ggplot(rs.rsf, aes(rs.rsf$long,rs.rsf$lat, group=rs.rsf$group,fill=rs.rsf$PopulacaoCat)) +
  geom_polygon(colour='green')

ggplot(rs.rsf, aes(rs.rsf$long,rs.rsf$lat, group=rs.rsf$group,fill=rs.rsf$PopulacaoCat)) +
  geom_polygon(colour='green') + coord_equal() + ggtitle("População") +
  labs(x = "Longitude", y = "Latitude", fill="População")


ggplot(rs.rsf, aes(rs.rsf$long,rs.rsf$lat, group=rs.rsf$group,fill=rs.rsf$PopulacaoCat)) +
  geom_polygon(colour='green') + coord_equal() + ggtitle("População") +
  labs(x = "Longitude", y = "Latitude", fill="População") +
  scale_fill_manual(values = brewer.pal(9,'Reds')[4:9]) +
  theme(plot.title = element_text(size = rel(1), lineheight = 0.9, face = "bold",
                                  colour = 'blue'))
