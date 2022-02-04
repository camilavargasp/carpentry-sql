
## Set up
library(RSQLite)


## Conect to database
connection <- dbConnect(SQLite(), "survey.db") ## connecting R to SQL light

dbListTables(connection)

## Query data
results <- dbGetQuery(connection, "SELECT Site.lat, Site.long FROM Site;")
print(results)

q2 <- dbGetQuery(connection, "SELECT * FROM Person")
str(q2)

limit <- 9
 
dbGetQuery(connection, "SELECT * FROM Survey WHERE quant = 'rad' AND reading > ?", list(limit)) ## the quetion mark allows to pass a more general argument like list(limit); list(limit) is what determines the condition under ?

library(tidyverse)

t <- tbl(connection, "Survey")
t %>%  filter(taken == 735)

t %>%  filter(taken == 735) %>% select(person, quant)

