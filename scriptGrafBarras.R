
############################################################################################
# Aula - Gŕafico de Barras

curso<-c("Eng. Computação", "Eng. Software", "Sistemas de Informação", "TADS")
aprovado<-c(1751, 2186, 947, 200)
reprovado<-c(2528, 2132, 1843, 280)
curso
aprovado
reprovado
#save(curso,file = "curso")
#save(aprovado,file = "aprovado")
#save(reprovado,file = "reprovado")
conjunto = data.frame(curso,aprovado,reprovado)
getwd()
setwd("/home/rodrigo/Área de Trabalho/RStudio")

write.csv(conjunto,"/home/rodrigo/Área de Trabalho/RStudio/conjunto.csv", row.names = F)
rm(conjunto)
#Ler arquivo
conjunto = read.table("/home/rodrigo/Área de Trabalho/RStudio/conjunto.csv", sep = ",", dec = ".", header = T)
conjunto

#Gráfico de Barras
barplot(conjunto$aprovado, names.arg=conjunto$curso, main="Aprovação por Curso", xlab= "Cursos",
        ylab="Aprovação")
#Sub-Título
barplot(conjunto$aprovado, names.arg=conjunto$curso, main= "Aprovação por Curso", xlab= "Cursos",
        ylab="Aprovação", sub="Teste Gráfico")
#Alterando o tamanho do título
barplot(conjunto$aprovado, names.arg=conjunto$curso, main="Aprovação por Curso", cex.main=0.9)
barplot(conjunto$aprovado, names.arg=conjunto$curso, main="Aprovação por Curso", cex.main=1.5)
#Alterando o tamanho dos valores do eixo
barplot(conjunto$aprovado, names.arg=conjunto$curso, main="Aprovação por Curso", cex.axis=0.5)
#Alterando o tamanho dos nomes dos eixos
barplot(conjunto$aprovado, names.arg=conjunto$curso, main="Aprovação por Curso", cex.lab=0.5)
#Resumindo:
#cex.main= valor, para o título
#cex.lab = valor, para os eixos
#cex.axis = valor, para o números dos eixos
#cex.sub = valor, para o subtítulo

#Eliminando Eixo
barplot(conjunto$aprovado, names.arg=conjunto$curso, main="Aprovação por Curso", axes = F)

#Girando o Gráfico
barplot(conjunto$aprovado, names.arg=conjunto$curso, main="Aprovação por Curso", ylab= "Cursos", 
        xlab="Aprovação", sub="Teste Gráfico",horiz = T)

#Cores
#Densidade
barplot(conjunto$aprovado, names.arg=conjunto$curso, main= "Aprovação por Curso", ylab= "Aprovação",
        xlab="Cursos", sub="Teste Gráfico",density = 20)

barplot(conjunto$aprovado, names.arg=conjunto$curso, main= "Aprovação por Curso", ylab= "Aprovação",
        xlab="Cursos", sub="Teste Gráfico",density=20, angle=90)

colors()

barplot(conjunto$aprovado, names.arg=conjunto$curso, main= "Aprovação por Curso", ylab= "Aprovação",
        xlab="Cursos", sub="Teste Gráfico",col = "gold3")

#números de 1 a 8 que correspondem respectivamente às cores 1-preto,
#2-vermelho, 3-verde, 4-azul, 5-ciano, 6-magenta, 7-amarelo e 8-cinza.

barplot(conjunto$aprovado, names.arg=conjunto$curso, main= "Aprovação por Curso", ylab= "Aprovação",
        xlab="Cursos", sub="Teste Gráfico",col = c(2,3,4,5))

#RGB
barplot(conjunto$aprovado, names.arg=conjunto$curso, main= "Aprovação por Curso", ylab= "Aprovação",
        xlab="Cursos", sub="Teste Gráfico",col = rgb(0.5,0.7,0.6))

#Borda
barplot(conjunto$aprovado, names.arg=conjunto$curso, main= "Aprovação por Curso", ylab= "Aprovação",
        xlab="Cursos", sub="Teste Gráfico",col = rgb(0.5,0.7,0.6), border = F)

barplot(conjunto$aprovado, names.arg=conjunto$curso, main= "Aprovação por Curso", ylab= "Aprovação",
        xlab="Cursos", sub="Teste Gráfico",col = rgb(0.5,0.7,0.6), density = 20,border = F)

barplot(conjunto$aprovado, names.arg=conjunto$curso, main= "Aprovação por Curso", ylab= "Aprovação",
        xlab="Cursos", sub="Teste Gráfico",col = rgb(0.5,0.7,0.6), density = 20,border = T)

ind_aprov = matrix(c(conjunto$curso,conjunto$aprovado,conjunto$reprovado),nrow=4, ncol=3,dimnames=list(c("C1","C2","C3","C4"),c("Curso","Aprovados","Reprovados")))
ind_aprov

#teste <- as.matrix(conjunto)

ind_aprov = matrix(c(conjunto$aprovado),nrow=4, ncol=1, dimnames=list(curso,c("Aprovados")))
ind_aprov
#save(ind_aprov,file = "ind_aprov")
barplot(ind_aprov, main= "Aprovação por Curso", ylab= "Índices",
        xlab="Estado")

barplot(ind_aprov, main= "Aprovação por Curso", ylab= "Índices",
        xlab="Estado",beside = T)

barplot(ind_aprov, main= "Aprovação por Curso", ylab= "Índices",
        xlab="Estado",beside = T, legend.text=rownames(ind_aprov))

barplot(ind_aprov, main= "Aprovação por Curso", ylab= "Índices",
        xlab="Estado",beside = T, legend.text=rownames(ind_aprov), ylim = c(0,3000), xlim = c(0,20))

barplot(ind_aprov, main= "Aprovação por Curso", ylab= "Índices",
        xlab="Estado",beside = T, legend.text=rownames(ind_aprov), ylim = c(0,2000),
        xlim = c(0,15), col = c(2,3,4,5))

barplot(ind_aprov, main= "Aprovação por Curso", ylab= "Índices",
        xlab="Estado",beside = T,ylim = c(0,3000),
        xlim = c(0,15), col = c(2,3,4,5))
legend("topright", rownames(ind_aprov), fill = c(2,3,4,5), cex = 0.50)

ind_aprov = matrix(c(aprovado,reprovado),nrow=4, ncol=2, dimnames=list(curso,c("Aprovados","Reprovados")))

barplot(ind_aprov, main= "Aprovação por Curso", ylab= "Índices",
        xlab="Estado",beside = T,ylim = c(0,3000),
        xlim = c(0,13), col = c(2,3,4,5))
legend("topright", rownames(ind_aprov), fill = c(2,3,4,5), cex = 0.30)

# uma opção para figuras em jpeg
dev.copy(device = jpeg, file = "exemplo1.jpeg", width = 600, height = 500, res = 100)
dev.off()

# uma opção para figures em pdf
dev.copy(device = pdf, file = "exemplo1.1.pdf", width = 600, paper = "USr")
dev.off()


#ATIVIDADE 01
corrida = data.frame(Pace = c(5.55,4.59,5.21,5.05,4.45,5.17,5.01,5.34,5.45,5.56)
                     ,Posicao = c(9,2,6,4,1,5,3,7,8,10), Corredor=c("C1","C2","C3","C4","C5","C6","C7","C8","C9","C10"))

setwd("/home/rodrigo/Área de Trabalho/RStudio")
write.csv(corrida,"/home/rodrigo/Área de Trabalho/RStudio/corrida.csv", row.names = F)
barplot(corrida$Pace, names.arg=corrida$Corredor, main= "Pace por Corredor", ylab= "Pace",
        xlab="Corredores",col = c("snow1","springgreen1","steelblue1","tan1","thistle1","tomato1","turquoise1","violetred","wheat","whitesmoke"))

ind_aprov = matrix(c(corrida$Pace,corrida$Posicao),nrow=10, ncol=2, dimnames=list(corrida$Corredor,c("Pace","Posicao")))

barplot(ind_aprov, main= "Corrida", ylab= "Índice",
        xlab="PACE X POSIÇÃO",beside = T,ylim = c(0,10),
        xlim = c(0,30),
        col = c("snow1","springgreen1","steelblue1","tan1","thistle1","tomato1","turquoise1","violetred","wheat","whitesmoke"))
legend("topright", rownames(ind_aprov), 
       fill = c("snow1","springgreen1","steelblue1","tan1","thistle1","tomato1","turquoise1","violetred","wheat","whitesmoke"),
       cex = 0.80, y.intersp = 0.25, x.intersp = 0.05)
