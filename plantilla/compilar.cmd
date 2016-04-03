@echo off
if not "%1"=="" (
  set archivo=%1
) else (
  echo Debe ingresar el nombre del archivo a compilar, ejemplo: compilar.cmd trabajo
  pause
  exit
)
if not exist %archivo%.tex (
  echo Archivo %archivo%.tex no existe
  pause
  exit
)
call:borrartemporales
echo Compilando archivo: %archivo%.tex
pdflatex -synctex=1 -interaction=nonstopmode %archivo%
makeglossaries %archivo%
makeindex %archivo%.glo -s %archivo%.ist -t %archivo%.glg -o %archivo%.gls
pdflatex -synctex=1 -interaction=nonstopmode %archivo%
makeglossaries %archivo%
makeindex %archivo%.glo -s %archivo%.ist -t %archivo%.glg -o %archivo%.gls
pdflatex -synctex=1 -interaction=nonstopmode %archivo%
bibtex %archivo%
pdflatex -synctex=1 -interaction=nonstopmode %archivo%
pdflatex -synctex=1 -interaction=nonstopmode %archivo%
pdflatex -synctex=1 -interaction=nonstopmode %archivo%
makeglossaries %archivo%
makeindex %archivo%.glo -s %archivo%.ist -t %archivo%.glg -o %archivo%.gls
pdflatex -synctex=1 -interaction=nonstopmode %archivo%
echo Archivo generado: %archivo%.pdf
call:borrartemporales
pause
exit
:borrartemporales
  echo Eliminando archivos temporales
  del 2>nul %archivo%.aux
  del 2>nul %archivo%.bbl
  del 2>nul %archivo%.blg
  del 2>nul %archivo%.glg
  del 2>nul %archivo%.glo
  del 2>nul %archivo%.gls
  del 2>nul %archivo%.glsdefs
  del 2>nul %archivo%.ist
  del 2>nul %archivo%.lal
  del 2>nul %archivo%.lol
  del 2>nul %archivo%.loc
  del 2>nul %archivo%.loi
  del 2>nul %archivo%.lod
  del 2>nul %archivo%.loq
  del 2>nul %archivo%.out
  del 2>nul %archivo%.toc
  del 2>nul %archivo%.log
  del 2>nul %archivo%.synctex.gz
  del 2>nul %archivo%.dvi
  del 2>nul %archivo%.brf
  del 2>nul %archivo%.lon
  del 2>nul capitulos\*.aux
goto:eof