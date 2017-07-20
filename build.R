build <- function(ignore.path = "docs", quiet = TRUE){
    fls <- dir(pattern = "*.rmd$", recursive = TRUE, ignore.case = TRUE)
    if(length(fls) == 0){ stop("No .Rmd file found") }
    fls <- grep(ignore.path, fls, value = TRUE, invert = TRUE)
    fls <- normalizePath(fls)
    fls.out <- gsub("\\.[Rr]md$", ".md", fls)
    for(i in 1:length(fls)){
        knitr::knit(input = fls[i], output = fls.out[i], quiet = quiet)
    }
}
