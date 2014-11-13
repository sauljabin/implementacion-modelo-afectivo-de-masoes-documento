#!/bin/bash
borrartemporales(){
  echo "Eliminando archivos temporales"
  rm -f $archivo.aux
  rm -f $archivo.bbl
  rm -f $archivo.blg
  rm -f $archivo.glg
  rm -f $archivo.glo
  rm -f $archivo.gls
  rm -f $archivo.glsdefs
  rm -f $archivo.ist
  rm -f $archivo.lal
  rm -f $archivo.lol
  rm -f $archivo.loc
  rm -f $archivo.loi
  rm -f $archivo.lod
  rm -f $archivo.loq
  rm -f $archivo.out
  rm -f $archivo.toc
  rm -f $archivo.log
  rm -f $archivo.synctex.gz
  rm -f $archivo.dvi
  rm -f $archivo.brf
  rm -f $archivo.lon
  rm -f capitulos/*.aux
}
pause(){
  read -p "Presione una tecla para continuar..."
}
if  [ "$1" != "" ]; then
  archivo=$1
else
  echo "Debe ingresar el nombre del archivo a compilar, ejemplo: ./compilar.sh trabajo"
  pause
  exit
fi
if [ ! -f $archivo.tex ]; then
  echo "Archivo $archivo.tex no existe"
  pause
  exit
fi
borrartemporales
echo "Compilando archivo: $archivo.tex"
pdflatex -synctex=1 -interaction=nonstopmode $archivo
makeglossaries $archivo
makeindex $archivo.glo -s $archivo.ist -t $archivo.glg -o $archivo.gls
pdflatex -synctex=1 -interaction=nonstopmode $archivo
makeglossaries $archivo
makeindex $archivo.glo -s $archivo.ist -t $archivo.glg -o $archivo.gls
pdflatex -synctex=1 -interaction=nonstopmode $archivo
bibtex $archivo
pdflatex -synctex=1 -interaction=nonstopmode $archivo
pdflatex -synctex=1 -interaction=nonstopmode $archivo
pdflatex -synctex=1 -interaction=nonstopmode $archivo
makeglossaries $archivo
makeindex $archivo.glo -s $archivo.ist -t $archivo.glg -o $archivo.gls
pdflatex -synctex=1 -interaction=nonstopmode $archivo
echo "Archivo generado: $archivo.pdf"
borrartemporales
pause
exit
