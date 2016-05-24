#!/usr/bin/env bash

if [[ "$BASH_VERSION" =~ ^[0-3] ]]
  then
    echo "Version de bash '$BASH_VERSION' demasiado viejo.  Necesitas al menos '4.x.x'"
    exit 1
fi

VERSION="v4.0"
NAME="Plantilla LaTeX Trabajo de Grado"
UNI="Universidad Centoccidental Lisandro Alvarado"

TEMP_EXT=(
  aux
  bbl
  blg
  glg
  glo
  gls
  glsdefs
  ist
  lal
  lol
  loc
  loi
  lod
  loq
  out
  toc
  log
  synctex.gz
  dvi
  brf
  lon
  bit
  lof
  lot
  glx
  gxg
  gxs
  idx
  ilg
  ind
  url
  svn
)

declare -A MSG=(
  [PRESS_KEY]="Presione una tecla para continuar..."
  [DEL_FILE]="Eliminando archivos con extensión"
  [DEL_ALL_FILE]="Eliminando archivos temporales"
  [END_PROCESS]="Archivo generado"
  [VERSION]="Versión"
  [HELP_CLEAN]="Limpiar archivos temporales"
  [HELP_BUILD]="Generar archivo pdf"
  [HELP_HELP]="Ayuda"
  [FILE_NOT_FOUND]="El archivo no existe"
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
  echo "---> ${MSG[END_PROCESS]} $1.pdf"
}

usage() {
  echo "$UNI"
  echo "$NAME"
  echo "${MSG[VERSION]} $VERSION"
  echo "   -c, clean - ${MSG[HELP_CLEAN]}"
  echo "   -b, build - ${MSG[HELP_BUILD]}"
  echo "   -h, help - ${MSG[HELP_HELP]}"
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

run() {
  if [ "$#" == 0 ];
    then
      all $FILE_NAME_FIN
    else
      case "$1" in
          -c | [Cc]lean | CLEAN )
              clean_files
              ;;
          -b | [Bb]uild | BUILD )
              set_file_name $2
              validate_file $file
              generate_document $file
              ;;
          -h | [Hh]elp | HELP )
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
