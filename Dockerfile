FROM rocker/shiny:latest

WORKDIR /app

COPY . .

RUN R -e 'install.packages(c("shiny", "shinydashboard"))' && \
    R -e 'if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager"); BiocManager::install(c("Biostrings", "bio3d"))'

EXPOSE 3838

CMD ["R", "-e", "shiny::runApp('/app', host='0.0.0.0', port=3838)"]
