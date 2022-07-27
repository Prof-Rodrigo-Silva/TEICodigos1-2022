#############################################################
#Atividade 3
#CRIAÇÃO DOS DADOS
#dados <- data.frame(
#  name=c( rep("A",500), rep("B",500), rep("B",500), rep("C",20), rep('D', 100)  ),
#  value=c( rnorm(500, 10, 5), rnorm(500, 13, 1), rnorm(500, 18, 1), rnorm(20, 25, 4), rnorm(100, 12, 1) )
#)
#SETAR DIRETÓRIO/PASTA DE TRABALHO
#setwd("/home/rodrigo/Área de Trabalho/RStudio")
#SALVAR DADOS
#write.csv(dados,"/home/rodrigo/Área de Trabalho/RStudio/dadosBoxplot.csv", row.names = F)
#LER DADOS
dadosBoxplot <- read.table("/home/rodrigo/Área de Trabalho/RStudio/dadosBoxplot.csv", sep = ",", dec = ".", header = T)
#BOXPLOT DOS DADOS
boxplot(dadosBoxplot$value, main = "BoxPlot dos Dados", col = "blue", border = "black")
#BOXPLOT DOS DADOS POR VARIÁVEIS(A,B,C,D)
boxplot(dadosBoxplot$value~dadosBoxplot$name, main = "BoxPlot por Tipo",xlab = "Tipos",ylab = "Valores", col=c(2,3,4,5))
#SUBSET PARA CRIAR NOVO OBJETOS DE DADOS, NO CASO SÓ DO TIPO A
dadosA <- subset(dadosBoxplot, dadosBoxplot$name=="A")
#BOXPLOR DO NOVO OBJETO
boxplot(dadosA$value, main = "BoxPlot Dados Tipo A",xlab = "Tipo A",ylab = "Valores", col=c(3))
