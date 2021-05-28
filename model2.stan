data {
  int <lower = 1> n;
  vector[n] x;
  vector[n] y;
  real true_beta;
}
parameters {
  real alpha;
  real beta;
}
model {
  profile("likelihood") {
    y ~ normal(alpha + x * beta, 1);
  }
  profile("priors") {
    alpha ~ normal(0, 1);
    beta ~ normal(0, 1);
  }
}
