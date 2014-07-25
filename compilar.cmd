@echo off
if not "%1"=="" (
	set nombre=%1
) else if exist trabajo.tex (
	set nombre=trabajo
) else if exist proyecto.tex (
	set nombre=proyecto
) else if exist manual.tex (
	set nombre=manual
) 
if not exist %nombre%.tex (
	echo Archivo %nombre%.tex no existe
	pause
	exit
)
echo Eliminando archivos temporales
del 2>nul %nombre%.aux
del 2>nul %nombre%.bbl
del 2>nul %nombre%.blg
del 2>nul %nombre%.glg
del 2>nul %nombre%.glo
del 2>nul %nombre%.gls
del 2>nul %nombre%.glsdefs
del 2>nul %nombre%.ist
del 2>nul %nombre%.loa
del 2>nul %nombre%.loal
del 2>nul %nombre%.lol
del 2>nul %nombre%.loi
del 2>nul %nombre%.lod
del 2>nul %nombre%.loq
del 2>nul %nombre%.out
del 2>nul %nombre%.toc
del 2>nul %nombre%.log
del 2>nul %nombre%.synctex.gz
del 2>nul %nombre%.dvi
del 2>nul %nombre%.brf
del 2>nul %nombre%.lon
del 2>nul %nombre%.pdf
del 2>nul capitulos\*.aux
echo Compilando archivo: %nombre%.tex
pdflatex -synctex=1 -interaction=nonstopmode %nombre%
bibtex %nombre%
makeglossaries %nombre%
makeindex %nombre%.glo -s %nombre%.ist -t %nombre%.glg -o %nombre%.gls
pdflatex -synctex=1 -interaction=nonstopmode %nombre%
pdflatex -synctex=1 -interaction=nonstopmode %nombre%
pdflatex -synctex=1 -interaction=nonstopmode %nombre%
echo Archivo generado: %nombre%.pdf
echo Eliminando archivos temporales
del 2>nul %nombre%.aux
del 2>nul %nombre%.bbl
del 2>nul %nombre%.blg
del 2>nul %nombre%.glg
del 2>nul %nombre%.glo
del 2>nul %nombre%.gls
del 2>nul %nombre%.glsdefs
del 2>nul %nombre%.ist
del 2>nul %nombre%.loa
del 2>nul %nombre%.loal
del 2>nul %nombre%.lol
del 2>nul %nombre%.loi
del 2>nul %nombre%.lod
del 2>nul %nombre%.loq
del 2>nul %nombre%.out
del 2>nul %nombre%.toc
del 2>nul %nombre%.log
del 2>nul %nombre%.synctex.gz
del 2>nul %nombre%.dvi
del 2>nul %nombre%.brf
del 2>nul %nombre%.lon
del 2>nul capitulos\*.aux
pause
exit