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

