<!--
Add here global page variables to use throughout your website.
-->
+++
include("_config/blogs.jl")

import Dates
using .Blogs

draft = true
firstpublishedyear = 2022
currentyear = Dates.year(Dates.now())

title = "Fractally Refracting Thoughts"
author = "Nicholas Todoroff"
# email = "javascript:decryptEmail('bG9wcHkxMjQzQGdtYWlsLmNvbQ==')"
email = "mailto:nd.todoroff@gmail.com"
authorbio = "<p>Math, physics, programming, more math...</p>"
    # <p>I read and think about too much math 100% of the time.
    # In the time left after that,
    #     I like almost all things computer programming
    #     (really love <a href="https://julialang.org" class="generic-extlink">Julia</a>)
    #     and I watch too much anime.</p>"""
includeauthorbio = true

bloglist = Blogs.buildlist()
blogdates = unique(map(x -> x.date, bloglist))
blognavwidth = "30ex"
blognavcharwidth = 20

links = [
    (name="github", text="GitHub", url="https://github.com/loppy1243"),
    (name="linkedin", text="LinkedIn", url="https://www.linkedin.com/in/nicholas-todoroff-9b536a217/"),
]

masthead = [
    (text="Blog", path="/"*bloglist[end].path),
    (text="Notation", path="/notation/"),
    (text="Miscellaneous", path="/misc/"),
]

indented_code = false
isblogpost = false

publishedyears = if firstpublishedyear == currentyear
    string(firstpublishedyear)
else
    "$firstpublishedyear-$currentyear"
end

mintoclevel = 2

# Add here files or directories that should be ignored by Franklin, otherwise
# these files might be copied and, if markdown, processed by Franklin which
# you might not want. Indicate directories by ending the name with a `/`.
# Base files such as LICENSE.md and README.md are ignored by default.
ignore = ["_macros/", "_ignore/", "_config/"]
if !draft
    push!(ignore, "_drafts/")
end

for date in blogdates
    metafile = joinpath(
        "blog", "posts",
        string(Dates.year(date)),
        lpad(Dates.month(date), 2, '0'),
        lpad(Dates.day(date), 2, '0'),
        "meta.yaml"
    )
    push!(ignore, metafile)
end

# RSS (the website_{title, descr, url} must be defined to get RSS)
generate_rss = true
website_title = title
website_descr = title
website_url   = "loppy1243.github.io"

Franklin.include_external_config("_macros/geomalg.md")
+++

\newcommand{\sep}{}
\newcommand{\emdash}{~~~&mdash;~~~}
\newcommand{\bibentry}[2]{\biblabel{#1}{[!#2]}[!#2]}

\newcommand{\Q}{\mathbb{Q}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\inv}{^{-1}}
\newcommand{\trans}{^{\mathrm{T}}}
\newcommand{\conj}{^{*}}

\newenvironment{aside}{~~~<aside name="aside">~~~}{~~~</aside>~~~}
\newenvironment{aside*}[1]{~~~<aside name="aside" id="!#1">~~~}{~~~</aside>~~~}
\newcommand{\aside}[1]{~~~<span name="aside">~~~#1~~~</span>~~~}
\newcommand{\aside*}[2]{~~~<span name="aside" id="!#1">~~~#2~~~</span>~~~}

\newenvironment{columns}[1]{~~~<div style="column-count: #1;">~~~}{~~~</div>~~~}
