# Practical Embeddings

*Local RAG with llama.cpp and the Qwen3 Stack*

A short, practical book on embeddings and retrieval for local-first
deployments: how embeddings work, how to read MTEB and RTEB, how to pick a
model, and how to build and serve a RAG pipeline with `llama-server`.

**[Download the latest PDF](https://github.com/jrepp/practical-embeddings/releases/latest/download/Practical-Embeddings.pdf)**
· [All releases](https://github.com/jrepp/practical-embeddings/releases)

## Build it yourself

```bash
just book-check   # is XeLaTeX installed?
just book         # build tex/embedding-book.tex into pdf-releases/
just book-open    # build and open the PDF
```

The build needs XeLaTeX and the Source Serif 4, Source Sans 3, and Source Code
Pro fonts, which ship with TeX Live (`brew install --cask mactex-no-gui`).

## Releases

The book uses semantic versioning; the current version is in `VERSION-book`.
CI builds the PDF on every push and pull request. When `main` has a
`VERSION-book` with no matching `v<version>` tag, CI publishes a GitHub Release
with the PDF attached.

To cut a release, either change `VERSION-book` in a pull request and merge it,
or run `just release patch` (or `minor` / `major`), which bumps the version on
`main` and publishes in one step.

- **major**: restructured or substantially rewritten book
- **minor**: new chapters or sections, or a new layout
- **patch**: corrections and small edits

## AI use

This book combines human writing with output from AI agents, which drafted
parts of the text, summarized the underlying research, and wrote or adapted
many of the examples. Check claims and numbers against the cited primary
sources before relying on them. The full notice is on the book's copyright
page.

## Contributing

Edits and new content are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

[CC BY 4.0](LICENSE). You may share and adapt the book for any purpose,
including commercially, with attribution.
