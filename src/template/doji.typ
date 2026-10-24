// Developer CV - Doji edit
// Typst template
//
// Authors:
// Stijn Dejongh
// Based on a template by Jan Vorisek (jan@vorisek.me)
// Based on a template by Jan Küster (info@jankuester.com)
// Modified for LaTeX Templates by Vel (vel@LaTeXTemplates.com)
//
// License:
// The MIT License (see included LICENSE file)

#import "@preview/fontawesome:0.6.0": fa-icon

// ---------------------------------------------------------------------------
// THEMES
// ---------------------------------------------------------------------------

#let themes = (
  green: (
    background: rgb("#64b613"),
    accent-bg: rgb("#63a026"),
    accent: rgb("#356803"),
    text: rgb("#202917"),
    soft: color.mix((rgb("#cdd5cc"), 75%), (rgb("#202917"), 25%)),
    highlight: rgb("#cdd5cc"),
  ),
  blue: (
    background: rgb("#2073ba"),
    accent-bg: rgb("#1a5c95"),
    accent: rgb("#1a5c95"),
    text: rgb("#1d2933"),
    soft: color.mix((rgb("#e7e7e7"), 65%), (rgb("#1d2933"), 35%)),
    highlight: rgb("#e7e7e7"),
  ),
)

#let _config = state("doji-config", (theme: themes.green, gdpr: false, square: false))

// Runs `f` with the active configuration (theme colors, gdpr and square flags).
#let _with-config(f) = context f(_config.get())

// ---------------------------------------------------------------------------
// DOCUMENT
// ---------------------------------------------------------------------------

/// Main show rule. Use as `#show: cv.with(theme: "blue")`.
///
/// - theme: "green", "blue" or a dictionary with the same keys as `themes.green`.
/// - gdpr: redact personal contact details. Defaults to `--input gdpr=true`.
/// - square: use straight corners instead of rounded ones.
/// - header: content shown in the top margin of the first page, e.g. `company-header(...)`.
#let cv(
  theme: "green",
  gdpr: sys.inputs.at("gdpr", default: "false") == "true",
  square: false,
  header: none,
  author: none,
  font: "Raleway",
  font-size: 9pt,
  paper: "a4",
  body,
) = {
  let t = if type(theme) == str { themes.at(theme) } else { theme }
  _config.update((theme: t, gdpr: gdpr, square: square))

  set document(author: if author != none { author } else { () }, title: if author != none { author + " - CV" })
  set page(
    paper: paper,
    margin: (x: 2cm, y: 1.75cm),
    header: if header != none { context if here().page() == 1 { header } },
    header-ascent: 25%,
  )
  set text(font: font, size: font-size, fill: t.text, lang: "en", number-type: "lining")
  set par(justify: true, leading: 0.55em, spacing: 0.9em)
  set list(marker: text(fill: t.background)[•], indent: 0pt, body-indent: 0.4em, spacing: 0.65em)
  set strong(delta: 300)

  body
}

// ---------------------------------------------------------------------------
// SMALL HELPERS
// ---------------------------------------------------------------------------

/// Placeholder text.
#let lorem-short = [Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus.]

/// Accent colored separators, e.g. `Java #amp Kotlin` or `TDD #pipe BDD`.
#let pipe = _with-config(c => text(fill: c.theme.accent.transparentize(15%), weight: "bold")[ | ])
#let amp = _with-config(c => text(fill: c.theme.accent.transparentize(15%), weight: "bold")[ & ])

/// A link marked with a small chain icon.
#let linkage(url, body) = _with-config(c => link(url)[#body#h(1pt)#super(
    text(size: 0.7em, fill: c.theme.accent, fa-icon("link", solid: true)),
  )])

/// Replaces `body` with a placeholder when the CV is compiled in GDPR mode.
#let redact(body) = _with-config(c => if c.gdpr [\[ redacted \]] else { body })

/// Text in one of the theme colors, e.g. `#colored("soft")[2016]`.
#let colored(key, body) = _with-config(c => text(fill: c.theme.at(key), body))

/// Bold, uppercase, accent colored text.
#let speciality(body) = _with-config(c => text(fill: c.theme.accent, weight: "bold", upper(body)))

/// A small uppercase tag, e.g. `#tag[degree]`.
#let tag(body, size: 0.55em) = _with-config(c => box(
  fill: color.mix((c.theme.soft, 52%), (white, 48%)),
  inset: (x: 3pt, y: 2pt),
  baseline: 20%,
  text(fill: white, size: size, weight: "bold", upper(body)),
))

/// A dashed horizontal rule.
#let divider(color: none) = _with-config(c => line(
  length: 100%,
  stroke: (paint: if color == none { c.theme.text.transparentize(75%) } else { color }, thickness: 0.6pt, dash: "dashed"),
))

/// Profile picture with an accent border. Shows a default avatar in GDPR mode.
#let photo(img, width: 100%) = _with-config(c => box(
  fill: c.theme.accent,
  inset: 2pt,
  box(width: width, if c.gdpr { image("../img/default.png", width: 100%) } else { img }),
))

/// Round profile picture.
#let round-photo(img, size: 4cm) = _with-config(c => box(
  width: size,
  height: size,
  radius: 50%,
  clip: true,
  if c.gdpr { image("../img/default.png", width: 100%) } else { img },
))

/// Name parts each set in a filled accent box.
#let boxed-name(..parts, size: 2.6em) = _with-config(c => {
  set text(size: size, fill: white, weight: "bold")
  parts.pos().map(p => box(fill: c.theme.accent, inset: (x: 3pt, y: 3pt), upper(p))).join(h(2pt))
})

// ---------------------------------------------------------------------------
// CONTACT INFORMATION
// ---------------------------------------------------------------------------

/// A contact line: icon followed by (optionally linked) text.
#let contact(icon, body, url: none) = _with-config(c => box(text(fill: c.theme.accent)[
  #box(width: 1.2em, align(center, fa-icon(icon, solid: true)))#h(0.3em)#if url != none { link(url, body) } else { body }
]))

#let email(address, label: none) = contact(
  "envelope",
  redact(if label != none { label } else { address }),
  url: if address != none { "mailto:" + address },
)
#let phone(number) = contact("phone", redact(number), url: "tel:" + number.replace(" ", ""))
#let location(place) = contact("location-dot", place)
#let homepage(url, label) = contact("globe", label, url: url)
#let linkedin(handle, label: none) = contact(
  "linkedin",
  if label != none { label } else { "/" + handle },
  url: "https://linkedin.com/in/" + handle,
)
#let github(handle, label: none) = contact(
  "github",
  if label != none { label } else { "/" + handle },
  url: "https://github.com/" + handle,
)
#let business(body, url: none) = contact("briefcase", body, url: url)
/// Belgian company number, linked to the public KBO register.
#let kbo(number) = business(
  [*KBO:* #number],
  url: "https://kbopub.economie.fgov.be/kbopub/toonondernemingps.html?ondernemingsnummer=" + number,
)
#let revision(date) = contact("rotate", upper[*CV version:* #date])

/// Header bar with a company logo and contact columns, for contractor CVs.
/// Pass it as `cv.with(header: company-header(...))`.
#let company-header(logo, ..columns) = {
  set text(size: 0.65em)
  grid(
    columns: (35%,) + (1fr,) * columns.pos().len(),
    align: horizon,
    logo, ..columns.pos().map(col => stack(spacing: 0.6em, ..col)),
  )
}

// ---------------------------------------------------------------------------
// SECTIONS
// ---------------------------------------------------------------------------

/// Section heading: a filled title box followed by a dotted rule.
#let section(title) = _with-config(c => {
  let t = c.theme
  block(above: 1.6em, below: 1em, sticky: true, grid(
    columns: (auto, 1fr, auto),
    align: horizon,
    box(
      fill: t.accent-bg,
      inset: (x: 5pt, y: 4pt),
      radius: if c.square { 0pt } else { 3pt },
      text(fill: white, size: 0.7em, weight: "bold", upper(title)),
    ),
    line(length: 100%, stroke: (paint: t.accent-bg.transparentize(15%), thickness: 0.9pt, dash: "loosely-dotted")),
    if not c.square {
      box(fill: t.accent-bg, inset: 1.5pt, circle(radius: 1.2pt, fill: white))
    },
  ))
})

/// A row of tags with a small label, e.g. technologies used on a project.
#let tag-list(label, items) = _with-config(c => block(above: 1em, grid(
  columns: (10%, 1fr),
  column-gutter: 4pt,
  align: horizon,
  text(size: 0.7em, fill: color.mix((c.theme.soft, 55%), (c.theme.accent-bg, 45%)), label),
  items.map(tag).join(h(2pt)),
)))
#let tech-list(..items) = tag-list([Technologies used:], items.pos())
#let skill-list(..items) = tag-list([Skills used:], items.pos())

/// A timeline entry, typically for experience.
#let entry(
  dates: none,
  title: none,
  subtitle: none,
  qualifier: none,
  body-width: 85%,
  tech: (),
  skills: (),
  body,
) = _with-config(c => block(breakable: false, below: 1.8em, grid(
  columns: (17.5%, 1fr),
  column-gutter: 4pt,
  text(fill: c.theme.soft, size: 0.85em, dates),
  {
    text(fill: c.theme.accent-bg, weight: "bold", title)
    h(1fr)
    text(size: 0.85em, weight: "bold", qualifier)
    if subtitle != none {
      linebreak()
      h(2pt)
      text(size: 0.9em, fill: c.theme.text.transparentize(15%), subtitle)
    }
    block(above: 0.8em, width: body-width, body)
    if tech.len() > 0 { tech-list(..tech) }
    if skills.len() > 0 { skill-list(..skills) }
  },
)))

// ---------------------------------------------------------------------------
// SKILLS
// ---------------------------------------------------------------------------

/// Skill with a 1-5 rating shown as dots.
#let skill(name, level, max: 5) = _with-config(c => block(spacing: 0.45em, {
  grid(
    columns: (1fr, auto),
    column-gutter: 4pt,
    align: (left + horizon, right + horizon),
    text(size: 0.9em, weight: "bold", name),
    range(max)
      .map(i => box(circle(
        radius: 2.6pt,
        fill: if i < level { c.theme.background } else { c.theme.text.transparentize(70%) },
      )))
      .join(h(1pt)),
  )
  v(-0.2em)
  divider()
}))

/// A titled group of skills. Pass `(name, level)` pairs or `skill(...)` calls.
#let skill-group(title, ..skills) = _with-config(c => block(breakable: false, below: 2.4em, {
  text(size: 1.2em, fill: c.theme.accent, weight: "bold")[#fa-icon("square-check", solid: true)#h(0.6em)#title]
  v(0.4em)
  pad(left: 7mm, for s in skills.pos() {
    if type(s) == array { skill(..s) } else { s }
  })
}))

/// Horizontal bar chart, e.g. `barchart(("Dutch", 100), ("English", 95))`.
#let barchart(..items, width: 3.5cm) = _with-config(c => grid(
  columns: (auto, width),
  column-gutter: 4pt,
  row-gutter: 3pt,
  align: (right + horizon, left + horizon),
  ..items.pos().map(((label, perc)) => (
    text(fill: c.theme.accent, weight: "bold", label),
    rect(width: perc * 1%, height: 0.35cm, fill: c.theme.background),
  )).flatten(),
))

/// Bubble diagram: one central bubble surrounded by others.
#let bubbles(middle, ..items, size: 4.6cm, distance: 1.75cm) = _with-config(c => {
  let fill = c.theme.highlight.transparentize(40%)
  let bubble(body, font-size) = circle(fill: fill, inset: 4pt, align(
    center + horizon,
    text(size: font-size, fill: c.theme.text.transparentize(50%), body),
  ))
  let n = items.pos().len()
  box(width: size, height: size, {
    for (i, item) in items.pos().enumerate() {
      let angle = i * 360deg / n - 90deg
      place(center + horizon, dx: distance * calc.cos(angle), dy: distance * calc.sin(angle), bubble(item, 0.55em))
    }
    place(center + horizon, bubble(text(weight: "bold", middle), 0.9em))
  })
})

// ---------------------------------------------------------------------------
// MISCELLANEOUS BLOCKS
// ---------------------------------------------------------------------------

/// Language with a proficiency description.
#let language(name, level) = block(spacing: 0.8em)[*#name* #h(1fr) #text(size: 0.75em, level)]

/// Something to be proud of, with an icon and short description.
#let achievement(icon, title, url: none, body) = _with-config(c => block(below: 1.1em)[
  #text(fill: c.theme.accent-bg, fa-icon(icon, solid: true))#h(0.4em)*#if url != none { linkage(url, title) } else { title }* \
  #text(size: 0.85em, body)
])

/// Education or training entry: `education("M. Sc.", kind: "degree")[2015 from ...]`.
#let education(title, kind: none, body) = block(below: 1.1em)[
  *#title* #h(1fr) #if kind != none { tag(kind, size: 0.45em) } \
  #text(size: 0.85em, body)
]

/// Accent colored institute name, optionally linked.
#let institute(name, url: none) = _with-config(c => text(
  fill: c.theme.accent-bg,
  if url != none { linkage(url, name) } else { name },
))

/// A professional reference.
#let reference(name, company: none, relation: none, email: none) = _with-config(c => block(
  breakable: false,
  below: 1.4em,
  {
    text(weight: "bold", fill: c.theme.text.transparentize(15%), name)
    let row(icon, body) = block(above: 0.8em, pad(left: 0.75cm)[
      #box(width: 1.2em, text(fill: c.theme.background, fa-icon(icon, solid: true)))#h(0.3em)#body
    ])
    if company != none { row("building", company) }
    if email != none { row("envelope", redact(link("mailto:" + email, email))) }
    if relation != none { row("link", relation) }
    v(0.4em)
    divider()
  },
))
