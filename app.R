library(shiny)
library(shinydashboard)
library(Biostrings)
library(bio3d)

# Define UI
ui <- dashboardPage(
  dashboardHeader(
    title = div(style = "font-weight: bold; font-size: 24px; color: white;", 
                "Shrivatsa Hegde"),
    titleWidth = 280,
    tags$li(class = "dropdown", 
            tags$a(href = "https://github.com", target = "_blank", 
                   icon("github"), " GitHub", style = "color: white; margin-right: 20px;"))
  ),
  dashboardSidebar(
    width = 280,
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("house")),
      menuItem("Resume", tabName = "resume", icon = icon("briefcase")),
      menuItem("About", tabName = "about", icon = icon("circle-user")),
      menuItem("Work", tabName = "certifications", icon = icon("award")),
      menuItem("Tools", tabName = "tools", icon = icon("flask")),
      menuItem("Contact", tabName = "contact", icon = icon("paper-plane")),
      hr(),
      tags$div(style = "padding: 15px; text-align: center; color: #666;",
               p("Bioinformatician | Computational Biology", style = "font-size: 12px; margin: 0;"))
    ),
    skin = "light"
  ),
  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
      tags$style(HTML("
        .content-wrapper, .right-side {
          background-color: #f8f9fa;
        }
        
        .main-header {
          background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
          box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        
        .sidebar {
          background: #ffffff;
          border-right: 1px solid #e0e0e0;
        }
        
        .nav-tabs-custom .nav-tabs li.active:hover a, .nav-tabs-custom .nav-tabs li.active a {
          background-color: #667eea;
          color: white;
          border-color: #667eea;
        }
        
        .nav-tabs-custom {
          border-bottom-color: #e0e0e0;
        }
        
        .box {
          box-shadow: 0 1px 3px rgba(0,0,0,0.08);
          border-top: 3px solid #667eea;
        }
        
        .box.box-primary {
          border-top-color: #667eea;
        }
        
        .box.box-info {
          border-top-color: #17a2b8;
        }
        
        .box.box-success {
          border-top-color: #28a745;
        }
        
        .box.box-warning {
          border-top-color: #ffc107;
        }
        
        .box-header.with-border {
          border-bottom: 2px solid #f0f0f0;
        }
        
        .box-header h3 {
          font-weight: 600;
          color: #2c3e50;
        }
        
        .btn-primary {
          background-color: #667eea;
          border-color: #667eea;
        }
        
        .btn-primary:hover {
          background-color: #5568d3;
          border-color: #5568d3;
        }
        
        h1, h2, h3, h4 {
          color: #2c3e50;
          font-weight: 600;
        }
        
        p {
          color: #555;
          line-height: 1.6;
        }
        
        .hero-section {
          background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
          color: white;
          padding: 40px;
          border-radius: 8px;
          margin-bottom: 30px;
        }
        
        .hero-section h1 {
          color: white;
          font-size: 2.5em;
          margin-bottom: 10px;
        }
        
        .hero-section p {
          color: rgba(255,255,255,0.9);
          font-size: 1.1em;
        }
        
        .stat-card {
          text-align: center;
          padding: 20px;
        }
        
        .stat-card h3 {
          color: #667eea;
          font-size: 1.8em;
          margin: 10px 0;
        }
        
        .skill-tag {
          display: inline-block;
          background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
          color: white;
          padding: 8px 15px;
          border-radius: 20px;
          margin: 5px;
          font-size: 0.9em;
          font-weight: 500;
        }
        
        .experience-item {
          padding: 20px;
          background: white;
          border-left: 4px solid #667eea;
          margin-bottom: 15px;
          border-radius: 4px;
        }
        
        .experience-item h4 {
          color: #667eea;
          margin-bottom: 5px;
        }
        
        .experience-item .date {
          color: #999;
          font-size: 0.9em;
          margin-bottom: 10px;
        }
      "))
    ),
    tabItems(
      # HOME TAB
      tabItem(tabName = "home",
              div(class = "hero-section",
                  h1("Shrivatsa Hegde"),
                  p("Bioinformatician | Computational Biologist | Data Scientist")
              ),
              fluidRow(
                column(4,
                  box(width = 12, status = "primary", solidHeader = TRUE,
                      title = "Expertise",
                      div(
                        class = "stat-card",
                        div(class = "skill-tag", "Molecular Docking"),
                        div(class = "skill-tag", "Cancer Genomics"),
                        div(class = "skill-tag", "NGS Analysis"),
                        div(class = "skill-tag", "Python"),
                        div(class = "skill-tag", "R Programming"),
                        div(class = "skill-tag", "Machine Learning")
                      )
                  )
                ),
                column(4,
                  box(width = 12, status = "info", solidHeader = TRUE,
                      title = "Experience",
                      div(class = "stat-card",
                          h3("3+"),
                          p("Years in Bioinformatics")
                      )
                  )
                ),
                column(4,
                  box(width = 12, status = "success", solidHeader = TRUE,
                      title = "Publications",
                      div(class = "stat-card",
                          h3("2"),
                          p("Published Papers")
                      )
                  )
                )
              ),
              fluidRow(
                box(width = 12, status = "primary", solidHeader = TRUE,
                    title = "Featured Project: PTK2/FAK in Breast Cancer",
                    p("Comprehensive computational analysis of PTK2 protein expression across breast cancer subtypes.", 
                      style = "font-size: 1em; color: #555;"),
                    p(strong("Key Findings:"), "Identified correlations between PTK2 expression and tumor stemness, proliferation, and EMT markers.",
                      style = "margin: 10px 0;"),
                    p(strong("Methods:"), "Gene expression profiling • Pathway enrichment • Statistical modeling",
                      style = "color: #667eea; margin-top: 10px;")
                )
              ),
              fluidRow(
                box(width = 6, status = "info", solidHeader = TRUE,
                    title = "Technical Skills",
                    p("→ Programming: R, Python, Bash, C"),
                    p("→ Libraries: Pandas, NumPy, ggplot2, Biopython"),
                    p("→ Data Analysis: Statistical modeling, pathway analysis")
                ),
                box(width = 6, status = "success", solidHeader = TRUE,
                    title = "Research Focus",
                    p("→ Drug Discovery & Molecular Docking"),
                    p("→ Cancer Genomics & Oncology"),
                    p("→ Machine Learning in Bioinformatics")
                )
              )
      ),
      
      # RESUME TAB
      tabItem(tabName = "resume",
              fluidRow(
                box(width = 12, status = "primary", solidHeader = TRUE,
                    title = "Professional Journey",
                    div(
                      class = "experience-item",
                      h4("Research Assistant"),
                      span(class = "date", "October 2023 - November 2024"),
                      p("Investigated molecular docking, modeling, and gene expression analysis in depth. Published research on computational approaches to phytochemical effects on cancer."),
                      p("• Conducted in-depth gene expression studies with differential expression analysis"),
                      p("• Explored freelance opportunities in real-world bioinformatics projects")
                    ),
                    div(
                      class = "experience-item",
                      h4("Bioinformatics Intern"),
                      span(class = "date", "December 2022 - February 2023"),
                      p("Applied BioNLP techniques for biomedical named entity recognition and text analysis."),
                      p("• Developed foundation in machine learning applications within bioinformatics")
                    ),
                    div(
                      class = "experience-item",
                      h4("Pharmacovigilance Intern"),
                      span(class = "date", "July 2022 - August 2022"),
                      p("Drug safety monitoring, adverse event reporting, signal detection, and regulatory compliance."),
                      p("• Gained insights into global drug safety regulations and frameworks")
                    )
                )
              ),
              fluidRow(
                box(width = 6, status = "info", solidHeader = TRUE,
                    title = "Education",
                    div(
                      class = "experience-item",
                      h4("M.Sc. in Bioinformatics"),
                      span(class = "date", "October 2021 - August 2023"),
                      p("SGPA: 8.13 • Focused on computational biology and genomics")
                    ),
                    div(
                      class = "experience-item",
                      h4("B.Sc. in Chemistry, Botany, Zoology"),
                      span(class = "date", "June 2017 - October 2020"),
                      p("Score: 71.3%")
                    ),
                    div(
                      class = "experience-item",
                      h4("Pre-University"),
                      span(class = "date", "June 2015 - April 2017"),
                      p("Score: 73%")
                    )
                )
              )
      ),
      
      # ABOUT TAB
      tabItem(tabName = "about",
              fluidRow(
                box(title = "About Me", width = 12, status = "primary", solidHeader = TRUE,
                    p("I am a passionate and driven bioinformatician with a diverse educational background spanning chemistry, biology, and computational sciences. My expertise encompasses data analysis and proficiency in multiple programming languages including Linux/Bash, Python, R, and C, complemented by strong skills in data manipulation libraries such as Pandas and NumPy.", style = "font-size: 1.05em; line-height: 1.8; color: #555;"),
                    br(),
                    p("My research interests lie at the intersection of computational biology and drug discovery. I am particularly fascinated by leveraging machine learning and artificial intelligence to solve complex biological problems. Whether it's unraveling cancer genomics, identifying novel drug targets, or analyzing large-scale sequencing data, I approach every challenge with curiosity and scientific rigor.", style = "font-size: 1.05em; line-height: 1.8; color: #555;"),
                    br(),
                    p("I actively seek collaboration opportunities on drug discovery projects, machine learning initiatives, research endeavors, and competitions. If you have an interesting project, research proposal, or just want to discuss bioinformatics and computational biology, I'd be delighted to connect!", style = "font-size: 1.05em; line-height: 1.8; color: #555;")
                )
              ),
              fluidRow(
                box(title = "Let's Collaborate", width = 12, status = "success", solidHeader = TRUE,
                    p("Interested in working together? I'm open to:", style = "font-weight: 600; margin-bottom: 15px;"),
                    div(style = "display: grid; grid-template-columns: 1fr 1fr; gap: 15px;",
                        div(
                          p("→ Drug discovery & molecular docking"),
                          p("→ Cancer research & genomics"),
                          p("→ Freelance bioinformatics consulting")
                        ),
                        div(
                          p("→ Machine learning in bioinformatics"),
                          p("→ Research collaborations & publications"),
                          p("→ Open science initiatives")
                        )
                    ),
                    br(),
                    p("Feel free to reach out via email or connect on social media!", style = "font-size: 1.05em;")
                )
              )
      ),
      
      # CERTIFICATIONS TAB
      tabItem(tabName = "certifications",
              fluidRow(
                box(width = 6, status = "primary", solidHeader = TRUE,
                    title = "Bioinformatics for Biologists",
                    p("Linux essentials, file system navigation, bash scripting for data processing, and R programming for biological data analysis.", style = "color: #666;"),
                    div(style = "margin-top: 15px; padding: 10px; background: #f0f0f0; border-left: 4px solid #667eea;",
                        strong("Skills Gained: "),
                        span("Linux • Bash • R • Data Processing")
                    )
                ),
                box(width = 6, status = "info", solidHeader = TRUE,
                    title = "Next Generation Sequencing",
                    p("NGS technology, data analysis pipelines, quality control, variant calling, and interpretation of genomic datasets.", style = "color: #666;"),
                    div(style = "margin-top: 15px; padding: 10px; background: #f0f0f0; border-left: 4px solid #17a2b8;",
                        strong("Skills Gained: "),
                        span("NGS • Bioinformatics • Genomics")
                    )
                )
              ),
              fluidRow(
                box(width = 6, status = "success", solidHeader = TRUE,
                    title = "Data Analysis with Python",
                    p("Python for data analysis with focus on Pandas library for data manipulation and statistical analysis.", style = "color: #666;"),
                    div(style = "margin-top: 15px; padding: 10px; background: #f0f0f0; border-left: 4px solid #28a745;",
                        strong("Skills Gained: "),
                        span("Python • Pandas • NumPy • Data Science")
                    )
                ),
                box(width = 6, status = "warning", solidHeader = TRUE,
                    title = "Complete Linux Training",
                    p("System administration, command-line tools, and scripting for high-performance computing environments.", style = "color: #666;"),
                    div(style = "margin-top: 15px; padding: 10px; background: #f0f0f0; border-left: 4px solid #ffc107;",
                        strong("Skills Gained: "),
                        span("Linux • HPC • System Admin")
                    )
                )
              )
      ),
      
      # TOOLS TAB
      tabItem(tabName = "tools",
              fluidRow(
                box(title = "Interactive Bioinformatics Tools", width = 12, status = "primary", solidHeader = FALSE,
                    p("Use these tools to perform common bioinformatics analyses directly in your browser.", style = "color: #666; font-size: 1.05em;")
                )
              ),
              fluidRow(
                box(width = 6, status = "primary", solidHeader = TRUE,
                    title = "Pairwise Sequence Alignment",
                    p("Compare biological sequences (DNA/Protein) and assess similarity"),
                    textAreaInput("seq1", "Sequence 1", placeholder = "Enter first sequence (A-Z only)", rows = 5),
                    textAreaInput("seq2", "Sequence 2", placeholder = "Enter second sequence (A-Z only)", rows = 5),
                    actionButton("alignBtn", "Run Alignment", icon = icon("dna"), class = "btn-primary", style = "width: 100%; padding: 10px;"),
                    br(), br(),
                    verbatimTextOutput("alignmentScore")
                ),
                box(width = 6, status = "info", solidHeader = TRUE,
                    title = "Ramachandran Plot",
                    p("Analyze protein 3D structure quality through dihedral angles"),
                    fileInput("pdbFile", "Upload PDB File", accept = ".pdb"),
                    actionButton("generatePlotBtn", "Generate Plot", icon = icon("chart-simple"), class = "btn-info", style = "width: 100%; padding: 10px;"),
                    br(), br(),
                    textOutput("plotStatus")
                )
              ),
              fluidRow(
                box(width = 6, status = "primary", solidHeader = TRUE,
                    title = "Alignment Results",
                    plotOutput("alignmentPlot", height = "400px")
                ),
                box(width = 6, status = "info", solidHeader = TRUE,
                    title = "Structure Analysis",
                    plotOutput("ramachandranPlot", height = "400px")
                )
              )
      ),
      
      # CONTACT TAB
      tabItem(tabName = "contact",
              fluidRow(
                box(width = 12, status = "primary", solidHeader = TRUE,
                    title = "Let's Connect",
                    div(style = "text-align: center; padding: 30px;",
                        h2("Get In Touch", style = "color: #667eea; margin-bottom: 30px;"),
                        p("I'd love to hear from you about potential collaborations, research opportunities, or just to chat about bioinformatics!", style = "font-size: 1.1em; color: #666; margin-bottom: 30px;")
                    )
                )
              ),
              fluidRow(
                box(width = 6, status = "info", solidHeader = TRUE,
                    title = "Contact Details",
                    div(style = "padding: 20px;",
                        div(style = "margin-bottom: 20px;",
                            h4("Email", style = "color: #17a2b8; margin-bottom: 10px;"),
                            p("shrivatsahegde62@gmail.com", style = "font-size: 1.1em; word-break: break-all;")
                        ),
                        div(
                            h4("Phone", style = "color: #17a2b8; margin-bottom: 10px;"),
                            p("+91 7899502822", style = "font-size: 1em;"),
                            p("+91 9739767884", style = "font-size: 1em;")
                        )
                    )
                ),
                box(width = 6, status = "success", solidHeader = TRUE,
                    title = "Connect on Social",
                    div(style = "padding: 20px;",
                        p("Find me on professional networks:", style = "font-weight: 600; margin-bottom: 15px;"),
                        p("→ LinkedIn • GitHub • Twitter • ResearchGate", style = "font-size: 1.05em;"),
                        br(),
                        p("I'm always open to discussing research, collaborating on projects, and exploring opportunities in bioinformatics!", style = "color: #666; font-style: italic;")
                    )
                )
              )
      )
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  # Sequence alignment logic
  observeEvent(input$alignBtn, {
    req(input$seq1, input$seq2)
    
    # Clean sequences: Allow only valid amino acids
    seq1_clean <- gsub("[^ARNDCQEGHILKMFPSTWYV]", "", toupper(input$seq1))
    seq2_clean <- gsub("[^ARNDCQEGHILKMFPSTWYV]", "", toupper(input$seq2))
    
    # Check if sequences are empty after filtering
    if (nchar(seq1_clean) == 0 || nchar(seq2_clean) == 0) {
      showNotification("Error: Invalid sequences. Only amino acids (A-Z) are allowed.", type = "error")
      return()
    }
    
    # Convert to AAString
    seq1 <- AAString(seq1_clean)
    seq2 <- AAString(seq2_clean)
    
    # Run pairwise alignment
    alignment <- pairwiseAlignment(seq1, seq2, type="global",
                                    substitutionMatrix=NULL, fuzzyMatrix=NULL,
                                    gapOpening=10, gapExtension=4,
                                    scoreOnly=FALSE)
    
    # Display alignment score
    output$alignmentScore <- renderText({
      paste("Alignment Score:", round(score(alignment), 2),
            "\nSequence 1 Length:", nchar(seq1_clean),
            "\nSequence 2 Length:", nchar(seq2_clean))
    })
    
    # Render alignment as a plot
    output$alignmentPlot <- renderPlot({
      aligned_seq1 <- pattern(alignment)
      aligned_seq2 <- subject(alignment)
      
      plot.new()
      plot.window(xlim = c(0, 1), ylim = c(0, 1))
      text(0.05, 0.6, labels = paste("Query:  ", as.character(aligned_seq1)), 
           col = "blue", cex = 0.8, family = "monospace", adj = 0)
      text(0.05, 0.3, labels = paste("Subject:", as.character(aligned_seq2)), 
           col = "red", cex = 0.8, family = "monospace", adj = 0)
      text(0.5, 0.85, labels = paste("Alignment Score:", round(score(alignment), 2)), 
           cex = 1, font = 2)
    })
  })
  
  # Ramachandran plot logic
  observeEvent(input$generatePlotBtn, {
    req(input$pdbFile)
    
    tryCatch({
      pdb <- read.pdb(input$pdbFile$datapath)
      torsion <- torsion.pdb(pdb)
      
      output$plotStatus <- renderText("Plot generated successfully!")
      
      output$ramachandranPlot <- renderPlot({
        plot(torsion$phi, torsion$psi, 
             xlab = "Phi Angle (°)", ylab = "Psi Angle (°)",
             main = "Ramachandran Plot",
             xlim = c(-180, 180), ylim = c(-180, 180),
             pch = 19, col = rgb(0, 0, 1, 0.5), cex = 1.5)
        
        abline(h = 0, col = "gray", lty = 2, lwd = 1)
        abline(v = 0, col = "gray", lty = 2, lwd = 1)
        grid()
      })
    }, error = function(e) {
      output$plotStatus <- renderText(paste("Error:", e$message))
    })
  })
}

# Run the application
shinyApp(ui = ui, server = server)
