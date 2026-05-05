#import calc: pi, pow, exp, sqrt

#let gamma(z) = {
  sqrt(2 * pi) * pow(z, z - 0.5) * exp(-z)
}

#let pdf(alpha, beta) = {
  x => pow(x, alpha - 1) * exp(-x * beta) * pow(beta, alpha) / gamma(alpha)
}
