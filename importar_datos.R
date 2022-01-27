library(galeriaR)

# Cartas
cartas_base_larga <- importar_cartas_base_larga()
saveRDS(cartas_base_larga, here::here("data", "cartas_base_larga.rds"))


# Paquetes
paquetes_base_larga <- importar_paquetes_base_larga()
saveRDS(paquetes_base_larga, here::here("data", "paquetes_base_larga.rds"))


# Giros
giros_base_larga <- importar_giros_base_larga()
saveRDS(giros_base_larga, here::here("data", "giros_base_larga.rds"))


