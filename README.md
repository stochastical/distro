# `typst-stats`

Defines common probability distributions and their associated functions (pdf, cdf, mean, variance, etc.) directly in [`Typst`](https://typst.app).

> [!WARNING]
> This library is still in early development, and the API is likely to change. Use with caution.
> The numerical computations are heavily inspired by the [`statrs`](https://github.com/statrs-dev/statrs) Rust crate.

# Installation

This package is currently not packaged for [Typst Universe](https://typst.app/universe/), but will be once it stabilises a bit more.
In the meantime, you can just grab the code directly from here.

# Usage

```typst
#import calc: sqrt
#import "./lib.typ": normal.Normal
#import "./lib.typ": *

#{
  let Z = Normal(mean: 0, std: 1)
  assert((Z.mean, Z.variance) == (0, 1))
  assert(normal.pdf(Z)(0) == 1 / sqrt(2 * calc.pi))
}
```

Since Typst doesn't (currently) support custom objects and methods, you must pass the instance of the distribution variable into the associated `pdf` or `cdf` function.
The `Normal` function acts as a constructor, validating the paramaters, and returning a `dictionary` that stores the mean and variance.

## Discrete distributions

- Binomial distribution
- Bernoulli distribution
- Geometric distribution
- Poisson distribution
- Discrete uniform distribution

## Continuous distributions

- Beta distribution
- Continuous uniform distribution
- Exponential distribution
- Gamma distribution
- Normal distribution
