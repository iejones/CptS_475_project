library(tidyverse)
library(plotly)

setwd("./data")
#Reading in Data
T1 = read.csv("final/T1.csv", header = TRUE, sep = ",")
T2 = read.csv("final/T2.csv", header = TRUE, sep = ",")
T3 = read.csv("final/T3.csv", header = TRUE, sep = ",")
T4 = read.csv("final/T4.csv", header = TRUE, sep = ",")
T5 = read.csv("final/T5.csv", header = TRUE, sep = ",")
T6 = read.csv("final/T6.csv", header = TRUE, sep = ",")
T7 = read.csv("final/T7.csv", header = TRUE, sep = ",")
T8 = read.csv("final/T8.csv", header = TRUE, sep = ",")
T9 = read.csv("final/T9.csv", header = TRUE, sep = ",")
T10 = read.csv("final/T10.csv", header = TRUE, sep = ",")
T11= read.csv("final/T11.csv", header = TRUE, sep = ",")


# Add a time column to all of these 
T1["time"] = "01"
T2["time"] = "02"
T3["time"] = "03"
T4["time"] = "04"
T5["time"] = "05"
T6["time"] = "06"
T7["time"] = "07"
T8["time"] = "08"
T9["time"] = "09"
T10["time"] = "10"
T11["time"] = "11"


#make one big data frame
df = rbind(T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11)

#this gives you a list of clades from the dataset
table(df$clade)

#Swap this with the clade you wish to visualize
Clade = filter(df, clade == "20G")

cleanData = Clade %>%
  group_by(state, time) %>%
  transmute(Count=sum(count))

cleanData = distinct(cleanData)

graph = plot_geo(cleanData, 
                 locationmode = "USA-states",
                 frame = ~time) %>%
  add_trace(locations = ~state,
            z = ~Count, 
            zmin = 0,
            zmax = max(cleanData$Count),
            color = ~Count) %>%
  layout(geo = list(scope = 'usa'),
         title = "Count of 20G variant COVID-19 cases")
graph
