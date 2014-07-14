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
del %nombre%.aux
del %nombre%.bbl
del %nombre%.blg
del %nombre%.glg
del %nombre%.glo
del %nombre%.gls
del %nombre%.glsdefs
del %nombre%.ist
del %nombre%.loa
del %nombre%.loal
del %nombre%.lol
del %nombre%.loi
del %nombre%.lod
del %nombre%.loq
del %nombre%.out
del %nombre%.toc
del %nombre%.log
del %nombre%.synctex.gz
del %nombre%.dvi
del %nombre%.brf
del %nombre%.pdf
del capitulos\*.aux
echo Compilando archivo: %nombre%.tex
pdflatex -synctex=1 -interaction=nonstopmode %nombre%
bibtex %nombre%
makeglossaries %nombre%
makeindex %nombre%.glo -s %nombre%.ist -t %nombre%.glg -o %nombre%.gls
pdflatex -synctex=1 -interaction=nonstopmode %nombre%
pdflatex -synctex=1 -interaction=nonstopmode %nombre%
echo Archivo generado: %nombre%.pdf
echo Eliminando archivos temporales
del %nombre%.aux
del %nombre%.bbl
del %nombre%.blg
del %nombre%.glg
del %nombre%.glo
del %nombre%.gls
del %nombre%.glsdefs
del %nombre%.ist
del %nombre%.loa
del %nombre%.loal
del %nombre%.lol
del %nombre%.loi
del %nombre%.lod
del %nombre%.loq
del %nombre%.out
del %nombre%.toc
del %nombre%.log
del %nombre%.synctex.gz
del %nombre%.dvi
del %nombre%.brf
del capitulos\*.aux
pause
exit