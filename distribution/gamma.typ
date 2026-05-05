#import calc: exp, pi, pow, sqrt
#import "../function/gamma.typ": gamma

/// Gamma distribution PDF
///
/// $f(x; alpha, beta) = (x^(alpha-1) e^(-beta x) beta^alpha) / Gamma(alpha)$
/// - alpha (float): shape parameter
/// - beta (float): rate parameter
/// -> function
#let pdf(alpha, beta) = {
  x => pow(x, alpha - 1) * exp(-x * beta) * pow(beta, alpha) / gamma(alpha)
}
