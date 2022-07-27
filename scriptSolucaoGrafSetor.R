#Exercício
#USArrests
#cidadesPopulosas <- subset(x = USArrests, subset = UrbanPop > 80)

# Visualiza os dados
#cidadesPopulosas
#getwd()
#setwd("/home/rodrigo/Área de Trabalho/RStudio")
#write.csv(cidadesPopulosas,"/home/rodrigo/Área de Trabalho/RStudio/cidadesPopulosas.csv", row.names = T)
#rm(cidadesPopulosas)

#Ler arquivo
cidadesPopulosas <- read.table("/home/rodrigo/Área de Trabalho/RStudio/cidadesPopulosas.csv", sep = ",", dec = ".", header = T)

# Cria gráfico de pizza sobre os assassinatos
pie(cidadesPopulosas$Murder)
# Legenda das cidades com assassinatos
legendasAssassinatos <- paste(names=cidadesPopulosas$X, cidadesPopulosas$Murder)

# Visualiza os dados
legendasAssassinatos

# Taxa de assassinatos
pie(x = cidadesPopulosas$Murder,   # Dados do Gráfico
    labels = legendasAssassinatos, # Legendas
    main = "Assassinatos")         # Título do gráfico

# Cria gráfico de pizza sobre os assaltos
pie(cidadesPopulosas$Assault)
# Legenda das cidades com assaltos
legendasAssaltos <- paste(names=cidadesPopulosas$X, cidadesPopulosas$Assault)

# Visualiza os dados
legendasAssaltos

# Taxa de assaltos
pie(x = cidadesPopulosas$Assault,   # Dados do Gráfico
    labels = legendasAssaltos, # Legendas
    main = "Assaltos")         # Título do gráfico
