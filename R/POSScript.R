# For the script to work follow the follwoing steps:
# 1. download tagger repository from here https://github.com/ItsRRM97/tagger
# 2. download as zip or clone the repostiory
# 3. Open the zip/ project after extracting using RStudio
# source('POSScript.R') run this on the console.
if (!require("pacman")) install.packages("pacman")
pacman::p_load_gh(c(
  "trinker/termco", 
  "trinker/coreNLPsetup",        
  "trinker/tagger"
))
# installing dependencies
library(dplyr)
library(tagger)
library(pdftools)
library(rjson)
library(jsonlite)
#specify the file path here
text <- as.character(pdf_text("./resume.pdf"))
words  <- as.character(strsplit(text, "\n"))
words  <- as.character(strsplit(text, "\r"))
result <- tag_pos(words) %>% select_tags(c("NN","NNP","NNPS","NNS","PRP","PRP$")) %>% as_universal()
vecresult <- c(result)
thejson <- toJSON(vecresult, pretty = TRUE)
write(thejson, "file.json")
