#import calc: exp, fact, floor, pow
#import "../function/gamma.typ": gamma_ur

#let Poisson(rate: 0.0) = {
  assert(rate >= 0.0, message: "Rate parameter " + str(rate) + " must be non-negative")
  (λ: rate, mean: rate, variance: rate)
}

#let pmf((λ: λ)) = {
  k => {
    assert(k >= 0.0, message: "Poisson distribution is only defined for non-negative integers")
    pow(λ, k) * exp(-λ) / fact(k)
  }
}

#let cdf((λ: λ)) = {
  k => {
    assert(k >= 0.0, message: "Poisson distribution is only defined for non-negative integers")
    gamma_ur(k + 1.0, λ)
  }
}

// Examples
#let P = Poisson(rate: 3)

#cdf(P)(2)

#(P.mean, P.variance)

