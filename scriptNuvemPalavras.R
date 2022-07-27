# Aula - Nuvem de Palavras
#installed.packages()
install.packages("wordcloud", dependencies = T)
library(wordcloud)

install.packages("RColorBrewer")
library(RColorBrewer)

nuvem = read.csv(file.choose(),header = T,sep = ",")
nuvem
class(nuvem)
class(nuvem$Palavra)
nuvem$Palavra

wordcloud(words = nuvem$Palavra, freq = nuvem$Freq)
wordcloud(words = nuvem$Palavra, freq = nuvem$Freq, random.color = T,
          random.order = T, colors = rainbow(8), rot.per = 0.5)
wordcloud(words = nuvem$Palavra, freq = nuvem$Freq)

#install.packages("wordcloud2",dependencies = T)
library(wordcloud2)
#nuvem2 = read.csv(file.choose(),header = T,sep = ",")

wordcloud2(nuvem)
wordcloud2(nuvem, color = "random-light", backgroundColor = "grey")
wordcloud2(nuvem, minRotation = -pi/6, maxRotation = -pi/6, minSize = 10,
           rotateRatio = 1)

setwd("/home/fermat/Área de Trabalho/RStudio/R - Básico")
dev.copy(device = jpeg, file = "exemplo6.jpeg", width = 600, height = 500, res = 100)
dev.off()
# uma opção para figures em pdf
dev.copy(device = pdf, file = "exemplo6.6.pdf", width = 600, paper = "USr")
dev.off()