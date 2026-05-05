#import calc: exp, pi, pow, sqrt

/// Gamma function approximation using Stirling's formula
///
/// - z (float):
/// -> float
#let gamma(z) = {
  sqrt(2 * pi) * pow(z, z - 0.5) * exp(-z)
}
