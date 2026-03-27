FROM rocker/shiny:latest

WORKDIR /app

COPY . .

RUN R -e 'install.packages(c("shiny", "shinydashboard", "Biostrings", "bio3d"))'

EXPOSE 3838

CMD ["R", "-e", "shiny::runApp('/app', host='0.0.0.0', port=3838)"]
