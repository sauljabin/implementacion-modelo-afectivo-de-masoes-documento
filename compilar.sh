#!/bin/bash
if  [ "$1" != "" ]; then
  nombre=$1
elif [ -f trabajo.tex ]; then
  nombre=trabajo
elif [ -f proyecto.tex ]; then
  nombre=proyecto
elif [ -f manual.tex ]; then
  nombre=manual
fi
if [ ! -f $nombre.tex ]; then
  echo "Archivo $nombre.tex no existe"
  read -p "Presione una tecla para continuar..."
  exit
fi
echo Eliminando archivos temporales
rm -f $nombre.aux
rm -f $nombre.bbl
rm -f $nombre.blg
rm -f $nombre.glg
rm -f $nombre.glo
rm -f $nombre.gls
rm -f $nombre.glsdefs
rm -f $nombre.ist
rm -f $nombre.loa
rm -f $nombre.loal
rm -f $nombre.lol
rm -f $nombre.loi
rm -f $nombre.lod
rm -f $nombre.loq
rm -f $nombre.out
rm -f $nombre.toc
rm -f $nombre.log
rm -f $nombre.synctex.gz
rm -f $nombre.dvi
rm -f $nombre.brf
rm -f $nombre.lon
rm -f $nombre.pdf
rm -f capitulos/*.aux
echo "Compilando archivo: $nombre.tex"
pdflatex -synctex=1 -interaction=nonstopmode $nombre
makeglossaries $nombre
makeindex $nombre.glo -s $nombre.ist -t $nombre.glg -o $nombre.gls
pdflatex -synctex=1 -interaction=nonstopmode $nombre
makeglossaries $nombre
makeindex $nombre.glo -s $nombre.ist -t $nombre.glg -o $nombre.gls
pdflatex -synctex=1 -interaction=nonstopmode $nombre
bibtex $nombre
pdflatex -synctex=1 -interaction=nonstopmode $nombre
pdflatex -synctex=1 -interaction=nonstopmode $nombre
pdflatex -synctex=1 -interaction=nonstopmode $nombre
makeglossaries $nombre
makeindex $nombre.glo -s $nombre.ist -t $nombre.glg -o $nombre.gls
pdflatex -synctex=1 -interaction=nonstopmode $nombre
echo "Archivo generado: $nombre.pdf"
echo "Eliminando archivos temporales"
rm -f $nombre.aux
rm -f $nombre.bbl
rm -f $nombre.blg
rm -f $nombre.glg
rm -f $nombre.glo
rm -f $nombre.gls
rm -f $nombre.glsdefs
rm -f $nombre.ist
rm -f $nombre.loa
rm -f $nombre.loal
rm -f $nombre.lol
rm -f $nombre.loi
rm -f $nombre.lod
rm -f $nombre.loq
rm -f $nombre.out
rm -f $nombre.toc
rm -f $nombre.log
rm -f $nombre.synctex.gz
rm -f $nombre.dvi
rm -f $nombre.brf
rm -f $nombre.lon
rm -f capitulos/*.aux
read -p "Presione una tecla para continuar..."
exit