// Developer CV - Doji edit
// A CV for seasoned professionals.
//
// Build with:  typst compile serious_example.typ
// GDPR-safe:   typst compile --input gdpr=true serious_example.typ

#import "template/doji.typ": *

#show: cv.with(theme: "green", author: "Barry B. Bareel")

// ---------------------------------------------------------------------------
// TITLE AND CONTACT INFORMATION
// ---------------------------------------------------------------------------

#grid(
  columns: (12%, 1fr, 22%),
  column-gutter: 10pt,
  align: horizon,
  photo(image("img/barry.png")),
  {
    boxed-name("Barry", "B.", "Bareel")
    v(0.3em)
    text(size: 1.7em)[Primary job title #pipe Secondary job title]
    v(-0.2em)
    text(size: 0.65em)[
      #speciality[Speciality 1] #pipe #speciality[Speciality 2] #pipe
      #speciality[Another speciality 3] #pipe #speciality[I am very good at stuff]
    ]
  },
  {
    set text(size: 0.75em)
    stack(
      spacing: 0.7em,
      linkedin("barry-bareel"),
      github("barry-bareel"),
      email("barry@bareel.xxx"),
      phone("+00 555 12 34 56"),
    )
  },
)

// ---------------------------------------------------------------------------
// EXPERIENCE
// ---------------------------------------------------------------------------

#section[Experience]

#entry(
  dates: [03/2020 -- present],
  title: [Primary Function #amp Other function],
  subtitle: linkage("https://www.google.com")[Name of the project and/or customer],
  qualifier: [Self Employed #pipe Freelance],
  tech: ("Add", "the", "most", "relevant", "tools", "and", "technologies", "here"),
)[
  - I achieved something amazing, helping the customer increase their profits by 5000% over the span of X months. (#linkage("https://www.google.com")[link to reference])
  - Use active language when describing your efforts and responsibilities.
  - Try and quantify the things you did. This gives your recruiter a better view of the scope and results. It also demonstrates you know what is important to your customer.
  - If you talk about a specific technology or methodology that not everyone will be familiar with, include a link to its website or wiki page. For example: I organized #linkage("https://www.scrum.org/resources/what-is-scrum")[Scrum] ceremonies to increase developer engagement.
]

#entry(
  dates: [03/2019 -- 12/2019],
  title: [My job title at the time],
  subtitle: [Project name - Customer name],
  qualifier: [Company I worked for],
  skills: ("Not", "every", "project", "is", "tech", "driven", "so", "I", "list", "my", "relevant", "skills", "here"),
)[
  - #lorem-short
  - #lorem-short, resulting in a 24% decrease of the execution time.
  - #lorem-short #lorem-short
]

#entry(
  dates: [10/2015 -- 02/2019],
  title: [Job title #amp Other thing I did],
  subtitle: linkage("https://www.wikipedia.com")[Some project - Customer name],
  qualifier: [Employer name],
  tech: ("Add", "the", "most", "relevant", "tools", "and", "technologies", "here"),
)[
  - Make sure you include only relevant job experiences here.
  - If you wish to note that you have had more experiences in the past, combine them into a single entry in this list.
  - This overcomes "gaps" in your curriculum, while keeping focus on the direction you are pursuing now.
]

#entry(
  dates: [2011 -- 2015 \
  #text(size: 0.8em)[discontinuous]],
  title: [Various functions],
  subtitle: [Company One #pipe Company Two],
  qualifier: [Internship #pipe Gap Filler],
)[
  #set text(size: 0.9em)
  - Use a collection section like this for jobs you did a long time ago.
  - You can also use this to talk about semi-relevant internships or extra-curricular projects.
  - Make sure to be very brief here and focus only on the highlights.
]

// ---------------------------------------------------------------------------
// ADDITIONAL INFORMATION
// ---------------------------------------------------------------------------

#grid(
  columns: (28%, 1fr, 32%),
  column-gutter: 1.5em,
  {
    section[Languages]
    language[Dutch][C2 Proficient User #pipe Mother tongue]
    language[English][C1 Proficient User]
    language[French][B2 Independent User]
    language[German][A1 Basic User]
  },
  {
    section[Proud of]
    achievement("globe", [Open Source Contributions], url: "https://www.github.com/ddd-crew")[
      Talk about a notable side project here.
    ]
    achievement("heart", [A volunteer experience], url: "https://www.vzwaif.be/projecten-2/")[
      Social service or community involvement is always nice to put on a resume.
    ]
    achievement("trophy", [Notable award or achievement], url: "https://www.formula1.com/en/results.html/2021/drivers.html")[
      Add anything extraordinary you achieved or overcame here.
    ]
  },
  {
    section[Education & Trainings]
    education([Professional Great Person II], kind: "certification")[
      2020 from #institute(url: "https://www.linkto.certificate")[Issuer of certificate]
    ]
    education([Relevant course or Training], kind: "training")[
      2019 by #institute(url: "https://www.udemy.com")[Instructor or platform]
    ]
    education([M. Sc. Applied Awesomeness], kind: "degree")[
      2015 from #institute(url: "https://en.wikipedia.org/wiki/School_of_Hard_Knocks")[School of hard knocks] \
      cum laude (or other academic honors)
    ]
    education([B. Sc. Awesomeness], kind: "degree")[
      2012 from #institute(url: "https://en.wikipedia.org/wiki/School_of_Hard_Knocks")[School of hard knocks]
    ]
  },
)

#pagebreak()

// ---------------------------------------------------------------------------
// SKILLS
// ---------------------------------------------------------------------------

#section[Skills, Tools & Platforms]

#grid(
  columns: (1fr, 1fr),
  column-gutter: 10%,
  {
    skill-group(
      [Methodologies and Techniques],
      ([Design patterns #amp Refactoring techniques], 4),
      ([Test Driven Development #pipe TDD], 5),
      ([Domain Driven Design #pipe DDD], 4),
      ([Behaviour Driven Development #pipe BDD], 3),
      ([Testing Approaches], 4),
      ([Prototyping], 4),
      ([C4 modelling], 3),
      ([Process agility #amp workplace humanization], 5),
    )
    skill-group(
      [Design #amp Documentation tools],
      ([PlantUML #amp Structurizr], 4),
      (linkage("https://www.sparxsystems.com/")[Enterprise Architect], 3),
      ([draw.io #pipe diagrams.net], 4),
      ([Document generation], 5),
      (linkage("https://www.atlassian.com/software")[Atlassian Confluence #amp Jira], 4),
    )
    skill-group(
      [Programming #amp Scripting languages],
      ([Java], 5),
      ([Kotlin], 3),
      ([Python], 3),
      ([JavaScript #amp TypeScript], 4),
      ([PHP], 3),
      ([Bash Scripting], 4),
    )
    skill-group(
      [Markup languages],
      ([XSD #amp XML], 5),
      ([HTML], 4),
      ([CSS #pipe SCSS #pipe SASS], 3),
      ([Asciidoc #pipe Markdown], 4),
      ([Typst #pipe LaTeX], 4),
    )
  },
  {
    skill-group(
      [Platforms and server technology],
      ([Tomcat], 4),
      ([JBoss Server #pipe Wildfly], 3),
      ([Oracle Weblogic], 4),
      ([Docker], 4),
      ([Active MQ], 3),
      ([Oracle SQL Server], 4),
      ([MongoDB], 3),
      ([Linux], 4),
    )
    skill-group(
      [Frameworks #amp libraries],
      ([Spring #amp Spring Boot], 5),
      ([Hibernate], 5),
      ([JDBC], 4),
      ([Boilerplate generators: Mapstruct #amp Lombok], 4),
      ([JUnit #amp AssertJ], 5),
      ([JBehave #amp Cucumber], 3),
    )
    skill-group(
      [Frontend frameworks #amp Libraries],
      ([Angular #amp AngularJS], 3),
      ([Drupal], 4),
      ([JSF], 3),
      ([Static site generators], 4),
      ([Selenium #amp Cypress], 3),
    )
    skill-group(
      [Development tools],
      ([Maven], 5),
      ([Gradle], 3),
      ([Ant], 3),
      ([Git], 5),
      ([Jenkins], 5),
      ([Sonar #amp SonarCloud], 4),
      ([JMeter #amp JProfiler], 3),
    )
  },
)

// ---------------------------------------------------------------------------
// PERSONALITY
// ---------------------------------------------------------------------------

#section[Elevator pitch]

Write a text about what makes you stand out from your competition. Think about it as what a recruiter would say to a prospect in order to convince them to hire you. #lorem-short #lorem-short

#lorem-short #lorem-short #lorem-short #lorem-short #lorem-short
