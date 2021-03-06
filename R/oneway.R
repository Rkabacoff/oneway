#' One Way Analysis of Variance
#'
#' oneway computes a one-way analysis of variance
#' and includes group level summary statistics.
#'
#' @param formula an object of class formula, relating the
#' dependent variable to the grouping variable.
#' @param data a data frame containing the variables in the model.
#' @import dplyr
#' @export
#' @return a list with 2 elements.
#'
#' @examples
#' fit <- oneway(mpg ~ cyl, mtcars)
#' summary(fit)
#' assumptions(fit)
#' plot(fit)
#' posthoc(fit)
oneway <- function(formula, data){

  # make sure group variable is factor
  group <- as.character(formula[[3]])
  data[[group]] <- as.factor(data[[group]])

  #anova
  fit <- lm(formula, data)

  # summary statistics
  y <- as.character(formula[[2]])

  stats <-  data %>%
    group_by(.data[[group]]) %>%
    summarise(n = n(),
              mean = mean(.data[[y]]),
              sd = sd(.data[[y]])) %>%
    as.data.frame()

  # return results
  result <- list(anova = fit, summarystats = stats)
  class(result) <- "oneway"
  return(result)
}


