#A project to visualize EIA monthly generator data

#libs for data organization
library(tidyverse)
library(readxl)

#libs for mapping
library(usmap)

#load data
doc <- '~/Code/GeneratorData/NovemberGenerator2.xlsx'
OperatingSheet <- 'Operating'
PlannedSheet <- 'Planned'
RetiredSheet <- 'Retired'

#set state
state <- 'KY'

#Create data sets
OperatingData <- read_excel(doc, OperatingSheet) 
OperatingData <- OperatingData %>% 
  filter(`Plant State` == state) %>% 
  select(Longitude, Latitude, `Nameplate Capacity (MW)`, Technology) %>%
  as.data.frame() %>%
  usmap_transform()

PlannedData <- read_excel(doc, PlannedSheet) 
PlannedData <- PlannedData %>% 
  filter(`Plant State` == state) %>% 
  select(Longitude, Latitude, `Nameplate Capacity (MW)`, Technology) %>%
  as.data.frame() %>%
  usmap_transform()

RetiredData <- read_excel(doc, RetiredSheet) 
RetiredData <- RetiredData %>%
  filter(`Plant State` == state) %>% 
  select(Longitude, Latitude, `Nameplate Capacity (MW)`, Technology) %>%
  as.data.frame() %>%
  usmap_transform()

plot_usmap("counties", include = c(state)) + geom_point(data=OperatingData, aes(x=Longitude.1, y=Latitude.1, color=Technology))