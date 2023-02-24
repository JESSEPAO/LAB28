
--------------------------------------------------------------------
####################################################################
LABORATORIO_28_DATOSORDENADOS_TIDYDATAVALORES FALTANTES
RETOMAMOSLABORATORIO_25Y26
####################################################################
--------------------------------------------------------------------
  
# Hecho con gusto por la alumna JESSICA PAOLA AGUILAR SERVIN

# Objetivo:Introducción práctica a los datos ordenados (o tidy data) y a las herramientas que provee el paquete tidyr

# En este ejercicio vamos a:
# 1. Cargar datos (tibbles)
# 2. Llenar los valores faltantes
# Pre-requisitos: instalar paqueteria tidyverse
install.packages("tidyverse")

# Llamar a la libreria de tidyverse
library(tidyverse)

# Cargar datos
acciones <- tibble(
  anio = c (2015, 2015, 2015, 2015, 2016, 2016, 2016),
  trimestre = c (1, 2, 3, 4, 2, 3, 4),
  retorno = c (1.88, 0.59, 0.35, NA, 0.92, 0.17, 2.66))

# Dataframe1 (DF1)
# Convertir tabla a dataframe 
DF1 = acciones
head(DF1)

# Dataframe2 (DF2)
# Ver explicitos los valores. Llenar los datos faltantes y ver resultado
DF2 = DF1 %>%
  spread(anio, retorno)

head(DF2)

# Dataframe3 (DF3)
# Identifico y eliminar todos los datos faltantes (explicitos e implicitos) y ver resultado
DF3 = acciones %>%
  pivot_wider(names_from = anio, values_from = retorno) %>% 
  pivot_longer(
    cols = c("2015", "2016"),
    names_to = "anio",
    values_to = "retorno",
    values_drop_na = TRUE)

head(DF3)

# Dataframe4 (DF4)
# Otra herramienta para hacer explicitos los valores faltante (conservar la estructura original) y ver resultado
DF4 = DF1 %>% 
  complete(anio,trimestre)

head(DF4)

# Exportar resultado: tabla ordenada
write.csv(acciones, file = "LAB28-acciones.csv")
write.csv(DF1, file = "LAB28-DF1.csv")
write.csv(DF2, file = "LAB28-DF2.csv")
write.csv(DF3, file = "LAB28-DF3.csv")
write.csv(DF4, file = "LAB28-DF4.csv")

