#!/usr/bin/env bash

##
# Copyright (c) 2016 Saúl Piña <sauljabin@gmail.com>.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
##

if [[ "$BASH_VERSION" =~ ^[0-3] ]]
  then
    echo "Versión 4 recomendada de bash, versión actual $BASH_VERSION"
    exit 1
fi

VERSION="v3.2"
FECHA="2016-10-18"
NAME="Plantilla LaTeX Trabajo de Grado"
UNI="Universidad Centoccidental Lisandro Alvarado"

TEMP_EXT=(aux bbl blg glg glo gls glsdefs ist lal lol loc loi lod loq out toc log synctex.gz dvi brf lon bit lof lot glx gxg gxs idx ilg ind url svn)

declare -A MSG=(
  [PRESS_KEY]="Presione una tecla para continuar..."
  [DEL_FILE]="Eliminando archivos con extensión"
  [DEL_ALL_FILE]="Eliminando archivos temporales"
  [END_PROCESS]="Archivo generado"
  [VERSION]="Versión"
  [HELP_CLEAN]="Limpiar archivos temporales"
  [HELP_BUILD]="Generar archivo pdf, no elimina temporales"
  [HELP_HELP]="Muestra la información sobre el uso"
  [FILE_NOT_FOUND]="El archivo no existe"
  [EXAMPLE]="Ejemplo"
  [MAKE_PDF]="Crea el archivo pdf"
  [USE]="USO"
  [OPTIONS]="OPCIONES"
)

FILE_NAME_PROJ=proyecto
FILE_NAME_FIN=trabajo

pause() {
  read -p "---> ${MSG[PRESS_KEY]}"
}

clean_files() {
  echo "---> ${MSG[DEL_ALL_FILE]}"
  for ext in ${TEMP_EXT[@]}
  do
    find . -type f -name "*.$ext" -delete
  done
}

validate_file() {
  if [ ! -f $1.tex ]; then
    echo "---> ${MSG[FILE_NOT_FOUND]} $1.tex"
    exit 1
  fi
}

generate_document() {
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
  move_file $1
  echo "---> ${MSG[END_PROCESS]} $1.pdf"
}

usage() {
  echo ""
  echo "$UNI"
  echo "$NAME"
  echo "${MSG[VERSION]} $VERSION ($FECHA)"
  echo ""
  echo "${MSG[USE]}:"
  echo "   ./cli.sh [arg] - ${MSG[MAKE_PDF]}, ${MSG[EXAMPLE]}: ./cli.sh $FILE_NAME_PROJ"
  echo ""
  echo "${MSG[OPTIONS]}:"
  echo "   -c, --clean - ${MSG[HELP_CLEAN]}"
  echo "                 ${MSG[EXAMPLE]}: ./cli.sh -c"
  echo "   -b, --build - ${MSG[HELP_BUILD]}"
  echo "                 ${MSG[EXAMPLE]}: ./cli.sh -b $FILE_NAME_PROJ"
  echo "   -h, --help  - ${MSG[HELP_HELP]}"
  echo "                 ${MSG[EXAMPLE]}: ./cli.sh -h"
  echo ""
}

all() {
  validate_file $1
  clean_files
  generate_document $1
  clean_files
}

set_file_name() {
  if  [ "$1" == "" ]
    then
      file=$FILE_NAME_FIN
    else
      file=$1
  fi
}

move_file() {
  mkdir pdf
  mv $1.pdf pdf/$1.pdf
}

run() {
  if [ "$#" == 0 ];
    then
      all $FILE_NAME_FIN
    else
      case "$1" in
          -c | --clean )
              clean_files
              ;;
          -b | --build )
              set_file_name $2
              validate_file $file
              generate_document $file
              ;;
          -h | --help )
              usage
              ;;
          *)
              set_file_name $1
              all $file
              ;;
      esac
  fi
  exit 0
}

run $*
