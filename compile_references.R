# Script to compile and organize references for the paper
# This script will extract citation information from your literature files

library(bibtex)
library(dplyr)
library(stringr)

# Set working directory to Lit folder
lit_dir <- "Lit"

# Function to read .bib files
read_bib_file <- function(filepath) {
  tryCatch({
    bib <- read.bib(filepath)
    data.frame(
      key = names(bib),
      title = sapply(bib, function(x) x$title),
      author = sapply(bib, function(x) {
        if (!is.null(x$author)) {
          paste(x$author, collapse = " & ")
        } else {
          NA
        }
      }),
      journal = sapply(bib, function(x) {
        if (!is.null(x$journal)) {
          x$journal
        } else {
          NA
        }
      }),
      year = sapply(bib, function(x) {
        if (!is.null(x$year)) {
          x$year
        } else {
          NA
        }
      }),
      stringsAsFactors = FALSE
    )
  }, error = function(e) {
    cat("Error reading", filepath, ":", e$message, "\n")
    return(NULL)
  })
}

# Get all .bib files
bib_files <- list.files(lit_dir, pattern = "\\.bib$", full.names = TRUE)

cat("Found", length(bib_files), ".bib files\n\n")

# Read all .bib files
all_refs <- do.call(rbind, lapply(bib_files, read_bib_file))

if (!is.null(all_refs) && nrow(all_refs) > 0) {
  # Clean up the data
  all_refs <- all_refs %>%
    mutate(
      title = str_replace_all(title, "\\{|\\}", ""),
      author = str_replace_all(author, "\\{|\\}", ""),
      journal = str_replace_all(journal, "\\{|\\}", "")
    )
  
  # Sort by year (newest first)
  all_refs <- all_refs %>%
    arrange(desc(year))
  
  # Save as CSV for easy viewing
  write.csv(all_refs, "references_summary.csv", row.names = FALSE)
  
  cat("Successfully compiled", nrow(all_refs), "references\n")
  cat("Saved to: references_summary.csv\n\n")
  
  # Print summary by year
  cat("References by year:\n")
  print(table(all_refs$year))
  
  # Print top 20 most recent
  cat("\n\nTop 20 most recent references:\n")
  print(head(all_refs, 20))
  
} else {
  cat("No references found or error reading files\n")
}

# Create a template reference list in APA format
cat("\n\n===========================================\n")
cat("REFERENCE LIST TEMPLATE (APA FORMAT)\n")
cat("===========================================\n\n")

# Key papers to include (based on Literature_Organization.md)
key_papers <- c(
  "Dietvorst et al. (2015) - Algorithm aversion",
  "Logg et al. (2019) - Algorithm appreciation",
  "Lee & See (2004) - Trust vs. reliance",
  "Kohn et al. (2021) - Trust measurement",
  "Glikson & Woolley (2020) - MABA-HABA framework",
  "Klingbeil et al. (2024) - Style reference",
  "Castelo et al. (2019) - Task-dependent aversion",
  "Holzmeister et al. (2023) - Delegation in finance",
  "Longoni et al. (2019) - Medical AI, personalization",
  "Jussupow et al. (2020) - Algorithm aversion review",
  "Schaap et al. (2023) - Benefits and control",
  "Hoff & Bashir (2015) - Trust factors",
  "Dohmen et al. (2011) - Risk attitudes",
  "Franke et al. (2019) - Technology affinity",
  "Morewedge (2022) - Theoretical framework"
)

cat("Key papers to cite:\n")
for (i in seq_along(key_papers)) {
  cat(sprintf("%2d. %s\n", i, key_papers[i]))
}

cat("\n\nNext steps:\n")
cat("1. Review references_summary.csv to see all available references\n")
cat("2. Select 30-40 most relevant papers for your paper\n")
cat("3. Format them in APA style for the reference list\n")
cat("4. Use the Literature_Organization.md to organize them by theme\n")