# Aula - Gráfico de Dispersão
# Os diagramas de dispersão são representações de duas variáveis que são organizadas 
# em um gráfico, para observar o padrão de relacionamento entre as mesmas. É um método
# gráfico que permite verificar a existência ou não de relação entre duas variáveis de 
# natureza quantitativa.

data("women")
women
cor(women$height,women$weight)

plot(women$height,women$weight, main = "Relação entre Peso | Altura",xlab = "Peso",
     ylab = "Altura")

#Colocando a reta
plot(women$height,women$weight, main = "Relação entre Peso | Altura",xlab = "Peso",
     ylab = "Altura", abline(lm(women$weight~women$height), col=2))
#Mudando caracter
plot(women$height,women$weight, main = "Relação entre Peso | Altura",xlab = "Peso",
     ylab = "Altura", abline(lm(women$weight~women$height), col=2), pch=17)
#Largura da linha
plot(women$height,women$weight, main = "Relação entre Peso | Altura",xlab = "Peso",
     ylab = "Altura", abline(lm(women$weight~women$height), col=2), lwd=3, col="blue")
#Mudando valores dos eixos
plot(women$height,women$weight, main = "Relação entre Peso | Altura",
     xlab ="Peso",ylab="Altura", abline(lm(women$weight~women$height)), col=2,
     xlim=range(50:80), ylim=range(120:180))

Orange
par(mfrow=c(1, 1))
plot(Orange$age,Orange$circumference)
cor(Orange$age,Orange$circumference)
plot(Orange$age,Orange$circumference, abline(lm(Orange$circumference~Orange$age),col=3))
plot(Orange$age,Orange$circumference,col="red", abline(lm(Orange$circumference~Orange$age),col=3),
     xlab="Idade em dias", ylab="Circunferência em mm",
     main="Dispersão entre Idade e Circunferência",pch=20)

plot(jitter(Orange$age),Orange$circumference,col="red", abline(lm(Orange$circumference~Orange$age),col=3),
     xlab="Idade em dias", ylab="Circunferência em mm",
     main="Dispersão entre Idade e Circunferência",pch=20)

plot(jitter(Orange$age),Orange$circumference,col=Orange$Tree, abline(lm(Orange$circumference~Orange$age),col=3),
     xlab="Idade em dias", ylab="Circunferência em mm",
     main="Dispersão entre Idade e Circunferência",pch=20)

par(mfrow=c(2, 3))
plot(Orange$age[Orange$Tree==1], Orange$circumference[Orange$Tree==1],
     xlab= "Idade", ylab= "Circumferência", sub= "Árvore1")
plot(Orange$age[Orange$Tree==2], Orange$circumference[Orange$Tree==2],
     xlab= "Idade", ylab= "Circumferência", sub= "Árvore2")
plot(Orange$age[Orange$Tree==3], Orange$circumference[Orange$Tree==3], 
     xlab= "Idade", ylab= "Circumferência", sub= "árvore3")
plot(Orange$age[Orange$Tree==4], Orange$circumference[Orange$Tree==4],
     xlab= "Idade", ylab= "Circumferência", sub= "árvore4")
plot(Orange$age[Orange$Tree==5], Orange$circumference[Orange$Tree==5],
     xlab= "Idade", ylab= "Circumferência", sub= "árvore5")
plot(Orange$age, Orange$circumference, xlab="Idade", ylab="Circumferência", sub="Árvores")

# Gráfico de Linhas
AirPassengers
data("AirPassengers")
plot(AirPassengers, main="Transporte Aéreo",xlab="Tempo(Anos)",
     ylab="Quantidade(Milhões)", type = "l", col="red")

plot(AirPassengers, main="Transporte Aéreo",xlab="Tempo(Anos)",
     ylab="Quantidade(Milhões)", type = "b", col="red")

#type: "p" para pontos, "l" para linhas, "b" para pontos e linhas, 
#"c" para linhas descontínuas nos pontos, "o" para pontos sobre as linhas,
#"n" para nenhum gráfico, apenas a janela.

airmiles
class(airmiles)

plot(airmiles, main="Milhas Aérea",xlab="Tempo(Anos)",
     ylab="Quantidade(Milhas)", type = "l", col="blue")


meses = c(1:12)
meses
t1 = sample(-10:10,size = 12, replace = T)
t1
t2 = sample(-10:10,size = 12, replace = T)
t2
t3 = sample(-10:10,size = 12, replace = T)
t3

plot(meses,t1,type="l",main="Temperatura em ºC",col="blue",xlab="Meses",
     ylab="Variação em ºC",, ylim=c(-10,20))
lines(meses, t2, col="red", type="l")
lines(meses, t3, col="green", type="l")

legend(8.6,23, c("1º Temp","2º Temp","3º Temp"), col =c("blue","red","green"),
       pch=rep(20,10),cex = 0.8, y.intersp = 0.3, x.intersp = 0.05)

plot(meses,t1,type="b",main="Temperatura em ºC",col="blue",xlab="Meses",
     ylab="Variação em ºC",, ylim=c(-10,20))
lines(meses, t2, col="red", type="b")
lines(meses, t3, col="green", type="b")
legend(8.6,23, c("1º Temp","2º Temp","3º Temp"), col =c("blue","red","green"),
       pch=rep(20,10),cex = 0.8, y.intersp = 0.3, x.intersp = 0.05)
