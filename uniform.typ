#let pdf(a, b) = {
  x => {
    if x < a or x > b {
      0.0
    } else {
      1 / (b - a)
    }
  }
}

#let cdf(a, b) = {
  x => {
    if x < a {
      0.0
    } else if x > b {
      1.0
    } else {
      (x - a) / (b - a)
    }
  }
}

// Examples
#pdf(0, 1)(0.5)

#pdf(0, 1)(-1)

#pdf(0, 1)(2)
