#' Post-hoc comparisons
#'
#' Create a function the tests for group differences, two groups at a time using post-hoc comparisons.
#'
#' @param model an object of class `oneway`
#'
#' @return a data frame and a visualization
#' @examples
#' /dontrun{
#' fit <- oneway(mpg ~ cyl, mtcars)
#' posthoc(fit)
#' }

posthoc <- function(model){
  var2 = model$anova$terms[[3]]
  a <- aov(model$anova$terms,model$anova$model)
  b <- TukeyHSD(a1)
  plt = plot(TukeyHSD(a), las = 1, col = "red")
  as.data.frame(b[[var2]])
}


