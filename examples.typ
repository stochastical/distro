#import "@preview/simple-plot:0.3.0": line-plot, plot, scatter
#import "./lib.typ": (
  continuous_uniform.ContinuousUniform, discrete_uniform.DiscreteUniform, exponential.Exponential, gamma.Gamma,
  normal.Normal, poisson.Poisson, geometric.Geometric, binomial.Binomial, exponential.Exponential, gamma.Gamma,
  discrete_uniform.DiscreteUniform, continuous_uniform.ContinuousUniform, beta.Beta, bernoulli.Bernoulli,
)
#import "./lib.typ": *

= Distributions

== Discrete distributions

#table(
  columns: (auto, auto, auto),
  // inset: 10pt,
  align: horizon,
  table.header([*Distribution*], [*PMF*], [*CDF*]),
  [Uniform],
  [
    #let Unif = discrete_uniform.DiscreteUniform(0.0, 4.0)
    #let points = range(0, 5).map(i => scatter(((i, discrete_uniform.pmf(Unif)(i)),)))
    #plot(
      width: 5,
      height: 5,
      xmin: -1,
      xmax: 5,
      ymin: 0,
      ymax: 1.1,
      axis-y-extend: 0,
      ..points,
    )
  ],
  [
    #let Unif = discrete_uniform.DiscreteUniform(0.0, 4.0)
    #let points = range(0, 5).map(i => scatter(((i, discrete_uniform.cdf(Unif)(i)),)))
    #plot(
      width: 5,
      height: 5,
      xmin: -1,
      xmax: 5,
      ymin: 0,
      ymax: 1.1,
      axis-y-extend: 0,
      ..points,
    )
  ],

  [Bernoulli],
  [
    #let Be = Bernoulli(0.8)
    #plot(
      width: 4,
      height: 4,
      xmin: 0,
      xmax: 1.4,
      ymin: 0,
      ymax: 1,
      xlabel: $k$,
      ylabel: $p(k)= cases(1-Be.p &"if" k = 0, Be.p &"if" k = 1)$,
      axis-y-extend: 0,
      axis-x-extend: 0,
      scatter(
        ((0, bernoulli.pmf(Be)(0)),),
        label: $1-p=#{ calc.round(1 - Be.p, digits: 2) }$,
        label-anchor: "south-west",
      ),
      scatter(
        ((1, bernoulli.pmf(Be)(1)),),
        label: $p=#{ calc.round(Be.p, digits: 2) }$,
        label-anchor: "south",
      ),
    )
  ],
  [
    #let Be = Bernoulli(0.8)
    #plot(
      width: 4,
      height: 4,
      xmin: -0.5,
      xmax: 1.5,
      ymin: 0,
      ymax: 1.1,
      xlabel: $k$,
      ylabel: $F(k) = cases(0 &"if" k < 0, 1-p &"if" 0 <= k < 1, 1 &"if" k >= 1)$,
      axis-y-extend: 0,
      axis-x-extend: 0,
      scatter(
        ((0, bernoulli.cdf(Be)(0)),),
        label: $1-p=#{ calc.round(1 - Be.p, digits: 2) }$,
        label-anchor: "south-west",
      ),
      scatter(
        ((1, bernoulli.cdf(Be)(1)),),
        label: $p=#{ calc.round(Be.p, digits: 2) }$,
        label-anchor: "south",
      ),
    )
  ],

  [Binomial],
  [
    #let Bi = Binomial(10, 0.3)

    #let points = range(0, Bi.n + 1).map(i => scatter(((i, binomial.pmf(Bi)(i)),)))
    #let ymax = 1.2 * points.map(p => p.points.at(0).at(1)).reduce((acc, x) => calc.max(acc, x))

    #plot(
      width: 4,
      height: 4,
      xmin: 0,
      xmax: Bi.n,
      ymin: 0,
      ymax: ymax,
      xlabel: $k$,
      // ylabel-pos: ,
      ylabel: $p(k) = binom(n, k) p^k (1-p)^(n-k)$,
      axis-y-extend: 0,
      ..points,
    )],

  [
    #let Bi = Binomial(10, 0.3)

    #let points = range(0, Bi.n + 1).map(i => scatter(((i, binomial.cdf(Bi)(i)),)))
    #let ymax = 1.2 * points.map(p => p.points.at(0).at(1)).reduce((acc, x) => calc.max(acc, x))
    #plot(
      width: 4,
      height: 4,
      xmin: 0,
      xmax: Bi.n,
      ymin: 0,
      ymax: ymax,
      xlabel: $k$,
      // ylabel-pos: ,
      ylabel: $F(k) = sum_(i=0)^(k) p(i)$,
      axis-y-extend: 0,
      ..points,
    )
  ],

  [Geometric],
  [
    #let Ge = geometric.Geometric(0.2)
    #plot(
      width: 4,
      height: 4,
      xmin: 0,
      xmax: 10,
      ymin: 0,
      ymax: 0.3,
      xlabel: $k$,
      ylabel: $p(k) = (1-p)^(k-1)p$,
      axis-y-extend: 0,

      //  ..range(0, 9).map(i => scatter(((i, (Ge.pmf)(i)),))),
      ..range(0, 9).map(i => scatter(((i, geometric.pmf(Ge)(i)),))),
      // (fn: geometric.pmf(0.2), label: $p=0.2$, label-pos: 0.1, label-side: "below-left"),
      // (fn: geometric.pmf(0.5), label: $p=0.5$, label-pos: 0.01, label-side: "left"),
      // (fn: geometric.pmf(0.8), label: $p=0.8$, label-pos: 0.1, label-side: "right"),
    )
  ],

  [
    #let Ge = geometric.Geometric(0.2)
    #plot(
      width: 4,
      height: 4,
      xmin: 0,
      xmax: 10,
      ymin: 0,
      ymax: 1,
      xlabel: $k$,
      ylabel: $F(k) = 1 - (1-p)^k$,

      axis-y-extend: 0,
      ..range(0, 9).map(i => scatter(((i, geometric.cdf(Ge)(i)),))),
      // (fn: geometric.cdf(0.2), label: $p=0.2$, label-pos: 0.5, label-side: "below-right"),
      // (fn: geometric.cdf(0.5), label: $p=0.5$, label-pos: 0.5, label-side: "below-right"),
      // (fn: geometric.cdf(0.8), label: $p=0.8$, label-pos: 0.5, label-side: "above-right"),
    )
  ],

  [Poisson],
  [
    #let Pois = Poisson(rate: 3)

    #let n = 11
    // #let points = range(0, n).map(i => scatter(((i, Pois(i)),)))
    #let points = range(0, n).map(i => scatter(((i, poisson.pmf(Pois)(i)),)))
    #let ymax = 1.2 * points.map(p => p.points.at(0).at(1)).reduce((acc, x) => calc.max(acc, x))

    #plot(
      width: 4,
      height: 4,
      xmin: 0,
      xmax: n,
      ymin: 0,
      ymax: ymax,
      xlabel: $k$,
      ylabel: $f(k) = (lambda^k e^(-lambda)) / k!$,
      axis-y-extend: 0,
      ..points,
    )
  ],
  [
    #let Pois = Poisson(rate: 3)
    #let n = 10
    #let points = range(0, n + 1).map(i => scatter(((i, poisson.cdf(Pois)(i)),)))
    #let ymax = 1.2 * points.map(p => p.points.at(0).at(1)).reduce((acc, x) => calc.max(acc, x))
    #plot(
      width: 4,
      height: 4,
      xmin: 0,
      xmax: n,
      ymin: 0,
      ymax: ymax,
      xlabel: $k$,
      ylabel: $F(k) = sum_(i=0)^(k) p(i)$,
      axis-y-extend: 0,
      ..points,
    )
  ],
)

#pagebreak()

== Continuous distributions

#table(
  columns: (auto, auto, auto),
  // inset: 10pt,
  align: horizon,
  table.header([*Distribution*], [*PMF*], [*CDF*]),
  [Normal],
  [
    #let Z = Normal(mean: 0, std: 3)
    #plot(
      width: 5,
      height: 5,
      xmin: -5,
      xmax: 5,
      ymin: 0,
      ymax: 0.5,
      axis-y-extend: 0,
      (fn: normal.pdf(Z)),
    )
  ],
  [
    #let Z = Normal(mean: 0, std: 1)
    #plot(
      width: 5,
      height: 5,
      xmin: -4,
      xmax: 4,
      ymin: 0,
      ymax: 1.1,
      axis-y-extend: 0,
      (fn: normal.cdf(Z)),
    )
  ],

  [Uniform],
  [
    #let Unif = ContinuousUniform(0.0, 1.0)
    #plot(
      width: 5,
      height: 5,
      xmin: -1,
      xmax: 2,
      ymin: 0,
      ymax: 1.1,
      axis-y-extend: 0,
      (fn: continuous_uniform.pdf(Unif)),
    )
  ],
  [
    #let Unif = ContinuousUniform(0.0, 1.0)
    #plot(
      width: 5,
      height: 5,
      xmin: -1,
      xmax: 2,
      ymin: 0,
      ymax: 1.1,
      axis-y-extend: 0,
      (fn: continuous_uniform.cdf(Unif)),
    )
  ],

  [Beta],
  [
    #let X = Beta(alpha: 2, beta: 3)
    #plot(
      width: 5,
      height: 5,
      xmin: -0.5,
      xmax: 1.5,
      ymin: 0,
      ymax: 2.5,
      axis-y-extend: 0,
      (fn: beta.pdf(X)),
    )
  ],
  [
    #let X = Beta(alpha: 2, beta: 3)
    #plot(
      width: 5,
      height: 5,
      xmin: -0.5,
      xmax: 1.5,
      ymin: 0,
      ymax: 1.1,
      axis-y-extend: 0,
      (fn: beta.cdf(X)),
    )
  ],

  [Exponential],
  [
    #let Exp = Exponential(1)
    #plot(
      width: 5,
      height: 5,
      xmin: 0,
      xmax: 5,
      ymin: 0,
      ymax: 1.1,
      axis-y-extend: 0,
      (fn: exponential.pdf(Exp)),
    )
  ],
  [
    #let Exp = Exponential(1)
    #plot(
      width: 5,
      height: 5,
      xmin: 0,
      xmax: 5,
      ymin: 0,
      ymax: 1.1,
      axis-y-extend: 0,
      (fn: exponential.cdf(Exp)),
    )
  ],

  [Gamma],
  [
    #let X = Gamma(shape: 2, rate: 0.5)
    #plot(
      width: 5,
      height: 5,
      xmin: 0,
      xmax: 10,
      ymin: 0,
      ymax: 0.2,
      axis-y-extend: 0,
      (fn: gamma.pdf(X)),
    )
  ],
  [
    #let X = Gamma(shape: 2, rate: 0.5)
    #plot(
      width: 5,
      height: 5,
      xmin: 0,
      xmax: 10,
      ymin: 0,
      ymax: 1.1,
      axis-y-extend: 0,
      (fn: gamma.cdf(X)),
    )
  ],
)
