# Script to create a bibliography file for LaTeX with natbib
# This script compiles references from your .bib files and creates a references.bib file

library(dplyr)
library(stringr)

# Set working directory to Lit folder
lit_dir <- "Lit"

# Function to parse a .bib file
parse_bib_file <- function(filepath) {
  tryCatch({
    lines <- readLines(filepath, warn = FALSE)
    
    # Find all entries
    entry_starts <- grep("^@", lines)
    
    if (length(entry_starts) == 0) {
      return(NULL)
    }
    
    refs <- list()
    
    for (i in seq_along(entry_starts)) {
      start <- entry_starts[i]
      end <- if (i < length(entry_starts)) entry_starts[i + 1] - 1 else length(lines)
      
      entry_lines <- lines[start:end]
      
      # Extract key
      key_match <- str_match(entry_lines[1], "^@\\w+\\{([^,]+),")
      key <- if (!is.na(key_match[1, 2])) key_match[1, 2] else NA
      
      # Extract entry type
      type_match <- str_match(entry_lines[1], "^@(\\w+)")
      entry_type <- if (!is.na(type_match[1, 2])) type_match[1, 2] else "article"
      
      # Store the full entry
      refs[[key]] <- list(
        type = entry_type,
        lines = entry_lines
      )
    }
    
    return(refs)
  }, error = function(e) {
    cat("Error reading", filepath, ":", e$message, "\n")
    return(NULL)
  })
}

# Get all .bib files
bib_files <- list.files(lit_dir, pattern = "\\.bib$", full.names = TRUE)

cat("Found", length(bib_files), ".bib files\n\n")

# Read all .bib files
all_refs <- list()
for (file in bib_files) {
  refs <- parse_bib_file(file)
  if (!is.null(refs)) {
    all_refs <- c(all_refs, refs)
  }
}

cat("Successfully parsed", length(all_refs), "references\n\n")

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

cat("Key papers to include:\n")
for (i in seq_along(key_papers)) {
  cat(sprintf("%2d. %s\n", i, key_papers[i]))
}

cat("\n\nCreating references.bib file...\n")

# Create the references.bib file
bib_output <- file("references.bib", "w")

# Write all references
for (key in names(all_refs)) {
  ref <- all_refs[[key]]
  cat(paste(ref$lines, collapse = "\n"), "\n\n", file = bib_output, sep = "")
}

close(bib_output)

cat("Created references.bib with", length(all_refs), "references\n\n")

# Create a template for citing in LaTeX
cat("===========================================\n")
cat("LATEX CITATION TEMPLATE\n")
cat("===========================================\n\n")

cat("How to cite in LaTeX:\n")
cat("  - Single citation: \\citep{key} or \\citet{key}\n")
cat("  - Multiple citations: \\citep{key1,key2,key3}\n")
cat("  - Year only: \\citeyear{key}\n")
cat("  - Author only: \\citeauthor{key}\n\n")

cat("Example:\n")
cat("  \\citep{dietvorst2015} for (Dietvorst et al., 2015)\n")
cat("  \\citet{dietvorst2015} for Dietvorst et al. (2015)\n\n")

cat("Next steps:\n")
cat("1. Review references.bib to see all available references\n")
cat("2. Select 30-40 most relevant papers for your paper\n")
cat("3. Use \\citep{} and \\citet{} commands in your LaTeX document\n")
cat("4. Compile with pdflatex, bibtex, pdflatex, pdflatex\n")