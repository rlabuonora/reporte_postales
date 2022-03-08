
# Variables globales
FECHA_INFORME_ANUAL <-  as.Date("2020-12-01")
FECHA_TITULO_STOCK <-  "Diciembre 2020"
FECHA_TITULO_FLUJO <-  "año 2020"

# Libs
library(galeriaPostales)
library(galeriaVis)
library(tidyverse)
library(lubridate)
library(extrafont)
library(glue)


# Cargar fuente
loadfonts()

# Settear theme
theme_set(
  theme_minimal(base_family="Agency FB", base_size = 16) +
    theme(plot.background=element_rect(fill="#EEEEEE",
                                       color="white"),
          axis.line.x=element_blank(),
          axis.ticks=element_blank(),
          text=element_text(family="Agency FB")))

pal <- RColorBrewer::brewer.pal(n = 8, name = "Blues")



# Helpers para plots
flujo_semestral <- function(df) {
  df %>% 
    group_by(year=year(fecha), semester=semester(fecha)) %>%
    summarize(numeric=round(sum(numeric))) %>% 
    ungroup()
}


helper_serie <- function() {
  # Capas comunes a las series
  list(
    scale_x_date(date_breaks= "1 months", date_labels = "%m-%y"), 
    ylim(c(0, NA)),
    labs(y="", x="")
  )
}

serie_historica <- function(df) {
  ggplot(df, aes(fecha, numeric)) +
    geom_line(color=pal[5]) +
    geom_point(color =pal[5]) +
    helper_serie() + 
    theme(panel.grid.major.y = element_line(color="gray80"))
}

serie_historica_2 <- function(df) {
  ggplot(df, aes(fecha, numeric, color = destino)) +
    geom_line() +
    geom_point() +
    helper_serie() + 
    scale_color_discrete("") + 
    theme(legend.position = "bottom")
}

paleta_cats <- c(
  "azul" = "#80b1d3",
  "rojo" = "#fb8072",
  "verde" = "#8dd3c7",
  "violeta" = "#decbe4",
  "naranja" = "#fed9a6",
  "amarillo" = "#ffffcc"
)