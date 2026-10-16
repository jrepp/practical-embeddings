# Contributing

Edits and new content are welcome: typo fixes, corrections, clearer
explanations, updated benchmark numbers, better examples, or whole new
sections and chapters.

## How

1. Fork the repo and make your change in `tex/`. Chapters live in
   `tex/chapters/`; new chapters also need an `\include` line in
   `tex/embedding-book.tex`.
2. Build it if you can: `just book` (needs XeLaTeX; `just book-check` tells
   you what's missing). If you can't, open the pull request anyway; CI builds
   the PDF and attaches it to the run.
3. Open a pull request saying what you changed and why. For factual changes,
   link the source.

Not sure about something? Open an issue first.

## Guidelines

- Keep it practical: show what to run and what to expect.
- Cite primary sources (papers, model cards, leaderboards) for claims and
  numbers.
- AI-assisted contributions are fine. Say so in the pull request, and check
  the facts and the examples yourself before submitting.
- Leave `VERSION-book` alone; the maintainer bumps it when cutting a release.

## License

By contributing, you agree that your contribution is licensed under
[CC BY 4.0](LICENSE), the same license as the book.
