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

OperatingData <- read_excel(doc, OperatingSheet, skip=2) 

OperatingData <- OperatingData %>% filter(`Plant State` != '')
