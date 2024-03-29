#!/bin/bash
set -ueo pipefail

here=$(dirname $(realpath $0))

# if your OS is sick
here=${here//\\/\/}

test $# -gt 0 ||  { echo -e "Missing input file.\nUsage:\n\t$0 <markdown-input-file>\n" ;  exit 0 ; }

src="$1"
srcdir=$(dirname "$src")
srcdir="${srcdir//\\/\/}"

tex="${src%.*}.tex"
txt="${src%.*}.txt"
pdf="${src%.*}.pdf"

pandoc -t latex -o "$tex" -V here="$here" --template "${here}/templates/testimonial.latex" "$src"
pandoc -t plain -o "$txt" --template "${here}/templates/testimonial.plain" "$src"

xelatex -output-directory "$TMPDIR" "$tex"
xelatex -output-directory "$TMPDIR" "$tex"
mv "$TMPDIR/$pdf" $srcdir
rm "$tex"
