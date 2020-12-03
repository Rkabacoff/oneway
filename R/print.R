#' Print one-way ANOVA results
#'
#' print.oneway prints one-way ANOVA results
#'
#' @param x an object of class oneway.
#' @param ... additional arguments passed to the function.
#'
#' @return the input object is returned silently
#' @export
#' @examples
#' fit <- oneway(mpg ~ cyl, mtcars)
#' print(fit)
print.oneway <- function(x, ...){

  if(!inherits(x, "oneway"))
    stop("Must be class 'oneway")

  cat("\nSummary Statistics\n")
  cat("======================\n")
  print(x$summarystats, ...)
  cat("\nANOVA\n")
  cat("======================\n")
  print(summary.lm(x$anova))
}
