library(targets)
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
    c("model1.stan", "model2.stan"),
    data = generate_data(20),
  ), 
  tar_stan_summary(
    summary1,
    fit = example_mcmc_model1,
    summaries = list(~posterior::quantile2(.x, probs = c(0.25, 0.75)))
  ), 
  tar_stan_summary(
    summary2,
    fit = example_mcmc_model2,
    summaries = list(~posterior::quantile2(.x, probs = c(0.25, 0.75)))
  )
)
