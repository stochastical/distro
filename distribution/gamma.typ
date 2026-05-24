#import calc: exp, pi, pow, sqrt
#import "../function/gamma.typ": gamma, gamma-lr

/// Gamma distribution
///
/// - shape (int, float): $alpha>0$
/// - rate (int, float): $beta>0$
/// -> dictionary
#let new(shape: 1.0, rate: 1.0) = {
  let (α, β) = (shape, rate)
  assert(α > 0, message: "Shape parameter " + str(α) + " must be positive.")
  assert(β > 0, message: "Rate parameter " + str(β) + " must be positive.")
  (
    α: α,
    β: β,
    mean: α / β,
    variance: α / pow(β, 2),
  )
}

/// Gamma distribution PDF
///
/// $f(x; alpha, beta) = (x^(alpha-1) e^(-beta x) beta^alpha) / Gamma(alpha)$
/// - alpha (float): shape parameter
/// - beta (float): rate parameter
/// -> function
// #let pdf(α, β) = {
//   x => pow(x, α - 1) * exp(-x * β) * pow(β, α) / gamma(α)
// }
#let pdf((α: α, β: β)) = {
  x => pow(x, α - 1) * exp(-x * β) * pow(β, α) / gamma(α)
}

/// Regularised lower incomplete gamma CDF
/// $F(x; alpha, beta) = P(alpha, beta x)$
/// - alpha (float): shape parameter
/// - beta (float): rate parameter (= 1/scale)
/// -> function
#let cdf((α: α, β: β)) = {
  x => gamma-lr(α, β * x)
}
