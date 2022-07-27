#Aula - Gráfico de Caixa(box) - Boxplot
#O boxplot é um gráfico que possibilita representar a distribuição de um conjunto de
#dados com base em alguns de seus parâmetros descritivos, quais sejam: a mediana (q2), o
#quartil inferior (q1), o quartil superior (q3) e do intervalo interquartil (IQR = q3 - q1)

data()

data(rock)
rock
class(rock)
#attach(rock)

boxplot(rock$shape)

boxplot(rock$shape, main="BoxPlot do Shape(Rock)" , ylab="perimetro/sqrt(area)")

getwd()
setwd("/home/rodrigo/Área de Trabalho/RStudio")

corrida <- read.table("/home/rodrigo/Área de Trabalho/RStudio/corrida.csv", sep = ",", dec = ".", header = T)
boxplot(corrida$Pace)
boxplot(corrida$Posicao)
boxplot(corrida[1:2])
# Cercas com valores máximo e mínimo
boxplot(rock$shape, range=0)
#Outlier
boxplot(rock$shape, outline=FALSE)

data(PlantGrowth)
PlantGrowth
#attach(PlantGrowth)
boxplot(PlantGrowth$weight~PlantGrowth$group, xlab = "", ylab = "")
title("Boxplot para rendimento de plantas segundo o tratamento", xlab =
        "tratamento", ylab = "peso")

data(iris)
iris
boxplot(iris$Sepal.Length~iris$Species)

boxplot(iris[1:4],main="Iris", xlab="Variáveis",
        col="aquamarine3", horizontal = F, notch = T)

dev.copy(device = jpeg, file = "exemplo4.jpeg", width = 600, height = 500, res = 100)
dev.off()
# uma opção para figures em pdf
dev.copy(device = pdf, file = "exemplo4.4.pdf", width = 600, paper = "USr")
dev.off()

x1 = sample(1:9,size=13,replace = T)
x1
x2 = sample(1:6, size = 31,replace = T)
x2
boxplot(x1, x2, varwidth=TRUE)
# Nomear os grupos:
boxplot(x1, x2, names=c("grupo1","grupo2"))
# Modificar a largura da caixa para mais estreita 
boxplot(x1, x2, boxwex=0.3)
# Ajeitar o tamanho das linhas limites:
boxplot(x1, x2, staplewex=0.1)
# Para colocar cor nas bordas:
boxplot(x1, x2, border="red")

boxplot.stats(iris$Sepal.Width)