rm(list=ls())
library(tidyverse)
library(lubridate)
nypd_raw = read_csv("https://data.cityofnewyork.us/api/views/833y-fsy8/rows.csv?accessType=DOWNLOAD")
nypd_raw


summary(nypd_raw)

nypd_raw$OCCUR_DATE = mdy(nypd_raw$OCCUR_DATE)

nypd_raw$BORO = as_factor(nypd_raw$BORO)
nypd_raw$JURISDICTION_CODE = as_factor(nypd_raw$JURISDICTION_CODE)
nypd_raw$PERP_AGE_GROUP = as_factor(nypd_raw$PERP_AGE_GROUP)
nypd_raw$PERP_SEX = as_factor(nypd_raw$PERP_SEX)
nypd_raw$PERP_RACE = as_factor(nypd_raw$PERP_RACE)
nypd_raw$VIC_AGE_GROUP = as_factor(nypd_raw$VIC_AGE_GROUP)
nypd_raw$VIC_SEX = as_factor(nypd_raw$VIC_SEX)
nypd_raw$VIC_RACE = as_factor(nypd_raw$VIC_RACE)

nypd_vic = nypd_raw %>%
  select(INCIDENT_KEY, VIC_AGE_GROUP, VIC_SEX, VIC_RACE, Latitude, Longitude)

summary(is.na(nypd_vic))

gg1 <- ggplot(nypd_vic, aes(x = Longitude, y = Latitude, color = VIC_AGE_GROUP)) +
  geom_point()
gg1

gg2 <- ggplot(nypd_vic, aes(x = Longitude, y = Latitude, color = VIC_SEX)) +
  geom_point()
gg2

gg3 <- ggplot(nypd_vic, aes(x = Longitude, y = Latitude, color = VIC_RACE)) +
  geom_point()
gg3