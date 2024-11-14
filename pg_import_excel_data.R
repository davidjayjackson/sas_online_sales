library(readxl)
library(DBI)
library(RPostgres)

# Define the database connection details
con <- dbConnect(
  RPostgres::Postgres(),
  dbname = "ecommerce",
  host = "localhost",     # e.g., "localhost" or IP address
  port = 5432,            # default PostgreSQL port
  user = "postgres",
  password = "dJj135790"
)
# Load Data
df <- read_xlsx('./online_sales.xlsx')
head(df)

# Write the dataframe to PostgreSQL
dbWriteTable(con, name = "esales", value = df, 
             row.names = FALSE, overwrite = TRUE)

dbGetQuery(con,"SELECT count(*) from esales;")

# Disconnect from the database
dbDisconnect(con)