#import calc: pow

/// $f(x) = (1-p)^(x-1)p$
#let pmf((p: p)) = {
  x => {
    if x == 0.0 {
      0.0
    } else {
      pow(1 - p, x - 1) * p
    }
  }
}

/// $F(x) = 1 - (1-p)^x$
#let cdf((p: p)) = {
  x => {
    if x == 0.0 {
      0.0
    } else {
      1 - pow(1 - p, x)
    }
  }
}

#let Geometric(p) = {
  assert(p > 0 and p < 1, message: "The probability of success " + str(p) + " must be in the interval (0, 1).")
  (
    p: p,
    // pmf: pmf(p),
    // cdf: cdf,
    mean: 1 / p,
    variance: (1 - p) / pow(p, 2),
  )
}

// Example:
#pmf((p: 0.2))