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
T11 = read.csv("final/T11.csv", header = TRUE, sep = ",")
pop = read.csv("population/clean_state_population.csv")


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

states_pops = select(pop, Postal.Code, Population)
states_pops = states_pops %>%
                  rename (state = Postal.Code)

#Filtering out each clade
#Could loop this but also this is just a little clearer
Clade_19A = filter(df, clade=="19A")
Clade_19B = filter(df, clade=="19B")
Clade_20A = filter(df, clade=="20A")
Clade_20B = filter(df, clade=="20B")
Clade_20C = filter(df, clade=="20C")
Clade_20D = filter(df, clade=="20D")
Clade_20E = filter(df, clade=="20E (EU1)")
Clade_20G = filter(df, clade == "20G")
Clade_20H = filter(df, clade=="20H (Beta, V2)")
Clade_20I = filter(df, clade=="20I (Alpha, V1)")
Clade_20J = filter(df, clade=="20J (Gamma, V3)")
Clade_21A = filter(df, clade=="21A (Delta)")
Clade_21B = filter(df, clade=="21B (Kappa)")
Clade_21C = filter(df, clade=="21C (Epsilon)")
Clade_21D = filter(df, clade=="21D (Eta)")
Clade_21F = filter(df, clade=="21F (Iota)")
Clade_21G = filter(df, clade=="21G (Lambda)")
Clade_21H = filter(df, clade=="21H (Mu)")
Clade_21I = filter(df, clade=="21I (Delta)")
Clade_21J = filter(df, clade=="21J (Delta)")


#Grouping clades and getting the sums 
Clade_19A = Clade_19A %>%
  group_by(state, time) %>%
  transmute(Count=sum(count))
Clade_19B = Clade_19B %>%
  group_by(state, time) %>%
  transmute(Count=sum(count))
Clade_20A = Clade_20A %>%
  group_by(state, time) %>%
  transmute(Count=sum(count))
Clade_20B = Clade_20B %>%
  group_by(state, time) %>%
  transmute(Count=sum(count))
Clade_20C= Clade_20C %>%
  group_by(state, time) %>%
  transmute(Count=sum(count))
Clade_20D = Clade_20D %>%
  group_by(state, time) %>%
  transmute(Count=sum(count))
Clade_20E = Clade_20E %>%
  group_by(state, time) %>%
  transmute(Count=sum(count))
Clade_20G= Clade_20G %>%
  group_by(state, time) %>%
  transmute(Count=sum(count))
Clade_20H = Clade_20H %>%
  group_by(state, time) %>%
  transmute(Count=sum(count))
Clade_20I = Clade_20I %>%
  group_by(state, time) %>%
  transmute(Count=sum(count))
Clade_20J = Clade_20J %>%
  group_by(state, time) %>%
  transmute(Count=sum(count))
Clade_21A = Clade_21A %>%
  group_by(state, time) %>%
  transmute(Count=sum(count))
Clade_21B = Clade_21B %>%
  group_by(state, time) %>%
  transmute(Count=sum(count))
Clade_21C = Clade_21C %>%
  group_by(state, time) %>%
  transmute(Count=sum(count))
Clade_21D = Clade_21D %>%
  group_by(state, time) %>%
  transmute(Count=sum(count))
Clade_21F = Clade_21F %>%
  group_by(state, time) %>%
  transmute(Count=sum(count))
Clade_21G = Clade_21G %>%
  group_by(state, time) %>%
  transmute(Count=sum(count))
Clade_21H = Clade_21H %>%
  group_by(state, time) %>%
  transmute(Count=sum(count))
Clade_21I = Clade_21I %>%
  group_by(state, time) %>%
  transmute(Count=sum(count))
Clade_21J = Clade_21J %>%
  group_by(state, time) %>%
  transmute(Count=sum(count))

#we only want the distinct entries, and we also want to join the state populations
#also mutate in the per capita column while we are at it
#more stuff that could be a loop incoming
Clade_19A = distinct(Clade_19A)
Clade_19A = Clade_19A %>% left_join(states_pops, by='state')
Clade_19A <- Clade_19A %>% mutate(perCapita = Count / Population * 100000)

Clade_19B = distinct(Clade_19B)
Clade_19B = Clade_19B %>% left_join(states_pops, by='state')
Clade_19B <- Clade_19B %>% mutate(perCapita = Count / Population * 100000)

Clade_20A = distinct(Clade_20A)
Clade_20A = Clade_20A %>% left_join(states_pops, by='state')
Clade_20A = Clade_20A %>% mutate(perCapita = Count / Population * 100000)

Clade_20B = distinct(Clade_20B)
Clade_20B = Clade_20B %>% left_join(states_pops, by='state')
Clade_20B = Clade_20B %>% mutate(perCapita = Count / Population * 100000)

Clade_20C = distinct(Clade_20C)
Clade_20C = Clade_20C %>% left_join(states_pops, by='state')
Clade_20C = Clade_20C %>% mutate(perCapita = Count / Population * 100000)

Clade_20D = distinct(Clade_20D)
Clade_20D = Clade_20D %>% left_join(states_pops, by='state')
Clade_20D = Clade_20D %>% mutate(perCapita = Count / Population * 100000)

Clade_20E = distinct(Clade_20E)
Clade_20E = Clade_20E %>% left_join(states_pops, by='state')
Clade_20E = Clade_20E %>% mutate(perCapita = Count / Population * 100000)

Clade_20G = distinct(Clade_20G)
Clade_20G = Clade_20G %>% left_join(states_pops, by='state')
Clade_20G = Clade_20G %>% mutate(perCapita = Count / Population * 100000)

Clade_20H = distinct(Clade_20H)
Clade_20H = Clade_20H %>% left_join(states_pops, by='state')
Clade_20H = Clade_20H %>% mutate(perCapita = Count / Population * 100000)

Clade_20I = distinct(Clade_20I)
Clade_20I = Clade_20I %>% left_join(states_pops, by='state')
Clade_20I = Clade_20I %>% mutate(perCapita = Count / Population * 100000)

Clade_20J = distinct(Clade_20J)
Clade_20J = Clade_20J %>% left_join(states_pops, by='state')
Clade_20J = Clade_20J %>% mutate(perCapita = Count / Population * 100000)

Clade_21A = distinct(Clade_21A)
Clade_21A = Clade_21A %>% left_join(states_pops, by='state')
Clade_21A = Clade_21A %>% mutate(perCapita = Count / Population * 100000)

Clade_21B = distinct(Clade_21B)
Clade_21B = Clade_21B %>% left_join(states_pops, by='state')
Clade_21B = Clade_21B %>% mutate(perCapita = Count / Population * 100000)

Clade_21C = distinct(Clade_21C)
Clade_21C = Clade_21C %>% left_join(states_pops, by='state')
Clade_21C = Clade_21C %>% mutate(perCapita = Count / Population * 100000)

Clade_21D = distinct(Clade_21D)
Clade_21D = Clade_21D %>% left_join(states_pops, by='state')
Clade_21D = Clade_21D %>% mutate(perCapita = Count / Population * 100000)

Clade_21F = distinct(Clade_21F)
Clade_21F = Clade_21F %>% left_join(states_pops, by='state')
Clade_21F = Clade_21F %>% mutate(perCapita = Count / Population * 100000)

Clade_21G = distinct(Clade_21G)
Clade_21G = Clade_21G %>% left_join(states_pops, by='state')
Clade_21G = Clade_21G %>% mutate(perCapita = Count / Population * 100000)

Clade_21H = distinct(Clade_21H)
Clade_21H = Clade_21H %>% left_join(states_pops, by='state')
Clade_21H = Clade_21H %>% mutate(perCapita = Count / Population * 100000)

Clade_21I = distinct(Clade_21I)
Clade_21I = Clade_21I %>% left_join(states_pops, by='state')
Clade_21I = Clade_21I %>% mutate(perCapita = Count / Population * 100000)

Clade_21J = distinct(Clade_21J)
Clade_21J = Clade_21J %>% left_join(states_pops, by='state')
Clade_21J = Clade_21J %>% mutate(perCapita = Count / Population * 100000)


graph = plot_geo(Clade_21J, locationmode = "USA-states") %>%
  add_trace(locations = ~state,
            z = ~perCapita, 
            zmin = 0,
            zmax = 50,
            color = ~perCapita,
            frame = ~time) %>%
  layout(geo = list(scope = 'usa'),
        title = "Count of variant 21J (Delta) per state per capita") %>%
  colorbar(title = "Per 100,000")
graph

