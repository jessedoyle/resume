# My Resume

> I consider LaTeX resumes to be a secret handshake of sorts, something that makes me significantly more likely to be inclined to hire a candidate.

—[zackelan](https://news.ycombinator.com/item?id=10452606) on HN

This repository contains a LaTeX résumé template that is generated from content specified in a `yaml` file.

This repository was (strongly) inspired by the code from [cv-boilerplate](https://github.com/mrzool/cv-boilerplate), but I found the `Pandoc` template notation to be cumbersome, so I rewrote the code to use an `ERB` template.

The original developer of `cv-boilerplate`, Mattia Tezzele, deserves considerable thanks for the initial implementation and concept.

## Intro

Separating presentation from content makes life easier. The typical content of a CV is a perfect fit for a yaml file due to its structured nature:

```YAML
---
name: Friedrich Nietzsche
address:
- Humboldtstraße 36
- 99425 Weimar
- Prussia
email: friedrich@thevoid.de
# ...
experience:
- years: 1879--1889
  employer: Freiberufler
  job: Freier Philisoph
  city: Sils-Maria
- years: 1869–-1879
  employer: Universität Basel
  job: Professor für klassische Philologie
  city: Basel
```

That makes super easy to update a CV while keeping a consistent structure.

The template is an `.erb` file and uses a quick and dirty Ruby script to parse the `YAML` file, build the `ERB` template with the supplied data and generate an output `.tex` file.

The output PDF, `.tex` file and logfiles are all generated in the `output` directory.

## Dependencies

1. LaTeX with the following extra packages: `fontspec` `geometry` `xunicode` `xltxtra` `hyperref` `setspace` `titlesec` `enumitem`
2. Adobe Source Sans / CMU Serif Roman fonts: These are all located in the `fonts` directory and must be installed into the host system.

To install LaTeX on Mac OS X, I recommend getting the smaller version BasicTeX from [here](https://tug.org/mactex/morepackages.html) and installing the additional packages with `tlmgr` afterwards. Same goes for Linux: install `texlive-base` with your package manager and add the needed additional packages later.

## Getting Started

1. Edit `content.yml` with your personal details, work experience, education, and desired settings.
2. Run `make` to compile the PDF.
3. Tweak on `template.tex.erb` until you're satisfied with the result.

**Note**: this template needs to be compiled with XeTeX.

## Available Settings

- **`mainfont`**: Adobe Source Sans is the default.
- **`fontsize`**: Possible values here are 10pt, 11pt and 12pt.
- **`line_height`**: The base line height for styled text.
- **`vertical_rhythm`**: A value that specifies the amount of vertical whitespace. Default 2.5mm.
- **`geometry`**: A string that sets the margins through `geometry`. The default settings are for A4 page size. If you change the `textwidth` or `margin` settings, you should change the corresponding values in the `\alignleftright` LaTeX macro defined in the template header.
- **`website`**, **`phone`**, **`address`**, **`github`**: Currently all are required.

## Recommended Readings

- [Why I do my résumé in LaTeX](http://www.toofishes.net/blog/why-i-do-my-resume-latex/) by Dan McGee
- [What are the benefits of writing resumes in TeX/LaTeX?](http://tex.stackexchange.com/questions/11955/what-are-the-benefits-of-writing-resumes-in-tex-latex) on TeX Stack Exchange
- [Typesetting your academic CV in LaTeX](http://nitens.org/taraborelli/cvtex) by Dario Taraborelli
- [Résumé advices](http://practicaltypography.com/resumes.html) from Butterick's Practical Typography

## License

This repository contains a modified version of [cv-boilerplate](https://github.com/mrzool/cv-boilerplate) template.

This repository contains Open Source Adobe fonts. These fonts are licensed under the SIL Open Font License v1.1. See `LICENSE` for details.

Code License: MIT. See `LICENSE` for details.
