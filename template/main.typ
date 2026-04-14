#import "../lib.typ": thesis

#show: thesis.with(
  titulo: [Titulo],
  autor: [Autor],
  asesor: [Asesor],
  bibliography: bibliography("references.bib"),
)

#include "capitulo1.typ"
