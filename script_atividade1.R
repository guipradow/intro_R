# Carrega o dataset USArrests'
df <- data.frame(USArrests)
head(df)

# Encontra as maiores populações urbanas
pop_urbana <- df$UrbanPop  # Lista com o valor de população urbana
top5_pop_urbana <- c(0, 0, 0, 0, 0)  #Lista vazia para ser preenchida com as estados de menores popoulações urbanas
for (i in 1:5){
    max_pop <- 0
    max_idx <- 0
    for (j in 1:(50-i)){
        if (pop_urbana[j] > max_pop){
            max_pop <- pop_urbana[j]
            max_idx <- j
        }
    }
    top5_pop_urbana[i] <- pop_urbana[max_idx]
    pop_urbana <- pop_urbana[-max_idx]
}
cat('\nMaiores proporções de população urbana:', top5_pop_urbana)

# Encontra as 5 menores populações urbanas, isto é maiores populações rurais
pop_urbana <- df$UrbanPop  # Lista com os valores de população urbana
top5_pop_rural <- c(0, 0, 0, 0, 0)  #Lista para ser preenchida com as estados de menores popoulações urbanas
for (i in 1:5){
    min_pop <- 100
    min_idx <- 0
    for (j in 1:(50-i)){
        if (pop_urbana[j] < min_pop){
            min_pop <- pop_urbana[j]
            min_idx <- j
        }
    }
    top5_pop_rural[i] <- pop_urbana[min_idx]
    pop_urbana <- pop_urbana[-min_idx]
}
cat('\nMenores proporções de população urbana:', top5_pop_rural)

# Calcula a média das prisões por assaltos, assassinatos e estupros para as 5 maiores populações urbanas
pop_urbana <- df$UrbanPop  # Lista com os valores de população urbana
murder <- c(0, 0, 0, 0, 0)  # Lista para ser preenchida com o valor de assassinatos
assault <- c(0, 0, 0, 0, 0)  # Lista para ser preenchida com o valor de assaltos
rape <- c(0, 0, 0, 0, 0)  # Lista para ser preenchida com o valor de estupros

k <- 1
for (i in 1:50){
    for (j in 1:5){
        if (pop_urbana[i] == top5_pop_urbana[j]){
            murder[k] <- df$Murder[i]
            assault[k] <- df$Assault[i]
            rape[k] <- df$Rape[i]
            k <- k + 1
        }
    }
}
soma_murder <- 0
soma_assault <- 0
soma_rape <- 0
for (i in 1:5)
    soma_murder <- soma_murder + murder[i]
    soma_assault <- soma_assault + assault[i]
    soma_rape <- soma_rape + rape[i]
media_murder <- soma_murder / 5
media_assault <- soma_assault / 5
media_rape <- soma_rape / 5

cat('\n\nMédia de assassinatos top 5 estados mais urbanos:', media_murder)
cat('\nMédia de assaltos top 5 estados mais urbanos:', media_assault)
cat('\nMédia de estupros top 5 estados mais urbanos:', media_rape)

# Calcula a média das prisões por assaltos, assassinatos e estupros para as 5 maiores populações urbanas
pop_urbana <- df$UrbanPop  # Lista com os valores de população urbana
murder <- c(0, 0, 0, 0, 0)  # Lista para ser preenchida com o valor de assassinatos
assault <- c(0, 0, 0, 0, 0)  # Lista para ser preenchida com o valor de assaltos
rape <- c(0, 0, 0, 0, 0)  # Lista para ser preenchida com o valor de estupros

k <- 1
for (i in 1:50){
    for (j in 1:5){
        if (pop_urbana[i] == top5_pop_rural[j]){
            murder[k] <- df$Murder[i]
            assault[k] <- df$Assault[i]
            rape[k] <- df$Rape[i]
            k <- k + 1
        }
    }
}
soma_murder <- 0
soma_assault <- 0
soma_rape <- 0
for (i in 1:5)
    soma_murder <- soma_murder + murder[i]
    soma_assault <- soma_assault + assault[i]
    soma_rape <- soma_rape + rape[i]
media_murder <- soma_murder / 5
media_assault <- soma_assault / 5
media_rape <- soma_rape / 5

cat('\nMédia de assassinatos top 5 estados mais rurais:', media_murder)
cat('\nMédia de assaltos top 5 estados mais rurais:', media_assault)
cat('\nMédia de estupros top 5 estados mais rurais:', media_rape)
