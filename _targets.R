# _targets.R
library(targets)
library(tarchetypes)
library(stantargets)

generate_data <- function(n) {
  true_beta <- stats::rnorm(n = 1, mean = 0, sd = 1)
  x <- seq(from = -1, to = 1, length.out = n)
  y <- stats::rnorm(n, x * true_beta, 1)
  list(n = n, x = x, y = y, true_beta = true_beta)
}

list(
  tar_stan_mcmc(
    example,
    "model.stan",
    data = generate_data(20),
  ), 
  tar_render(report, "report.Rmd")
)
