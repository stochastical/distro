#import calc: exp, fact, floor, pow
#import "../function/gamma.typ": gamma_ur

// This looks a bit arcane, but works as follows.
// A poisson distribution is entirely determined (member of a parameterised family) by its rate parameter λ.
// Note that in our code here, we use the Unicode character λ (U+03BB) to represent the rate parameter, but we could just as well use any other variable name (e.g. `lambda`).
// Since the parameter is positional, we don't expect the user to need to specify the unicode name, in any case.
// We use a thin wrapper around the distribution to allow us to validate the parameters (i.e. check that λ is non-negative).
// The result is a dictionary, with the parameter λ.
// Note that currently, Typst doesn't support custom types (e.g. structs) and associated methods, so we have to use a dictionary to represent the distribution and its parameters, and standalone functions to represent the PDF and CDF, which take the distribution as an argument (and extract the relevant parameters from the dictionary).
// To simplify the internal logic of the functions, we use pattern matching to extract the parameters from the distribution dictionary (e.g. `pmf((λ: λ))`), which also serves as a form of validation (e.g. if the user tries to call `pmf` with an argument that doesn't have the expected structure, it will throw an error). This also avoids us having to write `poisson.λ` everywhere in the code, which would be more verbose and less readable, or to bind it with `let λ = poisson.lambda`.
//
// ```typc
// #let pmf(poisson) = {
//   let λ = poisson.lambda
//   k => {
//     assert(k >= 0.0, message: "Poisson distribution is only defined for non-negative integers")
//     pow(λ, k) * exp(-λ) / fact(k)
//   }
// }
// ```
// When we use the functions from outside this file, we have to namespace them with `poisson.pmf` and `poisson.cdf` to avoid naming conflicts with other distributions (e.g. if we had a `binomial.pmf` function, we wouldn't want it to be called `pmf` in the global namespace, since that would be ambiguous).
// Interestingly, you can also embed the functions inside the distribution dictionary, which allows you to call them with `(poisson.pmf)(k)`, but due to Typst's syntax diaambngigauting built-in methods with dictionary field access, you have to wrap the function in a tuple to prevent it from being interpreted as a method call. However, since the mean and variance are just the parameter λ, we can include them directly in the dictionary without needing to wrap them in a function, which allows us to access them with `poisson.mean` and `poisson.variance` without any special syntax.
//
// Note that Typst doesn't currently support string interpolation, so we have to use string concatenation to construct the error messages in the assertions (e.g. `message: "Rate parameter " + str(λ) + " must be non-negative"`), which is a bit verbose, but hopefully still readable. However, there is a package for string interpolation (?)
//
// We can also package the PMF and CDF functions inside the distribution dictionary, which allows us to call them, but I'm not clear if that incurs a performance penalty, since it means that the functions have to be redefined every time we create a new distribution (does it?)
// Also, note that our functions are curried, which allows us to partially apply them with the distribution to get a function of the variable (e.g. `let pmf_poisson = pmf(P)`), which can be more convenient to use in some cases (e.g. when plotting the PMF or CDF).
// 
// I'm curious if there's a performance cost to using curried functions, and if the (incremental) compiler has to do more more work.

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

