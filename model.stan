data {
  int <lower = 1> n;
  vector[n] x;
  vector[n] y;
  real true_beta;
}
parameters {
  real beta;
}
model {
  profile("likelihood") {
    y ~ normal(x * beta, 1);
  }
  profile("priors") {
    beta ~ normal(0, 1);
  }
}