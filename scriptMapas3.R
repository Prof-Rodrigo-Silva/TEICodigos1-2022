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

rs = readOGR("/home/rodrigo/Área de Trabalho/RStudio","43MUE250GC_SIR")

head(rs@data)

rs$CD_GEOCMU = substr(rs$CD_GEOCMU,1,6)

#importar dados tabnet!
populacao = read.csv2(file.choose(),header = T, sep = ",")
nascimentos = read.csv2(file.choose(),header = T, sep = ",")
obitos = read.csv2(file.choose(),header = T, sep = ",")

head(populacao)
head(nascimentos)
head(obitos)

populacao = na.omit(populacao)
nascimentos = na.omit(nascimentos)
obitos = na.omit(obitos)

names(populacao) = c("Municipio", "Populacao")
names(nascimentos) = c("Municipio", "Nascimentos")
names(obitos) = c("Municipio", "Obitos")

head(populacao)
head(nascimentos)
head(obitos)

populacao$CD_GEOCMU = substr(populacao$Municipio,1,6)
nascimentos$CD_GEOCMU = substr(nascimentos$Municipio,1,6)
obitos$CD_GEOCMU = substr(obitos$Municipio,1,6)

head(populacao)
head(nascimentos)
head(obitos)

head(rs@data)
#rs@data

dim(populacao)
dim(nascimentos)
dim(obitos)
dim(rs@data)

#Ordenando os objetos pelo id
populacao = populacao[order(populacao$CD_GEOCMU),]
nascimentos = nascimentos[order(nascimentos$CD_GEOCMU),]
obitos = obitos[order(obitos$CD_GEOCMU),]
malhaRS = rs@data[order(rs@data$CD_GEOCMU),]

dim(malhaRS)
head(malhaRS)

linhas = c(1,2)
malhaRS = malhaRS[-linhas,]

dim(malhaRS)
head(malhaRS)

dados = populacao

dados$Nascimentos = nascimentos$Nascimentos
dados$Obitos = obitos$Obitos

rs2 = merge(malhaRS,dados)
head(rs2)

rs2$PercNascimentos = (rs2$Nascimentos*100)/rs2$Populacao
rs2$PercObitos = (rs2$Obitos*100)/rs2$Populacao

head(rs2)

rs.rsf = fortify(rs,region = "CD_GEOCMU")

head(rs.rsf)

rs.rsf = subset(rs.rsf,id!="430000")

head(rs.rsf)

rs.rsf = merge(rs.rsf, rs@data, by.x="id", by.y = "CD_GEOCMU")

head(rs.rsf)
head(rs2)

rs2$NascimentosCat = cut(rs2$Nascimentos, breaks = c(0,200,400,600,800,1000,20000),
                         labels = c('0-200',
                                    '200-400',
                                    '400-600',
                                    '600-800',
                                    '800-1000',
                                    '+1000'),
                         include.lowest = T)

rs2$ObitosCat = cut(rs2$Obitos, breaks = c(0,200,400,600,800,1000,12000),
                    labels = c('0-200',
                               '200-400',
                               '400-600',
                               '600-800',
                               '800-1000',
                               '+1000'),
                    include.lowest = T)

rs2$PercNascCat = cut(rs2$PercNascimentos, breaks = c(0,0.3,0.6,0.9,1.2,1.5,1.8,
                                                      2.2),
                      labels = c('0-0.3',
                                 '0.3-0.6',
                                 '0.6-0.9',
                                 '1.2-1.5',
                                 '1.5-1.8',
                                 '1.8-2',
                                 '+2'),
                      include.lowest = T)

rs2$PercObitosCat = cut(rs2$PercObitos, breaks = c(0,0.2,0.4,0.6,0.8,1.0,1.2,
                                                   1.6),
                        labels = c('0-0.2',
                                   '0.2-0.4',
                                   '0.4-0.6',
                                   '0.6-0.8',
                                   '0.8-1.0',
                                   '1.0-1.2',
                                   '+1.2'),
                        include.lowest = T)


head(rs2)

#rm(rs2)
#rm(rs.rsf)

rs.rsf = merge(rs.rsf, rs2, by.x = "id", by.y = "CD_GEOCMU")

head(rs.rsf)

#names(rs2)[1]=c("id")

#install.packages("RColorBrewer",dependencies = T)
library(RColorBrewer)
library(ggplot2)

ggplot(rs.rsf, aes(rs.rsf$long,rs.rsf$lat, group=rs.rsf$group,fill=rs.rsf$NascimentosCat)) +
  geom_polygon(colour='red') + coord_equal() + ggtitle("Nascimentos") +
  labs(x = "Longitude", y = "Latitude", fill="Nascimentos") +
  scale_fill_manual(values = brewer.pal(9,'Greens')[4:9]) +
  theme(plot.title = element_text(size = rel(1), lineheight = 0.9, face = "bold",
                                  colour = 'blue'))

ggplot(rs.rsf, aes(rs.rsf$long,rs.rsf$lat, group=rs.rsf$group,fill=rs.rsf$ObitosCat)) +
  geom_polygon(colour='red') + coord_equal() + ggtitle("Obitos") +
  labs(x = "Longitude", y = "Latitude", fill="Obitos") +
  scale_fill_manual(values = brewer.pal(9,'Purples')[4:9]) +
  theme(plot.title = element_text(size = rel(1), lineheight = 0.9, face = "bold",
                                  colour = 'blue'))

ggplot(rs.rsf, aes(rs.rsf$long,rs.rsf$lat, group=rs.rsf$group,fill=rs.rsf$PercNascCat)) +
  geom_polygon(colour='green') + coord_equal() + ggtitle("Percentual Nascimentos") +
  labs(x = "Longitude", y = "Latitude", fill="Perc. Nascimentos") +
  scale_fill_manual(values = brewer.pal(9,'Oranges')[3:9]) +
  theme(plot.title = element_text(size = rel(1), lineheight = 0.9, face = "bold",
                                  colour = 'blue'))

ggplot(rs.rsf, aes(rs.rsf$long,rs.rsf$lat, group=rs.rsf$group,fill=rs.rsf$PercObitosCat)) +
  geom_polygon(colour='green') + coord_equal() + ggtitle("Percentual Obitos") +
  labs(x = "Longitude", y = "Latitude", fill="Perc. Obitos") +
  scale_fill_manual(values = brewer.pal(9,'OrRd')[3:9]) +
  theme(plot.title = element_text(size = rel(1), lineheight = 0.9, face = "bold",
                                  colour = 'blue'))
