#import "@preview/simple-plot:0.3.0": plot
#import "./lib.typ": *

== Discrete distributions

=== Geometric distribution

#plot(
  width: 8,
  height: 6,
  xmin: 0,
  xmax: 10,
  ymin: 0,
  ymax: 1,
  xlabel: $x$,
  ylabel: $f(x) = (1-p)^(x-1)p$,
  axis-y-extend: 0,
(fn: geometric-pmf(0.2), label: $p=0.2$, label-pos: 0.1, label-side: "below-left"),
(fn: geometric-pmf(0.5), label: $p=0.5$, label-pos: 0.01, label-side: "left"),
(fn: geometric-pmf(0.8), label: $p=0.8$, label-pos: 0.1, label-side: "right"),
)

#plot(
  width: 8,
  height: 6,
  xmin: 0,
  xmax: 10,
  ymin: 0,
  ymax: 1,
  xlabel: $x$,
  ylabel: $F(x) = 1 - (1-p)^x$,

  axis-y-extend: 0,
  (fn: geometric-cdf(0.2), label: $p=0.2$, label-pos: 0.5, label-side: "below-right"),
  (fn: geometric-cdf(0.5), label: $p=0.5$, label-pos: 0.5, label-side: "below-right"),
  (fn: geometric-cdf(0.8), label: $p=0.8$, label-pos: 0.5, label-side: "above-right"),
)

== Continuous distributions

=== Normal distribution

#plot(
  width: 8,
  height: 6,
  xmin: -5,
  xmax: 5,
  ymin: 0,
  ymax: 1,
  axis-y-extend: 0,
  (fn: normal-pdf(0, 1)),
)

#plot(
  width: 8,
  height: 6,
  xmin: -4,
  xmax: 4,
  ymin: -1,
  ymax: 1,
  axis-y-extend: 0,
  (fn: normal-cdf(0, 1)),
)
