# cargar paquetes
pacman::p_load("ggplot2")

# graficar cambios por anio

# leer la data
limpia <- read.csv(file = "02.results/limpia.csv")

# graficamos

barras.p <- ggplot2::ggplot(data = limpia,
                            mapping = aes(x = year,
                                          y = miembros,
                                          fill = cambio)) +
  
  geom_col( position = "dodge") + 
  ggtitle("cambios en el SNI") +
  theme_classic() +
  facet_wrap(~ nobilis)


# Visualizamos
barras.p

# Guardar Grafico

ggsave(filename = "02.results/barras.png",
       plot = barras.p, width = 7, height = 5)


# grafica la proporcion de DR y DRA  que pierden el SNI

# leer la data
 resumen <- vroom(file = "02.results/resumen.csv")

 pay.p <- ggplot(data = resumen,
                 mapping = aes(x = "",
                               y = totales,
                               fill = nobilis)) +
   geom_col(color = "black") +
   coord_polar("y") +
   theme_void() +
   ggtitle("Miembros que han perdido SNI")
 
 
 # Visualisacion 
 pay.p

 # Guardar el grafico 
 ggsave(filename = "02.results/pay.png", bg = "white",
        plot = pay.p, width = 7, height = 7)

 # TO-DOs
 # clanda: agregrar el numero de Drs y Dras en el pay