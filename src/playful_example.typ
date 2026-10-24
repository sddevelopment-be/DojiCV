// Developer CV - Doji edit
// A spacious CV for people starting out their professional career.
//
// Build with:  typst compile playful_example.typ
// GDPR-safe:   typst compile --input gdpr=true playful_example.typ

#import "template/doji.typ": *

#show: cv.with(theme: "green", author: "Bob De Houwer")

// ---------------------------------------------------------------------------
// TITLE AND CONTACT INFORMATION
// ---------------------------------------------------------------------------

#grid(
  columns: (4cm, 1fr),
  column-gutter: 1em,
  align: horizon,
  round-photo(image("img/george.png")),
  {
    set par(leading: 0.3em)
    colored("accent-bg", text(size: 3em, weight: "bold", upper[Bob \ De Houwer]))
    h(0.5em)
    text(size: 1.6em)[Builder]
    v(0.2em)
    divider(color: themes.green.accent-bg)
    grid(
      columns: (1fr, 1fr),
      row-gutter: 0.6em,
      location("Vlaams-Brabant, Belgium"), email(none, label: [On request]),
      contact("phone")[On request], linkedin("bob-de-houwer", label: [On request]),
    )
  },
)

// ---------------------------------------------------------------------------
// INTRODUCTION
// ---------------------------------------------------------------------------

#grid(
  columns: (70%, 1fr),
  column-gutter: 1em,
  {
    section[Who Am I?]
    lorem(80)

    section[Education]
    grid(
      columns: (auto, 1fr),
      column-gutter: 5mm,
      row-gutter: 0.6em,
      colored("soft")[2016 -- 2017], [*M. Sc. Awesomeness* - #institute[School of hard knocks]],
      colored("soft")[2012 -- 2016], [*B. Sc. Awesomeness* - #institute[School of hard knocks]],
    )
  },
  align(center + horizon, bubbles(
    [Schraal],
    [Hotesemotse],
    [Vegeuh],
    [Peerdekop],
    [Schraal],
    [Palettekop],
  )),
)

// ---------------------------------------------------------------------------
// EXPERIENCE
// ---------------------------------------------------------------------------

#section[Experience]

#for _ in range(2) {
  entry(
    dates: [mm/yyyy -- mm/yyyy],
    title: [Job Title #pipe 2nd Job Title],
    subtitle: [Project name],
    qualifier: [Full company name],
    body-width: 100%,
    tech: ("Relevant skill",) * 5,
  )[
    #columns(2)[
      - Something I did there
      - Something I did there
      - Something I did there
      #colbreak()
      - Something I did there
      - Something I did there
      - Something I did there
      - Something I did there
    ]
  ]
}

// ---------------------------------------------------------------------------
// ADDITIONAL INFORMATION
// ---------------------------------------------------------------------------

#grid(
  columns: (28%, 1fr, 32%),
  column-gutter: 1.5em,
  {
    section[Languages]
    barchart(("Dutch", 100), ("English", 95), ("French", 65), width: 2.8cm)
  },
  {
    section[Hobbies]
    [I like: #lorem-short #lorem-short]
  },
  {
    section[Proud of]
    achievement("trophy", [Some award or certification])[I am cool]
    achievement("heart-pulse", [Personal thing of importance])[]
  },
)

#pagebreak()

// ---------------------------------------------------------------------------
// SKILLS
// ---------------------------------------------------------------------------

#section[Skills]

#grid(
  columns: (1fr, 1fr),
  column-gutter: 10%,
  {
    skill-group(
      [Programming/scripting languages],
      ([Java], 5),
      ([Python], 4),
      ([xQuery], 3),
      ([JavaScript], 3),
      ([Prolog], 3),
      ([Haskell], 3),
      ([PHP], 4),
    )
    skill-group(
      [Development tools],
      ([Maven], 5),
      ([Gradle], 2),
      ([Ant], 4),
      ([Git], 4),
      ([Jenkins], 4),
      ([Sonar], 3),
      ([IntelliJ], 4),
      ([Eclipse], 3),
      ([Puppet], 3),
    )
  },
  {
    skill-group(
      [Frameworks and libraries],
      ([Spring], 5),
      ([Spring Boot], 4),
      ([Hibernate], 5),
      ([JDBC], 4),
      ([Wicket], 3),
      ([Angular], 2),
      ([Java FX], 3),
    )
    skill-group(
      [Markup languages],
      ([XML], 4),
      ([HTML], 4),
      ([CSS], 3),
      ([Asciidoc #pipe Markdown], 3),
      ([Typst], 3),
    )
    skill-group(
      [Miscellaneous],
      ([Adobe Photoshop Suite], 4),
    )
  },
)

#section[References]

#grid(
  columns: (1fr, 1fr),
  column-gutter: 10%,
  row-gutter: 1.2em,
  reference([Dude McDudeson], company: [Company], relation: [Dude was senior to me]),
  reference([Dude McDudeson], company: [Company], relation: [Dude managed a project I worked on]),
  reference([Dude McDudeson], company: [Company], relation: [Dude was a client of mine]),
  reference([Dude McDudeson], company: [Company], relation: [I was senior to Dude]),
)
