pacman::p_load("vroom", "dplyr")

# Leer la data

la_data <- vroom( file = "00.data/data_original.csv")

#  Filtramos los DR y DRA
data_filtrada <- la_data %>%
                  filter(nobilis == "DR." | nobilis == "DRA.")

# creamos directorio 
dir.create(path = "01.results")

# guardar date
write.csv(x = data_filtrada, file = "01.results/limpia.csv")

# CAlcular la proporcion de doctores que perdieron el SNI

data_resumen <- data_filtrada %>%
                filter(cambio == "perdio SNI")%>%
                group_by(nobilis) %>% 
                summarise(totales = sum(miembros))

write.csv(x = data_resumen, file = "01.results/resumen.csv")


# TO-DOs
# clanda: calcular el % de DR y DRA que pierde SNI
#            como total ingresos/ total perdidas