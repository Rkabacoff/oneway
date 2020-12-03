#' Summarize one-way ANOVA
#'
#' summary.oneway summarizes the results of the one-way ANOVA
#'
#' @param object an object of class oneway.
#' @param ... additional options. not currently used.
#' @export
#'
#' @return object of type anova and data.frame
#' @examples
#' fit <- oneway(mpg ~ cyl, mtcars)
#' summary(fit)
summary.oneway <- function(object, ...){
  if(!inherits(object, "oneway"))
    stop("Must be class 'oneway")
  anova(object$anova)
}


