#' Oneway ANOVA Report
#'
#' Create an HTML ANOVA report
#'
#' @param formula an object of class formula, relating the
#' dependent variable to the grouping variable.
#' @param data a data frame containing the variables in the model.
#' @param browse logical. If \code{FALSE} display report in Rstudio
#' instead of browser.
#'
#' @return path to HTML report
#' @export
#' @examples
#' report(mpg ~ cyl, mtcars)
report <- function(formula, data, browse=TRUE){
  formula <- deparse(substitute(formula))
  data <- deparse(substitute(data))

  # read template file and modify
  report <- readLines(system.file("oneway_template.txt",
                                  package="oneway"))

  report <- gsub("xxxformula", formula, report, fixed = TRUE)
  report <- gsub("xxxdata", data, report, fixed = TRUE)

  # output template and render
  tf <- tempfile(fileext = ".Rmd")
  to <- tempfile(fileext = ".html")
  writeLines(report, tf)

  # generate the report
  library(rmarkdown)
  render(input=tf, output_format="html_document", output_file=to)
  if (browse){
    file.show(to)
  } else {
    viewer <- getOption("viewer")
    viewer(to)
  }
  invisible(to)
}
