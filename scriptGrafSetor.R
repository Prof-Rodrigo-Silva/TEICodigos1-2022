#############################################################################################
# Aula - Gráfico de Setor

#matriculas <- c(51971, 33625, 25018,18890, 13457, 10266, 6989)
#names(matriculas) <- c("medicina","veterinaria","eng. civil","eng. mecanica","eng. eletrica","eng.computacao", "tads")
#matriculas

getwd()
setwd("/home/rodrigo/Área de Trabalho/RStudio")

#write.csv(matriculas,"/home/rodrigo/Área de Trabalho/RStudio/matriculas.csv", row.names = T)
#rm(matriculas)
#Ler arquivo
matriculas <- read.table("/home/rodrigo/Área de Trabalho/RStudio/matriculas.csv", sep = ",", dec = ".", header = T)
matriculas
class(matriculas)
pie(matriculas$x)

pie(matriculas$x, main <- "Matrículas em Cursos Superiores")

porc <- round(matriculas$x*100/sum(matriculas$x), 2)
porc

rotulos <- paste("(",porc,"%)", sep="")

pie(matriculas$x, main = "Matrículas em Cursos Superiores", labels=rotulos,
    col=rainbow(7))
legend(1, 1, matriculas$X, col=rainbow(7), pch=rep(20,6))

pie(matriculas$x, main = "Matrículas em Cursos Superiores", labels=rotulos,
    col=rainbow(7))
legend(1.4, 1, matriculas$X, col=rainbow(7), pch=rep(20,6),cex = 0.6)

pie(matriculas$x, main = "Matrículas em Cursos Superiores", labels=rotulos,
    col=rainbow(7))
legend(1.3, 1.3, matriculas$X, col=rainbow(7), pch=rep(20,10),cex = 0.8, y.intersp = 0.4, x.intersp = 0.05)
help("pch")

pie(matriculas$x, main = "Matrículas em Cursos Superiores",
    labels=rotulos, cex=0.7, col=rainbow(7))
legend(1.3, 1.3, matriculas$X, col=rainbow(7), pch=rep(20,10),cex = 0.8, y.intersp = 0.4, x.intersp = 0.05)
# uma opção para figuras em jpeg
dev.copy(device = jpeg, file = "exemplo2.jpeg", width = 600, height = 500, res = 100)
dev.off()
# uma opção para figures em pdf
dev.copy(device = pdf, file = "exemplo2.2.pdf", width = 600, paper = "USr")
dev.off()

pie(matriculas$x, main = "Matrículas em Cursos Superiores",labels=NA)
text(locator(length(matriculas$X)), rotulos)

pie(matriculas$x, main = "Matrículas em Cursos Superiores", cex=0.9)
pie(matriculas$x, main = "Matrículas em Cursos Superiores",init.angle=180)


############################################################################

