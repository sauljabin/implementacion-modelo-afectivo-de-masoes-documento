#!/usr/bin/env bash

TEMP_EXT=(aux bbl blg glg glo gls glsdefs ist lal lol loc loi lod loq out toc log synctex.gz dvi brf lon bit lof lot glx gxg gxs idx ilg ind url svn loa)

function clean {
  for ext in ${TEMP_EXT[@]}
  do
    find . -type f -name "*.$ext" -delete
  done
}

clean
pdflatex -synctex=1 -interaction=nonstopmode $1
makeglossaries $1
makeindex $1.glo -s $1.ist -t $1.glg -o $1.gls
pdflatex -synctex=1 -interaction=nonstopmode $1
makeglossaries $1
makeindex $1.glo -s $1.ist -t $1.glg -o $1.gls
pdflatex -synctex=1 -interaction=nonstopmode $1
bibtex $1
pdflatex -synctex=1 -interaction=nonstopmode $1
pdflatex -synctex=1 -interaction=nonstopmode $1
pdflatex -synctex=1 -interaction=nonstopmode $1
makeglossaries $1
makeindex $1.glo -s $1.ist -t $1.glg -o $1.gls
pdflatex -synctex=1 -interaction=nonstopmode $1
clean
