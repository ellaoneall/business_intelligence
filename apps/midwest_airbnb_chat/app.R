# ISA 401 Airbnb Listings: ask questions, get SQL, a table, or a chart back
library(querychat)
library(bslib)

con = DBI::dbConnect(RSQLite::SQLite(), "data/midwest_airbnb.db")

client = ellmer::chat_openai(
  model  = "gpt-5.6-luna",
  params = ellmer::params(reasoning_effort = "none")
)

qc = querychat::querychat(
  con, "listings",
  client   = client,
  tools    = c("filter", "query", "visualize"),  # visualize: charts in the chat (needs ggsql)
  greeting = "Ask me about 14,887 Airbnb listings in Chicago, Columbus, and the Twin Cities.",
  data_description   = "data/data_desc.md",
  extra_instructions = "data/extra_instructions.md"
)

ui <- page_fillable(
  theme = bs_theme(
    version = 5,
    bootswatch = "minty"
  ),
  title = "Midwest Airbnb Explorer",

  h2("Midwest Airbnb Explorer"),

  qc$ui()
)

server <- function(input, output, session){
  qc$server()
}

shiny::shinyApp(ui, server)
