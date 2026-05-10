#import "@preview/tidy:0.4.3"

#let docs = tidy.parse-module(read("../function/beta.typ"), old-syntax: true)

#tidy.show-module(docs)

#let docs = tidy.parse-module(read("../function/erf.typ"), old-syntax: true)

#tidy.show-module(docs)


#let docs = tidy.parse-module(read("../function/gamma.typ"), old-syntax: true)

#tidy.show-module(docs)