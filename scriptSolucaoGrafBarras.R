#POSSÍVEL SOLUÇÃO

corrida = read.table("/home/rodrigo/Área de Trabalho/RStudio/corrida.csv", sep = ",", dec = ".", header = T)

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