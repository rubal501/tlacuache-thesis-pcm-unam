
#let bib = state("bib", none)

#let currentH(level: 1)={
  let elems = query(selector(heading.where(level: level)).after(here()))
  if elems.len() != 0 and elems.first().location().page() == here().page() {
    return elems.first().body
  } else {
    elems = query(selector(heading.where(level: level)).before(here()))
    if elems.len() != 0 {
      return elems.last().body
    }
  }
  return ""
}

#let thesis(
  titulo: [Titulo],
  grado: [Licenciatura],
  autor: [Autor],
  asesor: [Asesor],
  asesorAD: [Adscripción],
  lugar: [Ciudad de México, México],
  agno: [#datetime.today().year()],
  bibliography: [],
  abstract: [],
  agradecimientos: [],
  body,
)={
  // configuración páginas y contadores
  set document(title: titulo)
  set page("us-letter", margin: (top: 4cm, bottom: 2cm), header: context{
    if here().page() == 1 {
      return
    }
    if calc.rem(here().page(), 2) == 0 [
      #align(left, text(currentH(), size: 18pt))
      #line(length: 100%, start: (0%, -7%))
    ] else [
      #align(right, currentH(level: 2))
      #line(length: 100%)
    ]
  })
  set text(font: "New Computer Modern", lang: "es")
  set heading(numbering: "1.1.")

  set math.equation(
    numbering: num =>
    "(" + (counter(heading.where(level: 1)).get() + (num,)).map(str).join(".") + ")",
  )

  set par(first-line-indent: 1em)

  set block(spacing: 1.5em)

  // Portada
  page(margin:(top:50pt))[

  #set align(center)
  #set par(leading: 5pt)
  #image("./escudos/logo-pccm.png", width: 120pt)
    #v(30pt)
    
    #text(14pt, weight:"bold", font:"Arial", [UNIVERSIDAD NACIONAL AUTÓNOMA DE MÉXICO ])

    #text(12pt, font:"Arial", [PROGRAMA DE MAESTRÍA Y DOCTORADO EN CIENCIAS MATEMÁTICAS Y \
    DE LA ESPECIALIZACIÓN EN ESTADÍSTICA APLICADA])

    #v(90pt)

    #text(12pt,  font:"Arial", [#titulo])

    #v(40pt)

    #text(12pt, font:"Arial",[QUE PARA OPTAR POR EL GRADO DE: \
MAESTRO (A) EN CIENCIAS])

    #v(70pt)

    #text(12pt, font:"Arial",[PRESENTA: \
    #autor])



    #v(62pt)
    #text(12pt, font:"Arial",[Director])\
    #text(blue, 12pt, font:"Arial", [#asesor \ #asesorAD])\


    #v(44pt)
    #text(12pt, font:"Arial", [#lugar, #agno.] )
  ]

  pagebreak()

  // Table of contents.
  outline(depth: 3)
  set page(numbering: "1")
  counter(page).update(1)

  let line-spacing = 0.65em * 1.5
  set par(justify: true, leading: line-spacing)

  show heading.where(level:1): it => [
  #let cn = context counter(heading).display("1")
  #let cnap = context counter(heading).display("A")
  #let titl = it.body.text
  #pagebreak(to: "even")
  #v(20%)
  #let spl = it.supplement.text
  
  #if spl == "Appendix" [

  #block(
    [
    #text(weight:"extrabold",
    35pt,
    [Apéndice #cnap]) 

    // #v(5%)
    #text(weight:"extrabold",
    20pt,
    [#it.body])
    ])
    #v(5%)
  ]else {

  if not titl == "Bibliografía" [
    #block(
    [
    #text(weight:"extrabold",
    35pt,
    [Capítulo #cn]) 

    // #v(5%)
    #text(weight:"extrabold",
    20pt,
    [#it.body])
    ])
    #v(5%)
  ] else [
  // Exepcion para la bibliografia
  #par(first-line-indent:0pt,
  [ 
  #text(weight:"extrabold",
  30pt,
  [#it.body])
  ])
  #v(5%)
  ]
  }]
  set align(left)

  body

  if not bibliography == [] {
    [#bibliography <bib>]
  }
}

#let chapter(bibliography: [], body) = {
  set math.equation(
    numbering: num =>
    "(" + (counter(heading.where(level: 1)).get() + (num,)).map(str).join(".") + ")",
  )

  body

  context(if query(<bib>).len() != 1 and bibliography == [] {
    pagebreak()
    bibliography
  })
}

#let section(bibliography: [], body) = {
  set math.equation(
    numbering: num =>
    "(" + (counter(heading.where(level: 1)).get() + (num,)).map(str).join(".") + ")",
  )

  body

  context(if query(<bib>).len() != 1 and bibliography == [] {
    pagebreak()
    bibliography
  })
}
