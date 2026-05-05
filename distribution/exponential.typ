#import calc: exp

/// Exponential distribution PDF
///
/// $f(x; lambda) = lambda e^(-lambda x),  x >= 0$
/// - lambda (float): Rate parameter
/// -> float
#let pdf(lambda) = {
  assert(lambda > 0, message: "Rate parameter $lambda$ must be $> 0$ ")
  x => {
    if x < 0.0 {
      0.0
    } else {
      lambda * exp(-lambda * x)
    }
  }
}

/// Exponential distribution CDF
///
/// $F(x; lambda) = 1 - e^(-lambda x),  x >= 0$
/// - lambda (float): Rate parameter
/// -> float
#let cdf(lambda) = {
  assert(lambda > 0, message: "Rate parameter $lambda$ must be $> 0$ ")
  x => {
    if x < 0.0 {
      0.0
    } else {
      1.0 - exp(-lambda * x)
    }
  }
}
