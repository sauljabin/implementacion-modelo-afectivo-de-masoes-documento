%%
% Copyright (c):
% 	2014-2017 Saúl Piña <sauljabin@gmail.com> (https://github.com/sauljabin/plantilla-latex-trabajo-de-grado-ucla).
% 	2013 Miguel León <melf.ever.after@gmail.com> (https://code.google.com/p/uclamsc).
% 	2009 Juan Rada Vilela <jcrada@gmail.com> y Rubén Parma <parmaia@gmail.com> (https://github.com/jcrada/latex-uclamsc).
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.
%%

%%%%% INICIO CONFIGURACION GENERAL %%%%%

\NeedsTeXFormat{LaTeX2e}
\newcommand{\uclamscversion}{3.4}
\newcommand{\uclamscdate}{2017/07/26}
\ProvidesClass{uclamsc}[\uclamscdate, \uclamscversion]
\typeout{Reportar dudas y errores a <sauljabin@gmail.com>.}

\newif\if@doblecara\@doblecarafalse
\DeclareOption{doblecara}{
  \@doblecaratrue
}

\ProcessOptions\relax

\if@doblecara % Para los márgenes
  \LoadClass[12pt,letterpaper,final,openany,twoside]{book}
  \raggedbottom % Elimina warnings de vbox, causados por el requerimiendo de alineación \flushbottom de las páginas a doble cara.
\else
  \LoadClass[12pt,letterpaper,final,oneside]{book}
\fi

\RequirePackage[english,spanish,es-lcroman,es-nodecimaldot]{babel} % english para el abstract, es-lcroman para números romanos en minúsculas en páginas preliminares
\RequirePackage[top=3cm,bottom=3cm,left=3cm,right=3cm,bindingoffset=1cm]{geometry}
\RequirePackage[utf8]{inputenc} % El encoding por defecto es utf8, aunque en Windows podría traer problemas (e.g. no mostrar caracteres acentuados)
\RequirePackage{lmodern} % Mejora la codificación de {fontenc}, [LY1] arroja warings
\RequirePackage[T1]{fontenc} % Para evitar advertencia al compilar
\RequirePackage[onehalfspacing]{setspace} % Para el espaciado del documento
\RequirePackage[colorlinks=false]{hyperref} % Para hipervínculos en el documento (ver \iniciar)
\RequirePackage{url} % Para dar formato a direcciones web.
\RequirePackage{ragged2e} % Para justificar texto (\justifying)
\RequirePackage{paralist} % Para enumeraciones dentro de párrafos
\RequirePackage{enumitem} % Para enumeraciones
\RequirePackage{color} % Para poner color en notas y pendientes
\RequirePackage{fancyhdr} % Para poner numeración de páginas en la parte baja
\RequirePackage{tocloft} % Para configurar índice general, de figuras y cuadros
\RequirePackage{graphicx} % Para insertar imágenes
\RequirePackage{float} % Para el ambiente de las imágenes
\RequirePackage{natbib} % Para la bibliografía
\RequirePackage{calc} % Para poder realizar operaciones con las variables
\RequirePackage{ifthen} % Para condiciones, usado en pendientes
\RequirePackage[toc,section=section]{glossaries} % Para la definición de términos básicos
\RequirePackage{listings} % Para formatear código fuente o algoritmos
\RequirePackage[spanish,onelanguage]{algorithm2e} % Para escribir algoritmos en pseudo-codigo % [boxed,spanish,onelanguage]
\RequirePackage{usebib} % Para el comando citetitle
\RequirePackage{keyval} % Para los parametros de los ambientes
\RequirePackage{pgfgantt} % Para gantt
\RequirePackage{ctable} % Para los cuadros, particularmente las líneas (\toprule, \midrule, \bottomrule)
\RequirePackage{amsmath} % Para utilitarios de ecuaciones matemáticas
\RequirePackage{amssymb} % Para símbolos matemáticos
\RequirePackage{longtable} % Para cuadros
\RequirePackage{rotating} % Para rotar images, cuadros, etc, https://en.wikibooks.org/wiki/LaTeX/Rotations
\RequirePackage{multirow} % Comandos extras para cuadros
\RequirePackage{xstring} % Para utilitarios de string

%%%%% FIN CONFIGURACION GENERAL %%%%%

%%%%% INICIO NUEVOS COMANDOS %%%%%

% Comando refrencia, permite referenciar elementos en el documento
% Primer argumento: etiquetas separadas por coma
% Segundo argumento: nombre del elemento en singular
% Tercer argumento: nomobre del elemento en plural
\newcommand{\referencia}[3]{\@tempcnta\z@\@for\@tempa:=#1\do{\advance\@tempcnta\@ne}\ifthenelse{\the\@tempcnta>1}
{\MakeLowercase{#3}~\@tempcntb\z@\@for\tempb:=#1\do{\advance\@tempcntb\@ne\trim{\tempb}{\valueref}\ifthenelse{\the\@tempcntb>1}{\ifthenelse{\the\@tempcntb=\the\@tempcnta}{~y~\ref{\valueref}}{,~\ref{\valueref}}}{\ref{\valueref}}}}
{\trim{#1}{\valueref}\hyperref[\valueref]{\MakeLowercase{#2}~\ref{\valueref}}}}

% Comando usado para programación, elimina espacios en blanco al final e inicio de un texto
% Ejemplo de uso: \trim{ texto }{\nuevotext} \nuevotexto
\newcommand{\trim}[2]{\StrSubstitute{#1}{ }{}[#2]}

% Comando: pendientes
% Descripción: Llamado en \configurar para listar los pendientes de uclamsc.cls
\newcommand{\pendientes}{}

% En caso que una variable sea obligatoria
\newcommand{\variablefaltante}[1]{{\tt \bfseries DEFINIR \textbackslash {#1}\{\} }}

% Título del trabajo de grado
\def\@titulo{\variablefaltante{titulo}}
\newcommand{\titulo}[1]{\def\@titulo{#1}}

% Grado a optar
\def\@grado{\variablefaltante{grado}}
\newcommand{\grado}[1]{\def\@grado{#1}}

% Mencion a optar
\def\@mencion{\variablefaltante{mencion}}
\newcommand{\mencion}[1]{\def\@mencion{#1}}

% Nombre del autor
\def\@autor{\variablefaltante{autor}}
\newcommand{\autor}[1]{\def\@autor{#1}}

% CI del autor
\def\@ciautor{\variablefaltante{ciautor}}
\newcommand{\ciautor}[1]{\def\@ciautor{#1}}

% Nombre del Decanato. (e.g. Ciencias y Tecnología)
\def\@decanato{\variablefaltante{decanato}}
\newcommand{\decanato}[1]{\def\@decanato{#1}}

% Nombre del Postgrado. (e.g. Ciencias de la Computación)
\def\@postgrado{\variablefaltante{postgrado}}
\newcommand{\postgrado}[1]{\def\@postgrado{#1}}

% Ciudad. (e.g. Barquisimeto)
\def\@ciudad{\variablefaltante{ciudad}}
\newcommand{\ciudad}[1]{\def\@ciudad{#1}}

% Día de la presentación. (e.g. 20)
\def\@diapresentacion{\variablefaltante{diapresentacion}}
\newcommand{\diapresentacion}[1]{\def\@diapresentacion{#1}}

% Mes de la presentación (e.g. Marzo)
\def\@mespresentacion{\variablefaltante{mespresentacion}}
\newcommand{\mespresentacion}[1]{\def\@mespresentacion{#1}}

% Año de la presentación (e.g. 2009)
\def\@anopresentacion{\variablefaltante{anopresentacion}}
\newcommand{\anopresentacion}[1]{\def\@anopresentacion{#1}}

% Mes en inglés para el abstract
\def\@monthpresentacion{\variablefaltante{monthpresentacion}}
\newcommand{\monthpresentacion}[1]{\def\@monthpresentacion{#1}}

% Incluir mes en la carátula
\newcommand{\mesencaratula}{\def\@mesencaratula{}}

% Incluir tutor en la presentacion
\newcommand{\tutorenpresentacion}{\def\@tutorenpresentacion{}}

% Género del o la tutora
\newcommand{\estutora}{\def\@estutora{}}

% Imprime el género del o la tutora
\newcommand{\tutorname}{\ifthenelse{\isundefined{\@estutora}}{Tutor}{Tutora}}

% Género del o la autora
\newcommand{\esautora}{\def\@esautora{}}

% Imprime el género del o la tutora
\newcommand{\autorname}{\ifthenelse{\isundefined{\@esautora}}{Autor}{Autora}}

% Variable si es proyecto o trabajo final
\def\@trabajoname{Trabajo de grado}
\newcommand{\setnombretrabajo}[1]{\def\@trabajoname{#1}}

% Define si es proyecto
\newcommand{\esproyecto}{\setnombretrabajo{Proyecto de trabajo de grado}}

% Nombre del tutor
\def\@tutor{\variablefaltante{tutor}}
\newcommand{\tutor}[1]{\def\@tutor{#1}}

% CI del tutor
\def\@citutor{\variablefaltante{citutor}}
\newcommand{\citutor}[1]{\def\@citutor{#1}}

% Nombre del primer jurado
\def\@primerjurado{\variablefaltante{primerjurado}}
\newcommand{\primerjurado}[1]{\def\@primerjurado{#1}}

% Nombre del segundo jurado
\def\@segundojurado{\variablefaltante{segundojurado}}
\newcommand{\segundojurado}[1]{\def\@segundojurado{#1}}

% Incluir fecha en el resumen
\newcommand{\fechaenresumen}{\def\@fechaenresumen{}}

% Resumen del trabajo
\def\@resumen{\variablefaltante{resumen}}
\newcommand{\resumen}[1]{\def\@resumen{#1}}

% Palabras clave separadas por coma. (e.g. IA, PSO, etc.)
\def\@palabrasclave{\variablefaltante{palabrasclave}}
\newcommand{\palabrasclave}[1]{\def\@palabrasclave{#1}}

% Título del trabajo en inglés
\title{\variablefaltante{title}}

% Resumen del trabajo en inglés
\def\@abstract{\variablefaltante{abstract}}
\newcommand{\abstract}[1]{\def\@abstract{#1}}

% Palabras clave del trabajo en inglés.
\def\@keywords{\variablefaltante{keywords}}
\newcommand{\keywords}[1]{\def\@keywords{#1}}

\def\@pendientes{false} % Determina si se usan o no los pendientes. Por defecto, desactivado. Para activar usar \habilitarpendientes
\def\@notas{false} % Determina si se usan o no las notas. Por defecto, desactivado. Para activar usar \habilitarnotas

% Comando: habilitarpendientes
% Descripción: Muestra los pendientes agregados al trabajo (\pendiente{Revisar X}) y el índice de pendientes. Debe usarse antes de \configurar
% Uso:
% \habilitarpendientes
% ....
% \configurar
\newcommand{\habilitarpendientes}{\def\@pendientes{true}}

% Comando: habilitarnotas
% Descripción: Muestra las notas hechas al trabajo (\nota{Esto debería ser de otra forma}) y el índice de notas. Debe usarse antes de \configurar
% Uso:
% \habilitarnotas
% ....
% \configurar
\newcommand{\habilitarnotas}{\def\@notas{true}}

% Comando: espaciotriple
% Descripción: Agrega un espacio triple.
\newcommand{\espaciotriple}{
	\vspace{22pt}
}

% Comando: espaciodoble
% Descripción: Agrega un espacio doble.
\newcommand{\espaciodoble}{
	\vspace{12pt}
}

% Comando: espaciosimple
% Descripción: Agrega un espacio simple
\newcommand{\espaciosimple}{
	\vspace{0cm}
}

% Comando: tab
% Descripción: Inserta un espacio simulando a una tabulación.
% Uso: \tab
\newcommand{\tab}[1]{\hspace{#1em}}

% Comando: tabm
% Descripción: Inserta un espacio simulando a una tabulación pero en modo matemático.
% Uso: $\tab$ \begin{ecuaciones} \tabm \tabm \end{ecuaciones}
\newcommand{\tabm}{\;\;\;\;\;\;}

% Para introducir una cita de la forma Autor (año), donde Autor es el apellido del autor del trabajo de grado
\def\@citarcomo{\variablefaltante{citarcomo}}
\newcommand{\citarcomo}[1]{\def\@citarcomo{#1}}

% Comando: yo
% Descripción: Introduce el apellido del autor y el año de este trabajo (e.g. Bar (2009)).
% Uso: \yo
\newcommand{\yo}{\@citarcomo~(\@anopresentacion)}

% Comando: agregartermino
% Descripción: Agrega un término al glosario.
% Parámetros: [1] etiqueta, [2] propiedades de la forma: name={nombre}, text={texto}, description={descripción}, plural={nombre plural}
% Uso:
% \agregartermino{robot}{
% name={Robot},
% text={robot},
% description={Entidad capaz de ...},
% plural={Robots}
% }
% Luego hacer referencia \gls{robot}
\newcommand{\agregartermino}[2]{\newglossaryentry{#1}{#2}}

% Variables de ilustracion
\def\@ilustrationname{Ilustración}
\def\@ilustrationnamepl{Ilustraciones}

% Comando: setnombreilustracion
% Descripción: Personaliza el nombre a mostrar en caso que no se quiera "ilustración"
% Parametros: [1] Nombre singular [2] Nombre plural
% Uso: \setnombreilustracion{Figura}{Figuras}
\newcommand{\setnombreilustracion}[2]{
  \def\@ilustrationname{#1}
  \def\@ilustrationnamepl{#2}
}

% Comando: refilustracion
% Descripción: Hace referencia a una ilustración
% Parametros: [1] Etiqueta
% Uso: \refilustracion{etiqueta}
\newcommand{\refpilustracion}[1]{(ver \refilustracion{#1})}
\newcommand{\refilustracion}[1]{\referencia{#1}{\@ilustrationname}{\@ilustrationnamepl}}

% Variables cuadro
\def\@tabulationmname{Cuadro}
\def\@tabulationmnamepl{Cuadros}

% Comando: setnombrecuadro
% Descripción: Personaliza el nombre a mostrar en caso que no se quiera "cuadro"
% Parametros: [1] Nombre singular [2] Nombre plural
% Uso: \setnombrecuadro{Tabla}{Tablas}
\newcommand{\setnombrecuadro}[2]{
  \def\@tabulationmname{#1}
  \def\@tabulationmnamepl{#2}
}

% Comando: refcuadro
% Descripción: Hace referencia a un cuadro
% Parametros: [1] Etiqueta
% Uso: \refcuadro{etiqueta}
\newcommand{\refpcuadro}[1]{(ver \refcuadro{#1})}
\newcommand{\refcuadro}[1]{\referencia{#1}{\@tabulationmname}{\@tabulationmnamepl}}

% Variables algoritmo
\def\@algorithmname{Algoritmo}
\def\@algorithmnamepl{Algoritmos}

% Comando: setnombrealgoritmo
% Descripción: Personaliza el nombre a mostrar en caso que no se quiera "algoritmo"
% Parametros: [1] Nombre singular [2] Nombre plural
% Uso: \setnombrealgoritmo{Algoritmo}{Algoritmos}
\newcommand{\setnombrealgoritmo}[2]{
  \def\@algorithmname{#1}
  \def\@algorithmnamepl{#2}
}

% Comando: refalgoritmo
% Descripción: Hace referencia a un algoritmo
% Parametros: [1] Etiqueta
% Uso: \refalgoritmo{etiqueta}
\newcommand{\refpalgoritmo}[1]{(ver \refalgoritmo{#1})}
\newcommand{\refalgoritmo}[1]{\referencia{#1}{\@algorithmname}{\@algorithmnamepl}}

% Variables grafico
\def\@chartname{Gráfico}
\def\@chartnamepl{Gráficos}

% Comando: setnombregrafico
% Descripción: Personaliza el nombre a mostrar en caso que no se quiera "grafico"
% Parametros: [1] Nombre singular [2] Nombre plural
% Uso: \setnombrealgoritmo{Gráfico}{Gráficos}
\newcommand{\setnombregrafico}[2]{
  \def\@chartname{#1}
  \def\@chartnamepl{#2}
}

% Comando: refgrafico
% Descripción: Hace referencia a un grafico
% Parametros: [1] Etiqueta
% Uso: \refgrafico{etiqueta}
\newcommand{\refpgrafico}[1]{(ver \refgrafico{#1})}
\newcommand{\refgrafico}[1]{\referencia{#1}{\@chartname}{\@chartnamepl}}

% Variables listado
\def\@lstlistingname{Listado}
\def\@lstlistingnamepl{Listados}

% Comando: setnombrelistado
% Descripción: Personaliza el nombre a mostrar en caso que no se quiera "listado"
% Parametros: [1] Nombre singular [2] Nombre plural
% Uso: \setnombrelistado{Listado}{Listados}
\newcommand{\setnombrelistado}[2]{
  \def\@lstlistingname{#1}
  \def\@lstlistingnamepl{#2}
}

% Comando: reflistado
% Descripción: Hace referencia a un listado
% Parametros: [1] Etiqueta
% Uso: \reflistado{etiqueta}
\newcommand{\refplistado}[1]{(ver \reflistado{#1})}
\newcommand{\reflistado}[1]{\referencia{#1}{\@lstlistingname}{\@lstlistingnamepl}}

% Para citar titulo
%\renewcommand\defcitealias[2]{\@ifundefined{al@#1\@extra@b@citeb}{}{\PackageWarning{natbib}{Overwriting existing alias for citation #1}}\@namedef{al@#1\@extra@b@citeb}{#2}}
\renewcommand\defcitealias[2]{\@namedef{al@#1\@extra@b@citeb}{#2}}
\newcommand{\citetitle}[1]{\defcitealias{#1}{\usebibentry{#1}{title}}``\citetalias{#1}''}
\newcommand{\citeptitle}[1]{(\citetitle{#1})}

% Comando: citepyear
\newcommand{\citepyear}[1]{(\citeyear{#1})}

% Comando: refecuacion
% Descripción: Hace referencia a un ecuacion
% Parametros: [1] Etiqueta
% Uso: \refecuacion{etiqueta}
\newcommand{\refpecuacion}[1]{(ver \refecuacion{#1})}
\newcommand{\refecuacion}[1]{\referencia{#1}{ecuación}{ecuaciones}}

% Comando: refseccion
% Descripción: Hace referencia a una sección
% Parametros: [1] Etiqueta
% Uso: \refseccion{etiqueta}
\newcommand{\refpseccion}[1]{(ver \refseccion{#1})}
\newcommand{\refseccion}[1]{\referencia{#1}{sección}{secciones}}

% Variable bibliografia
\def\@bibliografia{bibliografia}
\newcommand{\bibliografia}[1]{
	\def\@bibliografia{#1}
	\bibinput{#1}
}

% Comando comillas
\newcommand{\comillas}[1]{``#1''}

% Agrega página en blanco.
\newcommand{\pagenblanco}{
	\newpage
	\thispagestyle{empty}
	\mbox{}
	\newpage
}

% Comando para colocar significados en ingles
\newcommand{\eningles}[1]{(\textit{``#1''}, en inglés)}

% Comando para agregar texto en formato código fuente
\newcommand{\codigoenlinea}[1]{{\ttfamily \selectfont#1}}

% Comandos para símbolos de números reales
\newcommand{\R}{$\mathbb{R}$}
\newcommand{\Rcuadrado}{$\mathbb{R}^2$}
\newcommand{\Rcubo}{$\mathbb{R}^3$}

% Configuración para numerar secciones
\newcommand{\numerarsecciones}{\def\@numerarsecciones{}}

%%%%% FIN NUEVOS COMANDOS %%%%%

%%%%% INICIO AMBIENTES %%%%%

% Ambiente: lista
% Descripción: Para enumerar items bien sea enumerados o sin enumerar.
% Parámetros: [1] Prefijo de cada item, [2] comandos adicionales (e.g. \usecounter{enumi}).
% Uso:
% \begin{lista}{\arabic{enumi}. }{\usecounter{enumi}}
%	\item item 1
%	...
%	\item item n
% \end{lista}
\newenvironment{lista}[2]
	{
	\setlength{\topsep}{12pt}
		\begin{list}{#1}
		{
			#2
			\setlength{\labelindent}{\leftskip+\JustifyingParindent}
			\setlength{\itemindent}{0em}
			\setlength{\leftmargin}{\leftskip+\JustifyingParindent}
			\setlength{\labelsep}{0em}
			\setlength{\labelwidth}{0em}
			\setlength{\partopsep}{0em}
		  	\setlength{\topsep}{0em}
		  	\setlength{\itemsep}{0em}
		  	\setlength{\parsep}{0em}
		}
	}
	{\end{list}}

% Ambiente: enumeracion
% Descripción: Para enumerar una lista de items.
% Uso:
% \begin{enumeracion}
% 	\item Item 1
% 	\item Item 2
% 	\item Item 3
% \end{enumeracion}
% Resultado:
	% 1. Item 1
	% 2. Item 2
	% 3. Item 3
\newenvironment{enumeracion}
	{\begin{lista}{\arabic{enumi}. }{\usecounter{enumi}}}
	{\end{lista}}

% Ambiente: viñetas
% Descripción: Para funcionar como itemize, manteniendo el formato correcto.
% Uso:
% \begin{vinetas}
% 	\item foo
% 	\item bar
% 	\item foobar
% \end{vinetas}
\newenvironment{vinetas}
	{\begin{lista}{$\bullet$ }{}}
	{\end{lista}}

% Ambiente: enumeracionenparrafo
% Descripción: Para enumerar una lista de items dentro de un párrafo
% Uso:
% ... Sólo hay 2 razones para eso:
% \begin{enumeracionenparrafo}
% 	\item Razón 1,
% 	\item Razón 2
% \end{enumeracionenparrafo}
% Resultado:
% ... Sólo hay 2 razones para eso: (a) Razón 1, (b) Razón 2
\newenvironment{enumeracionenparrafo}
	{\begin{inparaenum}[(a)]}
	{\end{inparaenum}}

% Ambiente: preliminares
% Descripción: Para usar en las páginas preliminares, determina numeración de páginas.
% Uso:
% \begin{preliminares}
% \include{chapters/dedicatoria}
% \include{chapters/agradecimientos}
% \end{preliminares}
\newenvironment{preliminares}
	{\pagenumbering{roman}}
	{\pagenumbering{arabic}}

% Ambiente: contenido
% Descripción: Determina el comienzo del contenido. Por los momentos hace nada, pero en el futuro quizás tenga función.
% Uso:
% \begin{contenido}
% 	\include{chapters/introduccion}
% 	\include{chapters/el-problema}
% \end{contenido}
\newenvironment{contenido}{}{}

% Ambiente: anexos
% Descripción: Determina el comienzo de los anexos. Por los momentos hace nada, pero en el futuro quizás tenga función.
% Uso:
% \begin{anexos}
% 	\include{chapters/anexo-1}
% 	\include{chapters/anexo-2}
% \end{anexos}
\newenvironment{anexos}{\haceranexos}{}

% Comandos de listados
\lstset{numberbychapter=false, tabsize=4}

\newcommand\definirliterales[1]{
	\lstdefinestyle{literales}{literate=
	{á}{{\'a}}1 {é}{{\'e}}1 {í}{{\'i}}1 {ó}{{\'o}}1 {ú}{{\'u}}1
	{Á}{{\'A}}1 {É}{{\'E}}1 {Í}{{\'I}}1 {Ó}{{\'O}}1 {Ú}{{\'U}}1
	{ñ}{{\~n}}1 {Ñ}{{\~N}}1 #1}
}

\definirliterales{}

\newcommand\letralistados[1][\ttfamily \fontsize{10pt}{8pt}\selectfont]
{\lstdefinestyle{letra}{basicstyle=#1}}

\letralistados

% Ambiente listado
% Descripción: Ambiente utilizado para insertar codigo fuente o algoritmos.
% Parametros opcionales: titulo, etiqueta, indice, fuente, sinleyenda.
% Parametro obligatorio: lenguaje
% Ejemplos:
% \begin{listado}[titulo=Titulo, indice=Indice Personalizado, etiqueta=etiquetapararef, fuente=Fuente personalizada]{[LaTeX]TeX}
% ...
% \end{listado}
\lstnewenvironment{listado}[2][]{
	\espaciotriple
	\setkeys{titulolistado}{#1}
	\titulolistado
	\lstset{style=letra, style=literales, language=#2}
}{
	\espaciotriple
}

% Ambiente: ilustracion
% Descripción: Prepara el contexto para insertar una ilustración o imagen.
% Parametros opcionales: titulo, etiqueta, indice, fuente, sinleyenda.
% Uso:
% \begin{ilustracion}
% 	\includegraphics[height=2cm,width=2cm]{figures/cuadrado.png}
% \end{ilustracion}
% uso con parámetros opcionales:
% \begin{ilustracion}[titulo=Titulo, indice=Indice Personalizado, etiqueta=etiquetapararef, fuente=Fuente personalizada]
% 	\includegraphics[height=2cm,width=2cm]{figures/cuadrado.png}
% \end{ilustracion}
\newenvironment{ilustracion}[1][]{
	\begin{figure}[H]
	\espaciotriple
	\centering
	\setkeys{tituloilustracion}{#1}
}{
	\\\tituloilustracion
	\end{figure}
	\espaciodoble
}

% Ambiente: grafico
% Descripción: Prepara el contexto para insertar un gráfico (e.g. gráfico de barras, líneas, torta, etc.).
% Parametros opcionales: titulo, etiqueta, indice, fuente, sinleyenda.
% Uso:
% \begin{grafico}
% 	\includegraphics[height=2cm,width=2cm]{figures/fitness.png}
% \end{grafico}
% uso con parámetros opcionales:
% \begin{ilustracion}[titulo=Titulo, indice=Indice Personalizado, etiqueta=etiquetapararef, fuente=Fuente personalizada]
% 	\includegraphics[height=2cm,width=2cm]{figures/fitness.png}
% \end{ilustracion}
\newenvironment{grafico}[1][]{
	\begin{figure}[H]
	\espaciotriple
	\centering
	\setkeys{titulografico}{#1}
}{
	\\\titulografico
	\end{figure}
	\espaciodoble
}

% Ambiente: algoritmo
% Descripción: Permite insertar un algoritmo con formato pseudocodigo
% Parametros opcionales: titulo, etiqueta, indice, fuente, sinleyenda.
% Uso:
% \begin{algoritmo}
% 	...
% \end{algoritmo}
% uso con parámetros opcionales:
% \begin{algoritmo}[titulo=Titulo, indice=Indice Personalizado, etiqueta=etiquetapararef, fuente=Fuente personalizada]
% 	...
% \end{algoritmo}
\newenvironment{algoritmo}[1][]{
	\begin{algorithm}[H]
	\espaciodoble
	\setkeys{tituloalgoritmo}{#1}
	\footnotesize
}{
	\tituloalgoritmo
	\end{algorithm}
	\espaciodoble
}

% Comando: fuentecuadro
% Descripción: Agrega la fuente del cuadro
% Parámetros: [1] Numero de columnas del cuadro, [2] Fuente
\newcommand{\fuentecuadro}[2]{\multicolumn{#1}{l}{\bfseries Fuente:} #2. \hfill\espaciodoble}

% Ambiente: cuadro
% Descripción: Prepara el contexto para insertar un cuadro o tabla.
% Parametros opcionales: titulo, etiqueta, indice, fuente, sinleyenda.
% Parametro obligatorio: columnas
% Uso:
% \begin{cuadro}[titulo=Titulo, indice=Indice Personalizado, etiqueta=etiquetapararef]{lccc}
% 	\toprule
% 	Jugares I/II & Piedra & Papel & Tijeras\\
% 	\midrule
% 	Piedra   & (0,0) & (-1,1) & (1,-1)\\
% 	Papel   & (1,-1) & (0,0) & (-1,1)\\
% 	Tijeras   & (-1,1) & (1,-1) & (0,0)\\
% 	\bottomrule
% 	\fuentecuadro{4}{Juan Rada (2005)}
% \end{cuadro}
\define@key{cuadro}{letra}{\def\cuadro@letra{#1}}
\newenvironment{cuadro}[2][]
{
	\centering
	\espaciodoble
	\setkeys{cuadro}{#1}
	\titulocuadro
	\ifthenelse{\isundefined{\cuadro@letra}}{\scriptsize}{\cuadro@letra}
	\begin{spacing}{1.5}
	\begin{longtable}{#2}
}
{
	\end{longtable}
	\end{spacing}
}

% Ambiente: citatextual
% Descripción: Prepara el contexto para una cita textual de más de 40 palabras.
% Párrafos subsiguientes al primero, tienen sangría adicional según el manual de la UPEL.
% Uso:
% \begin{citatextual}
%...Esto es una cita textual... (40 palabras)...
% \end{citatextual}
\newenvironment{citatextual}
	{
		\espaciodoble
		\begin{spacing}{1.0}
		\setlength{\leftskip}{\leftskip+\parindent}
		\setlength{\rightskip}{\rightskip+\parindent}
		\noindent\ignorespaces
	}
	{
		\end{spacing}
		\espaciodoble
	}

% Ambiente: ecuacion
% Descripción: Prepara el contexto para insertar una ecuación
% Parámetros: [1] etiqueta para luego referirse como \ref{etiqueta}
% Nota: Si aparece la ecuación sin el primer caracter, es que se olvidó agregar el parámetro.
% Uso:
% \begin{ecuacion}{etiqueta}
% \sum{F_{x}} = 0
% \end{ecuacion}
\newenvironment{ecuacion}[1]
	{
		\espaciosimple
		\begin{equation}
		\label{#1}
	}
	{\end{equation}}

% Ambiente: ecuaciones
% Descripción: Prepara el contexto para insertar varias ecuaciones
% Uso:
% \begin{ecuaciones}
% \sum{F_{x}} = 0\\
% \sum{M_{x} = 0}
% \end{ecuaciones}
\newenvironment{ecuaciones}
	{
		\espaciosimple
		\begin{eqnarray}
	}
	{\end{eqnarray}}

% Ambiente: ecuaciones*
% Descripción: Prepara el contexto para insertar varias ecuaciones sin enumerarlas
% Uso:
% \begin{ecuaciones*}
% \sum{F_{x}} = 0\\
% \sum{M_{x} = 0}
% \end{ecuaciones*}
\newenvironment{ecuaciones*}
	{
		\espaciosimple
		\begin{eqnarray*}
	}
	{\end{eqnarray*}}

%%%%% FIN AMBIENTES %%%%%

%%%%%%%%%%%%%%%%%%%%%%%%% INTERNO %%%%%%%%%%%%%%%%%%%%%%%%%

% Comando: configurar
% Descripción: Configura todo el documento. Es el primer comando a ejecutarse antes de los preliminares.
\newcommand{\configurar}{
	\configurarcomun
	\configurarindice
	\configurarestructura
	\pendientes
}

% Comando: configurarcomun
% Descripción: Configura idioma, espaciado, numeración e hipervínculos (para índice, url, etc.)
\newcommand{\configurarcomun}{
	\selectlanguage{spanish}
	\setstretch{1.5}
	\pagestyle{fancy} % Para sacar números de página en el pie de página y al centro
	\renewcommand{\headrulewidth}{0pt} % Para no mostrar una línea en el encabezado
	\renewcommand{\footrulewidth}{0pt} % Para no mostrar una línea en el pie de página
	\setlength{\headheight}{14.5pt} % Para evitar advertencia al compilar :P
	\renewcommand{\theequation}{\@arabic\c@equation} % Para la numeración de ecuaciones.
	\setlength{\JustifyingParindent}{1.7em} % Sacado con regla tomando medidas del manual de trabajo de grado
	\hypersetup{
		pdftitle={\@titulo},
		pdfauthor={\@autor},
		pdfkeywords={\@palabrasclave},
		pdfsubject={\@trabajoname~presentado en la Universidad Centroccidental Lisandro Alvarado para optar al título de \@grado~\@mencion},
		pdfborder={0 0 0},
	    linkcolor = red,
	    anchorcolor = red,
	    citecolor = blue,
	    filecolor = red,
	    urlcolor = red
	}
}

% Comando: configurarestructura
% Descripción: Determina el formato de capítulos, secciones, subsecciones y subsubsecciones
\newcommand{\configurarestructura}{
	\def\@makechapterhead##1{ %Para los capítulos numerados
		\vspace*{1cm}	%Espacio de 1cm antes de cada capítulo
		\centering{\normalfont \normalsize \bfseries \MakeUppercase{\@chapapp} \thechapter}
		\\
		\espaciotriple
		\centering{\normalfont \normalsize \bfseries \MakeUppercase{##1}}
		\par
		\espaciotriple
		\justifying
		}

	\def\@makeschapterhead##1{ %Para los capítulos no numerados
		\centering{\normalfont \normalsize \bfseries \MakeUppercase{##1}}\\
		\espaciotriple
		\justifying
		}

	\ifthenelse{\isundefined{\@numerarsecciones}}{
		\renewcommand{\thechapter}{\Roman{chapter}} %Definir capítulos con números romanos
	}{}

	\renewcommand{\chaptermark}[1]{\markboth{}{}} %Eliminar encabezados de páginas
	\renewcommand{\sectionmark}[1]{\markboth{}{}} %Eliminar encabezados de páginas
	\setcounter{secnumdepth}{5}

	% Formato de secciones, subsecciones y subsubsecciones. (28pt es triple espaciado para fuentes de 12pt)
	% (23pt es la medida conseguida comparando resultados con documento original de reglas)
	% Fomatos según manual de la UPEL.
	\renewcommand{\section}{\@startsection{section}{1}{\z@}{22pt}{22pt}{\ifthenelse{\isundefined{\@numerarsecciones}}{\centering}{}\normalfont\normalsize\bfseries}}
	\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}{22pt}{22pt}{\normalfont\normalsize\bfseries\itshape}}
	\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\parindent}{22pt}{22pt}{\normalfont\normalsize\bfseries\itshape}}

	% Configuración del glosario.
	\glossarystyle{list}

	\renewcommand*{\glossarysection}[2][\@gls@title]{
		\def\@gls@title{##2}
		\seccion{##1}
		\@mkboth{}{}
	}
	\renewenvironment{theglossary}
	{
		\begin{description}
			\setlength{\itemindent}{-1em}
			% \item \printlength{\itemsep}
			% \setlength{\itemsep}{0ex}
	}
	{\end{description}}
}

% Comando: configurarindice
% Descripción: Crea los índices de ilustraciones, gráficos y cuadros. Además de algunos comandos para ser usados con éstos.
\newcommand{\configurarindice}{
	% Índice general
	\renewcommand{\tableofcontents}{
		\indexarpreliminar{Índice General}
		\capitulosinnumeracion{{Índice General}}
		\flushright{\bfseries PÁG.}
		\flushleft
		\@starttoc{toc}
	}
	\setcounter{tocdepth}{5} % Para mostrar hasta los párrafos (caso de preliminares).

	% Índice de listados (algoritmos y códigos)
	\renewcommand{\lstlistlistingname}{{Índice de \@lstlistingnamepl}}

	\renewcommand{\lstlistoflistings}{
		\IfFileExists{\jobname.lol}{
			\indexarpreliminar{\lstlistlistingname}
			\capitulosinnumeracion{{\lstlistlistingname}}
			\flushright{\bfseries PÁG.}
			\@starttoc{lol}
		}{
			\AtEndDocument{
				\ifthenelse{\value{lstlisting}>0}{\@starttoc{lol}}{}
			}
		}
	}

	\renewcommand{\thelstlisting}{\@arabic\c@lstlisting}

	\define@key{titulolistado}{titulo}{\def\titulolistado@titulo{##1}}
	\define@key{titulolistado}{etiqueta}{\def\titulolistado@etiqueta{##1}}
	\define@key{titulolistado}{indice}{\def\titulolistado@indice{##1}}
	\define@key{titulolistado}{fuente}{\def\titulolistado@fuente{##1}}
	\define@key{titulolistado}{sinleyenda}[true]{\def\titulolistado@sinleyenda{##1}}
	\define@key{titulolistado}{sinindice}[true]{\def\titulolistado@sinindice{##1}}

	\newcommand{\titulolistado}{
		\ifthenelse{\isundefined{\titulolistado@sinindice}}{
			\refstepcounter{lstlisting}
			\ifthenelse{\isundefined{\titulolistado@etiqueta}}{}{\label{\titulolistado@etiqueta}}
			\ifthenelse{\isundefined{\titulolistado@indice}}{
				\ifthenelse{\isundefined{\titulolistado@titulo}}{
					\addcontentsline{lol}{lstlisting}{\hspace{-1.5em}\protect{\thelstlisting.} \@lstlistingname~\thelstlisting}
				}{
					\addcontentsline{lol}{lstlisting}{\hspace{-1.5em}\protect{\thelstlisting.} \titulolistado@titulo}}
			}{
				\addcontentsline{lol}{lstlisting}{\hspace{-1.5em}\protect{\thelstlisting.} \titulolistado@indice}
			}
		}{}
		\ifthenelse{\isundefined{\titulolistado@sinleyenda}}{
			\ifthenelse{\isundefined{\titulolistado@titulo}}{
				\par\centering\normalfont\footnotesize\noindent{{\bfseries \@lstlistingname\ifthenelse{\isundefined{\titulolistado@sinindice}}{~\thelstlisting}{}.} \ifthenelse{\isundefined{\titulolistado@fuente}}{}{\\ {\bfseries Fuente:} \titulolistado@fuente.}}\\
			}{
				\par\centering\normalfont\footnotesize\noindent{{\bfseries \@lstlistingname\ifthenelse{\isundefined{\titulolistado@sinindice}}{~\thelstlisting}{}.} \titulolistado@titulo. \ifthenelse{\isundefined{\titulolistado@fuente}}{}{\\ {\bfseries Fuente:} \titulolistado@fuente.}}\\
			}
		}{}
	}

	% Índice de gráficos
	\newcommand{\listofchartsname}{{Índice de \@chartnamepl}}
	\newlistof[part]{charts}{loc}{\listofchartsname}

	% Comando: listofcharts
	% Descripción: Crea el índice de gráficos.
	\renewcommand{\listofcharts}{
		% Incluye el indice de gráficos solo si tiene contenido que mostrar. Como el mismo comando \@starttoc es el que genera el .loc y agrega el contenido al documento, esta fue la única forma que encontré.
		\IfFileExists{\jobname.loc}{
			\indexarpreliminar{\listofchartsname}
			\capitulosinnumeracion{{\listofchartsname}}
			\flushright{\bfseries PÁG.}
			\@starttoc{loc}
		}{
			\AtEndDocument{
				\ifthenelse{\value{charts}>0}{\@starttoc{loc}}{}
			}
		}
	}
	\renewcommand{\thecharts}{\@arabic\c@charts}

	\define@key{titulografico}{titulo}{\def\titulografico@titulo{##1}}
	\define@key{titulografico}{etiqueta}{\def\titulografico@etiqueta{##1}}
	\define@key{titulografico}{indice}{\def\titulografico@indice{##1}}
	\define@key{titulografico}{fuente}{\def\titulografico@fuente{##1}}
	\define@key{titulografico}{sinleyenda}[true]{\def\titulografico@sinleyenda{##1}}
	\define@key{titulografico}{sinindice}[true]{\def\titulografico@sinindice{##1}}

	\newcommand{\titulografico}{
		\ifthenelse{\isundefined{\titulografico@sinindice}}{
			\refstepcounter{charts}
			\ifthenelse{\isundefined{\titulografico@etiqueta}}{}{\label{\titulografico@etiqueta}}
			\ifthenelse{\isundefined{\titulografico@indice}}{
				\ifthenelse{\isundefined{\titulografico@titulo}}{
					\addcontentsline{loc}{charts}{\protect{\thecharts.} \@chartname~\thecharts}\par
				}{
					\addcontentsline{loc}{charts}{\protect{\thecharts.} \titulografico@titulo}\par
				}
			}{
				\addcontentsline{loc}{charts}{\protect{\thecharts.} \titulografico@indice}\par
			}
		}{}
		\ifthenelse{\isundefined{\titulografico@sinleyenda}}{
			\ifthenelse{\isundefined{\titulografico@titulo}}{
				\par\normalfont\footnotesize\noindent{{\bfseries \@chartname\ifthenelse{\isundefined{\titulografico@sinindice}}{~\thecharts}{}.} \ifthenelse{\isundefined{\titulografico@fuente}}{}{\\ {\bfseries Fuente:} \titulografico@fuente.}}\\
			}{
				\par\normalfont\footnotesize\noindent{{\bfseries \@chartname\ifthenelse{\isundefined{\titulografico@sinindice}}{~\thecharts}{}.} \titulografico@titulo. \ifthenelse{\isundefined{\titulografico@fuente}}{}{\\ {\bfseries Fuente:} \titulografico@fuente.}}\\
			}
		}{}
	}


  % Índice de Ilustraciones
	\newcommand{\listofilustrationsname}{{Índice de \@ilustrationnamepl}}
	\newlistof[part]{ilustrations}{loi}{\listofilustrationsname}

  %	Comando: listofilustrations
  %	Descripción: Crea el índice de ilustraciones.
	\renewcommand{\listofilustrations}{
		% Incluye el indice de ilustraciones solo si tiene contenido que mostrar. Como el mismo comando \@starttoc es el que genera el .loi y agrega el contenido al documento, esta fue la única forma que encontré.
		\IfFileExists{\jobname.loi}{
			\indexarpreliminar{\listofilustrationsname}
			\capitulosinnumeracion{{\listofilustrationsname}}
			\flushright{\bfseries PÁG.}
			\@starttoc{loi}
		}{
			\AtEndDocument{
				\ifthenelse{\value{ilustrations}>0}{\@starttoc{loi}}{}
			}
		}
	}
	\renewcommand{\theilustrations}{\@arabic\c@ilustrations}

	\define@key{tituloilustracion}{titulo}{\def\tituloilustracion@titulo{##1}}
	\define@key{tituloilustracion}{etiqueta}{\def\tituloilustracion@etiqueta{##1}}
	\define@key{tituloilustracion}{indice}{\def\tituloilustracion@indice{##1}}
	\define@key{tituloilustracion}{fuente}{\def\tituloilustracion@fuente{##1}}
	\define@key{tituloilustracion}{sinleyenda}[true]{\def\tituloilustracion@sinleyenda{##1}}
	\define@key{tituloilustracion}{sinindice}[true]{\def\tituloilustracion@sinindice{##1}}

	\newcommand{\tituloilustracion}{
		\ifthenelse{\isundefined{\tituloilustracion@sinindice}}{
			\refstepcounter{ilustrations}
			\ifthenelse{\isundefined{\tituloilustracion@etiqueta}}{}{\label{\tituloilustracion@etiqueta}}
			\ifthenelse{\isundefined{\tituloilustracion@indice}}{
				\ifthenelse{\isundefined{\tituloilustracion@titulo}}{
					\addcontentsline{loi}{ilustrations}{\protect{\theilustrations.} \@ilustrationname~\theilustrations}\par
				}{
					\addcontentsline{loi}{ilustrations}{\protect{\theilustrations.} \tituloilustracion@titulo}\par}
			}{
				\addcontentsline{loi}{ilustrations}{\protect{\theilustrations.} \tituloilustracion@indice}\par
			}
		}{}
		\ifthenelse{\isundefined{\tituloilustracion@sinleyenda}}{
			\ifthenelse{\isundefined{\tituloilustracion@titulo}}{
				\par\normalfont\footnotesize\noindent{{\bfseries \@ilustrationname\ifthenelse{\isundefined{\tituloilustracion@sinindice}}{~\theilustrations}{}.} \ifthenelse{\isundefined{\tituloilustracion@fuente}}{}{\\ {\bfseries Fuente:} \tituloilustracion@fuente.}}\\
			}{
				\par\normalfont\footnotesize\noindent{{\bfseries \@ilustrationname\ifthenelse{\isundefined{\tituloilustracion@sinindice}}{~\theilustrations}{}.} \tituloilustracion@titulo. \ifthenelse{\isundefined{\tituloilustracion@fuente}}{}{\\ {\bfseries Fuente:} \tituloilustracion@fuente.}}\\
			}
		}{}
	}

	% Índice de cuadros
	\newcommand{\listoftabulationsname}{{Índice de \@tabulationmnamepl}}
	\newlistof[part]{tabulations}{loq}{\listoftabulationsname}

	% Descripción: Crea el índice de cuadros.
	\renewcommand{\listoftabulations}{
		% Incluye el indice de cuadros solo si tiene contenido que mostrar. Como el mismo comando \@starttoc es el que genera el .loq y agrega el contenido al documento, esta fue la única forma que encontré.
		\IfFileExists{\jobname.loq}{
			\indexarpreliminar{\listoftabulationsname}
			\capitulosinnumeracion{{\listoftabulationsname}}
			\flushright{\textbf{PÁG.}}
			\@starttoc{loq}
		}{
			\AtEndDocument{
				\ifthenelse{\value{tabulations}>0}{\@starttoc{loq}}{}
			}
		}
	}
	\renewcommand{\thetabulations}{\@arabic\c@tabulations}

	\define@key{cuadro}{titulo}{\def\titulocuadro@titulo{##1}}
	\define@key{cuadro}{etiqueta}{\def\titulocuadro@etiqueta{##1}}
	\define@key{cuadro}{indice}{\def\titulocuadro@indice{##1}}
	\define@key{cuadro}{sinleyenda}[true]{\def\titulocuadro@sinleyenda{##1}}
	\define@key{cuadro}{sinindice}[true]{\def\titulocuadro@sinindice{##1}}

	\newcommand{\titulocuadro}{
		\ifthenelse{\isundefined{\titulocuadro@sinindice}}{
			\refstepcounter{tabulations}
			\ifthenelse{\isundefined{\titulocuadro@etiqueta}}{}{\label{\titulocuadro@etiqueta}}
			\ifthenelse{\isundefined{\titulocuadro@indice}}{
				\ifthenelse{\isundefined{\titulocuadro@titulo}}{
					\addcontentsline{loq}{tabulations}{\protect{\thetabulations.} \@tabulationmname~\thealgs}\par
				}{
					\addcontentsline{loq}{tabulations}{\protect{\thetabulations.} \titulocuadro@titulo}\par
				}
			}{
				\addcontentsline{loq}{tabulations}{\protect{\thetabulations.} \titulocuadro@indice}\par
			}
		}{}
		\ifthenelse{\isundefined{\titulocuadro@sinleyenda}}{
			\ifthenelse{\isundefined{\titulocuadro@titulo}}{
				\espaciodoble\normalfont\footnotesize\noindent{{\bfseries\@tabulationmname\ifthenelse{\isundefined{\titulocuadro@sinindice}}{~\thetabulations}{}.}\\}
			}{
				\espaciodoble\normalfont\footnotesize\noindent{{\bfseries\@tabulationmname\ifthenelse{\isundefined{\titulocuadro@sinindice}}{~\thetabulations}{}.} \titulocuadro@titulo.\\}
			}
		}{}
	}

	% Índice de Pendientes
	\newcommand{\listoftodosname}{{Índice de Pendientes}}
	\newlistof[part]{todos}{lod}{\listoftodosname}

	% Comando: listoftodos
	% Descripción: Crea el índice de pendientes.
	\renewcommand{\listoftodos}{
		{\color{red}
		\indexarpreliminar{ÍNDICE DE PENDIENTES}
		\capitulosinnumeracion{{Índice de Pendientes}}
		\flushright{\textbf{PÁG.}}
		\@starttoc{lod}}
	}
	\renewcommand{\thetodos}{\@arabic\c@todos}

	% Comando: pendiente
	% Descripción: Agrega una anotación al índice de pendientes y la muestra en el lugar donde fue agregada. Para mostrar los pendientes, ejecutar antes de \configurar \habilitarpendientes
	% Parámetros: [1] Texto del pendiente (e.g. Mejorar redacción)
	\newcommand{\pendiente}[1]{
		\ifthenelse{\equal{\@pendientes}{true}}{
			\refstepcounter{todos}
			% \begin{spacing}{0.75}
			\noindent{\color{red}\normalfont\scriptsize{\bfseries{\thetodos:} ##1}}
			% \end{spacing}
			\addcontentsline{lod}{todos}{\protect{\thetodos.} ##1}
		}{}
	}

	% Índice de Notas
	\newcommand{\listofnotesnames}{{Índice de Notas}}
	\newlistof[part]{notes}{lon}{\listofnotesnames}

	% Comando: listofnotes
	% Descripción: Crea el índice de notas.
	\renewcommand{\listofnotes}{
		{\color{blue}
		\indexarpreliminar{ÍNDICE DE NOTAS}
		\capitulosinnumeracion{{Índice de Notas}}
		\flushright{\textbf{PÁG.}}
		\@starttoc{lon}}
	}
	\renewcommand{\thenotes}{\@arabic\c@notes}

	% Comando: nota
	% Descripción: Agrega una nota al índice de notas y la muestra en el lugar donde fue agregada. Para mostrar las notas, ejecutar antes de \configurar \habilitarnotas
	% Parámetros: [1] Texto de la nota (e.g. \nota{Esto es una nota})
	\newcommand{\nota}[1]{
		\ifthenelse{\equal{\@notas}{true}}{
			\refstepcounter{notes}
			\noindent{\color{blue}\normalfont\scriptsize{\bfseries{\thenotes:} ##1}}
			\addcontentsline{lon}{notes}{\protect{\thenotes.} ##1}\par
		}{}
	}

	% Índice de Algoritmos
	\newcommand{\listofalgorithmsname}{{Índice de \@algorithmnamepl}}
	\newlistof[part]{algs}{lal}{\listofalgorithmsname}

	% Comando: listofalgorithms
	% Descripción: Crea el índice de algoritmos.
	\renewcommand{\listofalgorithms}{
		\IfFileExists{\jobname.lal}{
			\indexarpreliminar{\listofalgorithmsname}
			\capitulosinnumeracion{{\listofalgorithmsname}}
			\flushright{\bfseries PÁG.}
			\@starttoc{lal}
		}{
			\AtEndDocument{
				\ifthenelse{\value{algs}>0}{\@starttoc{lal}}{}
			}
		}
	}
	\renewcommand{\thealgs}{\@arabic\c@algs}

	\define@key{tituloalgoritmo}{titulo}{\def\tituloalgoritmo@titulo{##1}}
	\define@key{tituloalgoritmo}{etiqueta}{\def\tituloalgoritmo@etiqueta{##1}}
	\define@key{tituloalgoritmo}{indice}{\def\tituloalgoritmo@indice{##1}}
	\define@key{tituloalgoritmo}{fuente}{\def\tituloalgoritmo@fuente{##1}}
	\define@key{tituloalgoritmo}{sinleyenda}[true]{\def\tituloalgoritmo@sinleyenda{##1}}
	\define@key{tituloalgoritmo}{sinindice}[true]{\def\tituloalgoritmo@sinindice{##1}}

	\newcommand{\tituloalgoritmo}{
		\ifthenelse{\isundefined{\tituloalgoritmo@sinindice}}{
			\refstepcounter{algs}
			\ifthenelse{\isundefined{\tituloalgoritmo@etiqueta}}{}{\label{\tituloalgoritmo@etiqueta}}
			\ifthenelse{\isundefined{\tituloalgoritmo@indice}}{
				\ifthenelse{\isundefined{\tituloalgoritmo@titulo}}{
					\addcontentsline{lal}{algs}{\protect{\thealgs.} \@algorithmname~\thealgs}\par
				}{
					\addcontentsline{lal}{algs}{\protect{\thealgs.} \tituloalgoritmo@titulo}\par
				}
			}{
				\addcontentsline{lal}{algs}{\protect{\thealgs.} \tituloalgoritmo@indice}\par
			}
		}{}
		\ifthenelse{\isundefined{\tituloalgoritmo@sinleyenda}}{
			\ifthenelse{\isundefined{\tituloalgoritmo@titulo}}{
				\centering\par\normalfont\footnotesize\noindent{{\bfseries \@algorithmname\ifthenelse{\isundefined{\tituloalgoritmo@sinindice}}{~\thealgs}{}.} \ifthenelse{\isundefined{\tituloalgoritmo@fuente}}{}{\\ {\bfseries Fuente:} \tituloalgoritmo@fuente.}}\\
			}{
				\centering\par\normalfont\footnotesize\noindent{{\bfseries \@algorithmname\ifthenelse{\isundefined{\tituloalgoritmo@sinindice}}{~\thealgs}{}.} \tituloalgoritmo@titulo. \ifthenelse{\isundefined{\tituloalgoritmo@fuente}}{}{\\ {\bfseries Fuente:} \tituloalgoritmo@fuente.}}\\
			}
		}{}
	}

	\formatearindice
}

% Comando: formatearindice
% Descripción: Le da formato a los índices, fuentes, tamaños, identaciones, entre otras. Llamado desde \configurarindice.
\newcommand{\formatearindice}{

	% Índice general
	% Para las partes. Usado en Anexos para que los anexos salgan dentro de una carpeta en el outline
	\renewcommand{\cftpartfont}{\normalfont\normalsize}
	\renewcommand{\cftpartpagefont}{\normalfont\normalsize}
	\renewcommand{\cftpartleader}{\normalfont\normalsize\cftdotfill{\cftpartdotsep}}
	\renewcommand{\cftpartdotsep}{\cftdotsep}
	\renewcommand{\cftpartindent}{0cm}
	\setlength{\cftbeforepartskip}{0cm}

	% Para capítulos sin numeración se usará paragraph para que salgan en el índice correctamente
	% Principalmente hecho para las páginas preliminares
	\renewcommand{\cftparafont}{\normalfont\normalsize}
	\renewcommand{\cftparapagefont}{\normalfont\normalsize}
	\renewcommand{\cftparaleader}{\normalfont\normalsize\cftdotfill{\cftparadotsep}}
	\renewcommand{\cftparadotsep}{\cftdotsep}
	\renewcommand{\cftparaindent}{0cm}
	\setlength{\cftbeforeparaskip}{0cm}

	% Capítulos con numeración
	\renewcommand{\cftchapfont}{\normalfont\normalsize}
	\renewcommand{\cftchappagefont}{\normalfont\normalsize}
	\setlength{\cftbeforechapskip}{0cm}
	\setlength{\cftchapindent}{2\parindent}
	\setlength{\cftchapnumwidth}{2\parindent}
	\renewcommand{\cftchapleader}{\normalfont\normalsize\cftdotfill{\cftchapdotsep}}
	\renewcommand{\cftchapdotsep}{\cftdotsep}
	% Secciones
	\renewcommand{\cftsecfont}{\normalfont\normalsize}
	\setlength{\cftbeforesecskip}{0cm}
	\setlength{\cftsecindent}{5\parindent}

	% Subsecciones
	\renewcommand{\cftsubsecfont}{\normalfont\normalsize}
	\setlength{\cftbeforesubsecskip}{0cm}
	\setlength{\cftsubsecindent}{6\parindent}
	% Subsubsecciones
	\renewcommand{\cftsubsubsecfont}{\normalfont\normalsize}
	\setlength{\cftbeforesubsubsecskip}{0cm}
	\setlength{\cftsubsubsecindent}{7\parindent}

}

% Comando: hacerindicegeneral
% Descripción: Crea el índice general.
\newcommand{\hacerindicegeneral}{
	\tableofcontents
	\newpage
}

 %Comando: hacerindiceilustracions
% Descripción: Crea el índice de ilustraciones.
\newcommand{\hacerindiceilustraciones}{
	\listofilustrations
	\newpage
}

% Comando: hacerindicegraficos
% Descripción: Crea el índice de gráficos.
\newcommand{\hacerindicegraficos}{
	\listofcharts
	\newpage
}

% Comando: hacerindicecuadros
% Descripción: Crea el índice de cuadros
\newcommand{\hacerindicecuadros}{
	\listoftabulations
	\newpage
}

% Comando: hacerindicelistados
% Descripción: Crea el índice de listados.
\newcommand{\hacerindicelistados}{
	\lstlistoflistings
	\newpage
}

% Comando: hacerindicependientes
% Descripción: Crea el índice de pendientes.
\newcommand{\hacerindicependientes}{
	\listoftodos
	\newpage
}

% Comando: hacerindicenotas
% Descripción: Crea el índice de notas.
\newcommand{\hacerindicenotas}{
	\listofnotes
	\newpage
}

% Comando: hacerindicealgoritmos
% Descripción: Crea el índice de algoritmos.
\newcommand{\hacerindicealgoritmos}{
	\listofalgorithms
	\newpage
}

% Comando: hacerindices
% Descripción: Crea todos los índices en el orden adecuado. En caso de que los pendientes estén habilitados, mostrará el índice de pendientes también.
\newcommand{\hacerindices}{
	\hacerindicegeneral

	\hacerindiceilustraciones
	\hacerindicegraficos
	\hacerindicecuadros
	\hacerindicealgoritmos
	\hacerindicelistados

	\ifthenelse{\equal{\@pendientes}{true}}{
	\hacerindicependientes
	}{}
	\ifthenelse{\equal{\@notas}{true}}{
	\hacerindicenotas
	}{}
}

% Comando: indexarpreliminar
% Descripción: Agrega el preliminar al índice general. Se usa paragraph para evitar que se incluyan siguientes secciones en el outline.
% Parámetros: [1] Nombre a mostrar en el índice
\newcommand{\indexarpreliminar}[1]{
	\phantomsection % Recomendado antes de addcontentsline para evitar problemas con hyperref.
	\MakeUppercase{\gdef\noexpand\aux{#1}}
	\addcontentsline{toc}{paragraph}{\aux} %Única forma que encontré para expandir las mayúsculas y evitar el warning con el \uppercase al generarse el bookmark.
	%\addcontentsline{toc}{paragraph}{\uppercase{#1}} %También puede resolverse quitando el \uppercase y asegurandose de colocar manualmente en mayúscula todos los títulos en el documento.
}

% Comando: indexarintroduccion
% Descripción: Agrega la introducción al índice general y agrega la palabra capítulo al índice.
% Parámetros: [1] Nombre a mostrar en el índice
\newcommand{\indexarintroduccion}[1]{
	\indexarpreliminar{#1}
	\addtocontents{toc}
	{\protect\mbox{\normalfont\normalsize \bfseries CAPÍTULO}\protect\hfill\par}
}

% Comando: indexarparte
% Descripción: Agrega la parte al índice general. Caso Anexos.
% Parámetros: [1] Nombre a mostrar en el índice
\newcommand{\indexarparte}[1]{
	\phantomsection % Recomendado antes de addcontentsline para evitar problemas con hyperref.
	\MakeUppercase{\gdef\noexpand\aux{#1}}
	\addcontentsline{toc}{part}{\aux} %Única forma que encontré para expandir las mayúsculas y evitar el warning con el \uppercase al generarse el bookmark.
	%\addcontentsline{toc}{part}{\uppercase{#1}} %También puede resolverse quitando el \uppercase y asegurandose de colocar manualmente en mayúscula todos los títulos en el documento
}

% Comando: indexarcapitulo
% Descripción: Agrega el capítulo al índice general. No sé en qué caso, pero por si acaso.
% Parámetros: [1] Nombre a mostrar en el índice
\newcommand{\indexarcapitulo}[1]{
	\phantomsection % Recomendado antes de addcontentsline para evitar problemas con hyperref.
	\addcontentsline{toc}{chapter}{#1}
}

% Comando: indexarseccion
% Descripción: Agrega la sección al índice general.
% Parámetros: [1] Nombre a mostrar en el índice
\newcommand{\indexarseccion}[1]{
	%\phantomsection % Recomendado antes de addcontentsline para evitar problemas con hyperref.
	\addcontentsline{toc}{section}{#1}
}

% Comando: indexarsubseccion
% Descripción: Agrega la subsección al índice general.
% Parámetros: [1] Nombre a mostrar en el índice
\newcommand{\indexarsubseccion}[1]{
	%\phantomsection % Recomendado antes de addcontentsline para evitar problemas con hyperref.
	\addcontentsline{toc}{subsection}{#1}
}

% Comando: indexarsubsubseccion
% Descripción: Agrega la subsubsección al índice general.
% Parámetros: [1] Nombre a mostrar en el índice
\newcommand{\indexarsubsubseccion}[1]{
	%\phantomsection % Recomendado antes de addcontentsline para evitar problemas con hyperref.
	\addcontentsline{toc}{subsubsection}{#1}
}

% Comando: hacerglosario
% Descripción: Agrega la definición de términos básicos al trabajo.
\newcommand{\hacerglosario}{
	\continuarsubsubseccion
	\printglossary[title={Definición de Términos Básicos},toctitle={Definición de Términos Básicos}]
	\continuarsubsubseccion
}

% Título más apropiado cuando se incluyen acrónimos
\newcommand{\hacerglosarioconacronimos}{
	\continuarsubsubseccion
	\printglossary[title={Glosario de Acrónimos y Términos}, toctitle={Glosario de Acrónimos y Términos}]
	\continuarsubsubseccion
}

% Comando: hacercaratula
% Descripción: Crea la carátula de la tesis, la que va por fuera.
\newcommand{\hacercaratula}{
	\thispagestyle{empty}
		\begin{center}
			{\MakeUppercase{Universidad Centroccidental}}\\
			\textquotedblleft {\MakeUppercase{Lisandro Alvarado}}\textquotedblright\\
			\vfill
			\vfill
			{\textbf{\MakeUppercase{\@titulo}}}\\
			\vfill
			\begin{flushright}
				{\MakeUppercase{\@autor}}
			\end{flushright}
			\vfill
			{\@ciudad, \ifthenelse{\isundefined{\@mesencaratula}}{}{\@mespresentacion~de }\@anopresentacion.}
		\end{center}

	\newpage
}

% Comando: hacerpresentacion
% Descripción: Crea la hoja de presentación de la tesis.
\newcommand{\hacerpresentacion}{
	\thispagestyle{empty}
	\setcounter{page}{1}
	\begin{center}
		{\MakeUppercase{Universidad Centroccidental}}
		\textquotedblleft {\MakeUppercase{Lisandro Alvarado}}\textquotedblright\\
		\MakeUppercase{Decanato de \@decanato}\\
		\MakeUppercase{\@postgrado}
		\vfill
		{\textbf{\MakeUppercase{\@titulo}}}\\
		\vfill
		{\@trabajoname~presentado para optar al título de\\
		\@grado\\
    \@mencion}\\
		\vfill
		\begin{flushright}
			Por: \MakeUppercase{\@autor}
      \ifthenelse{\isundefined{\@tutorenpresentacion}}{}{\\\tutorname: \MakeUppercase{\@tutor}}
		\end{flushright}
		\vfill
		{\@ciudad, \ifthenelse{\isundefined{\@mesencaratula}}{}{\@mespresentacion~de }\@anopresentacion.}
	\end{center}
	\newpage
}

% Comando: haceraprobacion
% Descripción: Crea la hoja de aprobación
\newcommand{\haceraprobacion}{
	\thispagestyle{empty}
	\begin{center}
		\MakeUppercase{\textbf{\@titulo}}
		\vfill
		\begin{flushright}
			{Por: \MakeUppercase{\@autor}}
		\end{flushright}
		\vfill
		\textbf{Trabajo de grado aprobado}
		\vfill
		\begin{minipage}[t]{0.4\textwidth}
			\begin{flushleft}
				\begin{center}
					\makebox[2in]{\hrulefill}\hspace{.5in}
					\textbf{\@tutor}\\
					\textbf{\tutorname}
				\end{center}
			\end{flushleft}
		\end{minipage}
		\begin{minipage}[t]{0.4\textwidth}
			\begin{flushright}
				\begin{center}
					\makebox[2in]{\hrulefill}\hspace{.5in}
					\textbf{\@primerjurado}\\
				\end{center}
			\end{flushright}
		\end{minipage}
		\vfill
		\begin{minipage}[t]{0.4\textwidth}
			\begin{center}
				\makebox[2in]{\hrulefill}\hspace{.5in}
				\textbf{\@segundojurado}\\
			\end{center}
		\end{minipage}
		\vfill
		{\@ciudad, \@diapresentacion~ de \@mespresentacion~ de \@anopresentacion.}
	\end{center}
	\newpage
}

% Comando: hacerresumen
% Descripción: Crea el resumen de la tesis.
\newcommand{\hacerresumen}{
	\begin{center}
		\indexarpreliminar{Resumen}
		\MakeUppercase{Universidad Centroccidental}
		\textquotedblleft \MakeUppercase{Lisandro Alvarado}\textquotedblright\\
		\MakeUppercase{Decanato de \@decanato}\\
		\MakeUppercase{\@postgrado}\\
		\espaciotriple
		\MakeUppercase{\textbf{\@titulo}}\\
  	\espaciotriple
  	\raggedleft{
      \textbf{\autorname:} \@autor\\
      \textbf{\tutorname:} \@tutor\\
         \ifthenelse{\isundefined{\@fechaenresumen}}{}{
              \textbf{Fecha:} \@mespresentacion~de \@anopresentacion\\
          }
  	}
  	\espaciotriple
  	\centering{{\textbf{\MakeUppercase{Resumen}}}}\\
  	\espaciotriple
  	\begin{singlespace}
  	\justifying{\@resumen}
  	\end{singlespace}
  	\noindent\justifying{\textbf{Palabras Clave:} \@palabrasclave.}
  	\end{center}
  	\newpage
}

% Comando: heceraceptaciontutor
% Descripción: crea carta de aceptación de tutoría
\newcommand{\haceraceptaciontutor}{
	\begin{center}
		\indexarpreliminar{Aceptación de Tutoría}
		\MakeUppercase{Universidad Centroccidental}
		\textquotedblleft \MakeUppercase{Lisandro Alvarado}\textquotedblright\\
		\MakeUppercase{Decanato de \@decanato}\\
		\MakeUppercase{\@postgrado}\\
  	\espaciotriple
    \espaciotriple
  	\centering{{\textbf{\MakeUppercase{Aceptación  de Tutoría}}}}\\
    \espaciotriple
    \begin{flushright}
      {\@ciudad, \@mespresentacion~ de \@anopresentacion.}
    \end{flushright}
    \espaciodoble
  \end{center}

  \justifying{
  Quien suscribe, \@tutor, C.I. \@citutor, hago constar que he aceptado la tutoría del
  trabajo de grado titulado \MakeUppercase{\@titulo}, presentado por
  \@autor, C.I. \@ciautor, para optar al título de \@grado, \@mencion.
  }

  \begin{center}
    \espaciotriple
    \begin{minipage}[t]{0.6\textwidth}
			\begin{flushleft}
				\begin{center}
					\makebox[2.5in]{\hrulefill}\hspace{.6in}\\
					\textbf{\@tutor}\\
					\textbf{C.I. \@citutor}
				\end{center}
			\end{flushleft}
		\end{minipage}
  \end{center}
  \newpage
}

% Comando: hacerabstact
% Descripción: Crea el abstract de la tesis.
\newcommand{\hacerabstract}{
	\selectlanguage{english}
	\begin{center}
		\indexarpreliminar{Abstract}
		\MakeUppercase{Universidad Centroccidental}
		\textquotedblleft \MakeUppercase{Lisandro Alvarado}\textquotedblright\\
		\MakeUppercase{Decanato de \@decanato}\\
		\MakeUppercase{\@postgrado}\\
		\espaciotriple
		\MakeUppercase{\textbf{\@title}}\\
	\espaciotriple
	\raggedleft{
		\textbf{Author:} \@autor\\
		\textbf{Supervisor:} \@tutor\\
        \ifthenelse{\isundefined{\@fechaenresumen}}{}{
                \textbf{Date:} \@monthpresentacion, \@anopresentacion\\
        }
	}
	\espaciotriple
	\centering{\MakeUppercase{\textbf{Abstract}}}
	\espaciotriple
	\begin{singlespace}
	\justifying{\@abstract}
	\end{singlespace}
	\noindent\justifying{\textbf{Keywords:} \@keywords.}
	\end{center}
	\selectlanguage{spanish}
	\newpage
}

% Comando: haceranexos
% Descripción: Prepara el documento para agregar anexos.
\newcommand{\haceranexos}{
	\appendix
	%Para hacer que aparezca la palabra ANEXOS en el centro de la página
	\def\@makeschapterhead##1{ %Para los capítulos no numerados
		\indexarparte{Anexos} % línea movida por mal número de página.
		\
		\vfill
		\centering{\normalfont \normalsize \bfseries \MakeUppercase{##1}}\\
		\vfill
		\
		\justifying
		}
	\capitulosinnumeracion{Anexos}

	\renewcommand{\@chapapp}{Anexo}
	\def\@makechapterhead##1{ %Para los capítulos numerados
		\centering{\normalfont \normalsize \bfseries \MakeUppercase{\@chapapp} \thechapter}
		\\
		\espaciotriple
		\centering{\normalfont \normalsize (##1)}
		\\
		\espaciotriple
		\justifying
		}
}

% Comando: hacerbibliografia
% Descripción: Crea la bibliografía y la agrega al índice general.
% Parámetros: [1] Nombre del archivo .bib que contiene los registros bibliográficos.
\newcommand{\hacerbibliografia}{
	\begin{spacing}{1.0} % Manual de la UCLA. No se si el espacio se debe aplicar aquí o en el .bst
	\indexarparte{Referencias Bibliográficas} % Movida esta línea a acá para que el bookmark se genere antes del titulo.
	%Si existen ítems bibtex de tipo @misc, es necesario borrar el comando \url de la propiedad URL. Causa problemas.
	\renewcommand\bibsection{\capitulosinnumeracion{Referencias Bibliográficas}}
	\bibliographystyle{uclamsc}
	\bibliography{\@bibliografia}
	\end{spacing}
}

% Comando: preliminar
% Descripción: Crea una página preliminar.
% Parámetros: [1] Nombre del preliminar
% Uso:
% \preliminar{Agradecimientos}
\newcommand{\preliminar}[1]{
	\setlength{\leftskip}{0cm}
	\indexarpreliminar{#1}
	\capitulosinnumeracion{#1}
	\setlength{\leftskip}{0cm}
}

% Comando: introduccion
% Descripción: Crea la introducción. No recibe parámetros, se distingue por la forma en que se indexa la introducción
% Uso:
% \introduccion
% Desde los años 500 AC, la comunidad bla bla bla bla bla bla bla bla bla bla bla bla .
\newcommand{\introduccion}{
	%\setlength{\leftskip}{0cm}
	\indexarintroduccion{Introducción}
	\capitulosinnumeracion{Introducción}
	%\setlength{\leftskip}{0cm}
}

% Comando: capitulo
% Descripción: Crea un capitulo.
% Uso:
% \capitulo{El Problema}
\newcommand{\capitulo}[1]{
	\setlength{\leftskip}{0cm}
	\uppercase{\chapter{#1}} % Invertido el orden para evitar el warning con el uppercase al generarse el bookmark. No sé cómo de todas maneras se genera en mayúsculas.
	\continuarcapitulo
}

% Comando: capitulosinnumeracion
% Descripción: Crea un capitulo sin numeración.
% Uso:
% \capitulo*{Anexos}
\newcommand{\capitulosinnumeracion}[1]{
	\setlength{\leftskip}{0cm}
	\uppercase{\chapter*{#1}} % Invertido el orden para evitar el warning con el uppercase al generarse el bookmark. No sé cómo de todas maneras se genera en mayúsculas.
	\continuarcapitulo
}

% Comando: continuarcapitulo
% Descripción: Este comando disminuye la identación del margen para continuar el capítulo.
% Uso:
% \capitulo{El problema}
% Se habla del problema, se divide en secciones, pero al final, se retorna para cerrar la idea del capítulo. El margen vuelve al comienzo.
% \continuarcapitulo
% Seguir hablando del capítulo...
\newcommand{\continuarcapitulo}{
	\setlength{\leftskip}{0cm}
}

% Comando: seccion
% Descripción: Crea una sección.
% Uso:
% \seccion{Inteligencia Artificial}
\newcommand{\seccion}[1]{
	\setlength{\leftskip}{0cm}
	\phantomsection % Movida esta línea a acá para que el bookmark se genere antes del titulo sin errar el número de la página cuando la sección está al inicio de una página.
	\ifthenelse{\isundefined{\@numerarsecciones}}{
		\section*{#1}
		\indexarseccion{#1}
	}{
		\section{#1}
	}
	\continuarseccion
}

% Comando: continuarseccion
% Descripción: Este comando disminuye la identación del margen para continuar el sección.
% Uso:
% \seccion{Computación Evolutiva}
% Se habla de la CE, se divide en subsecciones, pero al final, se retorna para cerrar la idea de la seccion.
% \continuarseccion
% Seguir hablando de Computación Evolutiva...
\newcommand{\continuarseccion}{
	\setlength{\leftskip}{0cm}
}

% Comando: subseccion
% Descripción: Crea una subsección.
% Uso:
% \subseccion{Computación Natural}
\newcommand{\subseccion}[1]{
	\setlength{\leftskip}{0cm}
	\phantomsection % Movida esta línea a acá para que el bookmark se genere antes del titulo sin errar el número de la página cuando la sección está al inicio de una página.
	\ifthenelse{\isundefined{\@numerarsecciones}}{
		\subsection*{#1}
		\indexarsubseccion{#1}
	}{
		\subsection{#1}
	}
	\continuarsubseccion
}

% Comando: continuarsubseccion
% Descripción: Este comando disminuye la identación del margen para continuar la subsección.
% Uso:
% \subseccion{Algoritmos Genéticos}
% Se habla de los AG, se divide en subsubsecciones, pero al final, se retorna para cerrar la idea de la subseccion.
% \continuarsubseccion
% Seguir hablando de Algoritmos Genéticos...
\newcommand{\continuarsubseccion}{
	\setlength{\leftskip}{0cm} % Como se indicó dentro de \configurarestructura. Aunque creo que estos \continuar... ya no serían necesarios.
}

% Comando: subsubseccion
% Descripción: Crea una subsubsección.
% Uso:
% \subsubseccion{Particle Swarm Optimization}
\newcommand{\subsubseccion}[1]{
	\setlength{\leftskip}{0cm}
	\phantomsection % Movida esta línea a acá para que el bookmark se genere antes del titulo sin errar el número de la página cuando la sección está al inicio de una página.
	\ifthenelse{\isundefined{\@numerarsecciones}}{
		\subsubsection*{#1}
		\indexarsubsubseccion{#1}
	}{
		\subsubsection{#1}
	}
	\continuarsubsubseccion
}

% Comando: continuarsubsubseccion
% Descripción: Este comando disminuye la identación del margen para continuar el subsubseccion. Quizás no se utilice, pero ahí está por si acaso.
% Uso:
% \subsubseccion{Algoritmos Genéticos Multi-Objetivos}
% Se habla de los MOGA, no creo que se pueda dividir más porque no hay subsubsubsecciones. Quizás en un futuro.
% \continuarsubsubseccion
% Seguir hablando de MOGAs...
\newcommand{\continuarsubsubseccion}{
	\setlength{\leftskip}{\parindent} % Según el manual de la UPEL, después del subtitulo del 3er nivel se debe continuar el texto en la misma línea. Lo dejaré así por el bien de la compatibilidad con otros trabajos usando esta plantilla. Solamente reduje las sagrías a como anteriormente se encontraría el 2do nivel.
}

% Comando: anexo
% Descripción: Prepara el documento para un anexo/
% Parámetros: [1] Título del anexo.
% Uso:
% \anexo{Curriculum Vitae}
\newcommand{\anexo}[1]{
	\chapter{#1}
}

%%%%%%%%%%%%%%%%%%%%%%%%% FIN INTERNO %%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% INICIO OTROS %%%%%

% Mejorada la traduccion del paquete algorithm2e
\ifthenelse{\boolean{algocf@optonelanguage}\AND\equal{\algocf@languagechoosen}{spanish}}{
\SetKwInput{KwIn}{Entrada}
\SetKwInput{KwOut}{Salida}
\SetKwInput{KwData}{Datos}
\SetKwInput{KwResult}{Resultado}
\SetKw{KwTo}{a}
\SetKw{KwRet}{devolver}
\SetKw{Return}{devolver}
\SetKwBlock{Begin}{inicio}{fin}
\SetKwRepeat{Repeat}{repetir}{hasta que}
\SetKwIF{If}{ElseIf}{Else}{si}{entonces}{sin\'o, si}{sino}{fin si}
\SetKwSwitch{Switch}{Case}{Other}{seleccionar}{hacer}{caso}{sin\'o}{fin caso}{fin seleccionar}
\SetKwFor{For}{para}{hacer}{fin para}
\SetKwFor{ForPar}{par}{hacer en paralelo}{fin para}
\SetKwFor{ForEach}{para cada}{hacer}{fin para cada}
\SetKwFor{ForAll}{para todo}{hacer}{fin para todo}
\SetKwFor{While}{mientras}{hacer}{fin mientras}
}{}

%%%%% FIN OTROS %%%%%

%%%%% INICIAR CONFIGURACION %%%%%

\AtBeginDocument{\listfiles\makeglossaries\configurar}

%%%%% FIN CONFIGURACION %%%%%
