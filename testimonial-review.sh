#!/bin/bash

here=`dirname $0`
# if your OS is sick
here=${here//\\/\/}

src=$1
srcdir=`dirname $src`
srcdir=${srcdir//\\/\/}

tex=${src%.*}.tex
txt=${src%.*}.txt

pandoc -t latex -o $tex -V here=$here --template=${here}/templates/testimonial.latex $src
pandoc -t plain -o $txt --template=${here}/templates/testimonial.plain $src

xelatex -output-directory=$srcdir $tex
xelatex -output-directory=$srcdir $tex
