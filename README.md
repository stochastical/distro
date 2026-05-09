# `distro`

Defines common probability distributions and their associated functions (pdf, cdf, mean, variance, etc.) in pure [`Typst`](https://typst.app).

> [!WARNING]
> This library is still in early development, please use with caution. Typst is not designed for robust statistical use, and built-in functions like `calc.binom` overflow quickly.
> The numerical computations are heavily inspired by the [`statrs`](https://github.com/statrs-dev/statrs) Rust crate.

# Installation

This package is currently not packaged for [Typst Universe](https://typst.app/universe/), but will be once it stabilises a bit more.
In the meantime, you can just grab the code directly from here.

# Usage

```typst
#import calc: sqrt, pi
#import "@preview:distro": normal

#{
  let Z = normal.new(mean: 0, std: 1)
  assert((Z.mean, Z.variance) == (0, 1))
  assert(normal.pdf(Z)(0) == 1 / sqrt(2 * pi))
}
```

Since Typst doesn't (currently) support custom objects and methods, you must pass the instance of the distribution variable into the associated `pdf` or `cdf` function.
The `new` function acts as a constructor, validating the paramaters, and returning a `dictionary` that stores the mean and variance.

## Discrete distributions

- [`Binomial`](/distribution/binomial.typ)
- [`Bernoulli`](/distribution/bernoulli.typ)
- [`Geometric`](/distribution/geometric.typ)
- [`Poisson`](/distribution/poisson.typ)
- [`DiscreteUniform`](/distribution/discrete-uniform.typ)

## Continuous distributions

- [`Beta`](/distribution/beta.typ)
- [`ContinuousUniform`](/distribution/continuous-uniform.typ)
- [`Exponential`](/distribution/exponential.typ)
- [`Gamma`](/distribution/gamma.typ)
- [`Normal`](/distribution/normal.typ)
