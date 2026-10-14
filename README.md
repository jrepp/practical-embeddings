# Practical Embeddings

LaTeX source for the *Practical Embeddings* book, split out of
[lm-based](https://github.com/jrepp/lm-based) with its history.

```bash
just book-check   # xelatex installed?
just book         # build tex/embedding-book.tex into pdf-releases/
just book-patch   # bump the patch version and build
```

The version lives in `VERSION-book`; releases land in `pdf-releases/` with a
`-latest` symlink.
