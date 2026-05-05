#import calc: pow
#import "../function/gamma.typ": gamma, ln_gamma
#import "../function/beta.typ": beta_reg

#let pdf(alpha, beta) = {
  x => {
    if x < 0.0 or x > 1.0 {
      0.0
    } else if alpha == 1.0 and beta == 1.0 {
      1.0
    } else if alpha > 80.0 or beta > 80.0 {
      exp(ln_pdf(alpha, beta)(x))
    } else {
      let bb = gamma(alpha + beta) / (gamma(alpha) * gamma(beta))
      bb * pow(x, alpha - 1.0) * pow(1.0 - x, beta - 1.0)
    }
  }
}

#let ln_pdf(alpha, beta) = {
  x => {
    if x < 0.0 or x > 1.0 {
      -float.inf
    } else if alpha == 1.0 and beta == 1.0 {
      0.0
    } else {
      let aa = ln_gamma(alpha + beta) - ln_gamma(alpha) - ln_gamma(beta)
      let bb = if alpha == 1.0 and x == 0.0 {
        0.0
      } else if x == 0.0 {
        -float.inf
      } else {
        (alpha - 1.0) * ln(x)
      }
      let cc = if beta == 1.0 and x == 1.0 {
        0.0
      } else if x == 1.0 {
        -float.inf
      } else {
        (beta - 1.0) * ln(1.0 - x)
      }
      aa + bb + cc
    }
  }
}


#let cdf(alpha, beta) = {
  x => {
    if x < 0.0 {
      0.0
    } else if x >= 1.0 {
      1.0
    } else if alpha == 1.0 and beta == 1.0 {
      x
    } else {
      beta_reg(alpha, beta)(x)
    }
  }
}