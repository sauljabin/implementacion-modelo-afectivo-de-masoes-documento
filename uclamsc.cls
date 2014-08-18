% Universidad Centroccidental Lisandro Alvarado
% Trabajo de Grado
% Actualizado por Saúl Piña <sauljabin@gmail.com>, página del proyecto https://bitbucket.org/sauljabin/plantilla-latex-trabajo-de-grado-ucla/
% Versión anterior (2.0) por Miguel León <melf.ever.after@gmail.com>, página del proyecto https://code.google.com/p/uclamsc/
% Versión anterior (1.1) por Juan Rada Vilela <jcrada@gmail.com> y Rubén Parma <parmaia@gmail.com>, página del proyecto https://code.google.com/p/latex-uclamsc/
% Licencia GNU General Public License. 

\NeedsTeXFormat{LaTeX2e}
\newcommand{\uclamscversion}{3.0}
\newcommand{\uclamscdate}{2014/08/17}
\ProvidesClass{uclamsc}[\uclamscdate, \uclamscversion]
\typeout{Reportar dudas y errores a <sauljabin@gmail.com>.}

\newif\if@doblecara\@doblecarafalse
\DeclareOption{doblecara}{
  \@doblecaratrue
}

\ProcessOptions\relax

\if@doblecara %Para los márgenes
  \LoadClass[12pt,letterpaper,final,openany,twoside]{book}
  \raggedbottom % Elimina warnings de vbox, causados por el requerimiendo de alineación \flushbottom de las páginas a doble cara.
\else
  \LoadClass[12pt,letterpaper,final,oneside]{book}
\fi

\RequirePackage[english,spanish,es-lcroman]{babel} %english para el abstract, es-lcroman para números romanos en minúsculas en páginas preliminares
\RequirePackage[top=3cm,bottom=3cm,left=3cm,right=3cm,bindingoffset=1cm]{geometry}
\RequirePackage[utf8]{inputenc} %El encoding por defecto es utf8, aunque en Windows podría traer problemas (e.g. no mostrar caracteres acentuados)
\RequirePackage{lmodern} % Mejora la codificación de {fontenc}, [LY1] arroja warings
\RequirePackage[T1]{fontenc} %Para evitar advertencia al compilar
\RequirePackage[onehalfspacing]{setspace} %Para el espaciado del documento
\RequirePackage[colorlinks=false]{hyperref} %Para hipervínculos en el documento (ver \iniciar)
\RequirePackage{url} %Para dar formato a direcciones web.
\RequirePackage{ragged2e} %Para justificar texto (\justifying)
\RequirePackage{paralist} %Para enumeraciones dentro de párrafos
\RequirePackage{enumitem} %Para enumeraciones
\RequirePackage{color} %Para poner color en notas y pendientes
\RequirePackage{fancyhdr} %Para poner numeración de páginas en la parte baja
\RequirePackage{tocloft} %Para configurar índice general, de figuras y cuadros
\RequirePackage{graphicx} %Para insertar imágenes
\RequirePackage{float} %Para el ambiente de las imágenes
\RequirePackage{ctable} %Para los cuadros, particularmente las líneas (\toprule, \midrule, \bottomrule)
\RequirePackage{natbib} %Para la bibliografía
\RequirePackage{calc} %Para poder realizar operaciones con las variables
\RequirePackage{ifthen} %Para condiciones, usado en pendientes
\RequirePackage[toc,section=section]{glossaries} %Para la definición de términos básicos
\RequirePackage{listings} % Para formatear código fuente o algoritmos
\RequirePackage[spanish,onelanguage]{algorithm2e} % [boxed,spanish,onelanguage] % Para escribir algoritmos en pseudo-codigo
\RequirePackage{usebib} % Para el comando citetitle
\RequirePackage{keyval} % Para las opciones de los amientes

%Comando: pendientes
%Descripción: Llamado en \configurar para listar los pendientes de uclamsc.cls
\newcommand{\pendientes}{}

\newcommand{\variablefaltante}[1]{{\tt \bfseries DEFINIR \textbackslash {#1}\{\} }}

\def\@titulo{\variablefaltante{titulo}} % Título del trabajo de grado
\newcommand{\titulo}[1]{\def\@titulo{#1}}
\def\@grado{\variablefaltante{grado}} % Grado a optar
\newcommand{\grado}[1]{\def\@grado{#1}}
\def\@autor{\variablefaltante{autor}} % Nombre del autor.
\newcommand{\autor}[1]{\def\@autor{#1}}
\def\@decanato{\variablefaltante{decanato}} % Nombre del Decanato. (e.g. Ciencias y Tecnología)
\newcommand{\decanato}[1]{\def\@decanato{#1}}
\def\@postgrado{\variablefaltante{postgrado}} % Nombre del Postgrado. (e.g. Ciencias de la Computación)
\newcommand{\postgrado}[1]{\def\@postgrado{#1}}
\def\@ciudad{\variablefaltante{ciudad}} % Ciudad. (e.g. Barquisimeto)
\newcommand{\ciudad}[1]{\def\@ciudad{#1}}

\def\@diadefensa{\variablefaltante{diadefensa}} % Día de la defensa. (e.g. 20)
\newcommand{\diadefensa}[1]{\def\@diadefensa{#1}}
\def\@mesdefensa{\variablefaltante{mesdefensa}} % Mes de la defensa (e.g. Marzo)
\newcommand{\mesdefensa}[1]{\def\@mesdefensa{#1}}
\newcommand{\mesencaratula}{\def\@mesencaratula{}} % Incluir mes en la carátula
\def\@annodefensa{\variablefaltante{annodefensa}} % Año de la defensa (e.g. 2009)
\newcommand{\annodefensa}[1]{\def\@annodefensa{#1}}

\def\@tutor{\variablefaltante{tutor}}	% Nombre del tutor
\newcommand{\tutor}[1]{\def\@tutor{#1}}
\def\@primerjurado{\variablefaltante{primerjurado}} % Nombre del primer jurado
\newcommand{\primerjurado}[1]{\def\@primerjurado{#1}}
\def\@segundojurado{\variablefaltante{segundojurado}} % Nombre del segundo jurado
\newcommand{\segundojurado}[1]{\def\@segundojurado{#1}}

\newcommand{\fechaenresumen}{\def\@fechaenresumen{}} % Incluir fecha en el resumen
\def\@resumen{\variablefaltante{resumen}} % Resumen del trabajo
\newcommand{\resumen}[1]{\def\@resumen{#1}}
\def\@palabrasclave{\variablefaltante{palabrasclave}} % Palabras clave separadas por coma. (e.g. IA, PSO, etc.)
\newcommand{\palabrasclave}[1]{\def\@palabrasclave{#1}}

\title{\variablefaltante{title}} % Título del trabajo en inglés
\def\@monthdefensa{\variablefaltante{monthdefensa}}
\newcommand{\monthdefensa}[1]{\def\@monthdefensa{#1}} % Mes en inglés para el abstract.
\def\@abstract{\variablefaltante{abstract}}
\newcommand{\abstract}[1]{\def\@abstract{#1}} % Resumen del trabajo en inglés
\def\@keywords{\variablefaltante{keywords}}
\newcommand{\keywords}[1]{\def\@keywords{#1}} % Palabras clave del trabajo en inglés.

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

\AtBeginDocument{\listfiles\makeglossaries\configurar}

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
% \begin{viñetas}
% 	\item foo
% 	\item bar
% 	\item foobar
% \end{viñetas}
\newenvironment{viñetas}
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
%
\newenvironment{contenido}{}{}

% Ambiente: anexos
% Descripción: Determina el comienzo de los anexos. Por los momentos hace nada, pero en el futuro quizás tenga función.
% Uso: 
% \begin{anexos}
% 	\include{chapters/anexo-1}
% 	\include{chapters/anexo-2}
% \end{anexos}
%
\newenvironment{anexos}{\haceranexos}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
%
\newenvironment{ilustracion}[1][]{
	\begin{figure}[htcb] 
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
%
\newenvironment{grafico}[1][]{
	\begin{figure}[htcb]
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
	\begin{algorithm}[htcb]
	\espaciodoble
	\setkeys{tituloalgoritmo}{#1}
	\footnotesize	
}{	
	\tituloalgoritmo
	\end{algorithm}
	\espaciodoble
}

%Comando: fuentecuadro
%Descripción: Agrega la fuente del cuadro
%Parámetros: [1] Numero de columnas del cuadro, [2] Fuente
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
%
\newenvironment{cuadro}[2][]
{
	\begin{table}[htb]
	\centering
	\espaciodoble
	\setkeys{titulocuadro}{#1}
	\titulocuadro
	\footnotesize
	\begin{spacing}{1.3}
	\begin{tabular}{#2}
}
{
	\end{tabular}
	\end{spacing}
	\end{table}
}

% Ambiente: citatextual
% Descripción: Prepara el contexto para una cita textual de más de 40 palabras.
% Párrafos subsiguientes al primero, tienen sangría adicional según el manual de la UPEL.
% Uso: 
% \begin{citatextual}
%...Esto es una cita textual... (40 palabras)...
% \end{citatextual}
%
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
%
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
%
\newenvironment{ecuaciones}
	{	
		\espaciosimple
		\begin{eqnarray}
	}
	{\end{eqnarray}}
	
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
	\renewcommand{\headrulewidth}{0pt} %Para no mostrar una línea en el encabezado
	\renewcommand{\footrulewidth}{0pt} %Para no mostrar una línea en el pie de página
	\setlength{\headheight}{14.5pt} % Para evitar advertencia al compilar :P
	\renewcommand{\theequation}{\@arabic\c@equation} % Para la numeración de ecuaciones.
	\setlength{\JustifyingParindent}{1.7em} %Sacado con regla tomando medidas del manual de trabajo de grado
	\hypersetup{
		pdftitle = {\@titulo},
		pdfauthor = {\@autor},
		pdfkeywords = {\@palabrasclave},
		pdfsubject={\@postgrado},
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
		
	\renewcommand{\thechapter}{\Roman{chapter}} %Definir capítulos con números romanos
	\renewcommand{\chaptermark}[1]{\markboth{}{}} %Eliminar encabezados de páginas
	
	%Formato de secciones, subsecciones y subsubsecciones. (28pt es triple espaciado para fuentes de 12pt) 
	%(23pt es la medida conseguida comparando resultados con documento original de reglas)
	% Fomatos según manual de la UPEL.
	\renewcommand{\section}{\@startsection{section}{1}{\z@}{22pt}{22pt}{\centering\normalfont\normalsize\bfseries}}
	\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}{22pt}{22pt}{\normalfont\normalsize\bfseries\itshape}}
	\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\parindent}{22pt}{22pt}{\normalfont\normalsize\bfseries\itshape}} 
	
	% Configuración del glosario.
	\glossarystyle{list}
	
	\renewcommand*{\glossarysection}[2][\@gls@title]{
		\def\@gls@title{##2}% 
		\seccion{##1}
		\@mkboth{}{}% 
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

	%%%%%%%%%%%%%%%%%%%%%%%%%%
	% Índice de listados (algoritmos y códigos)
	\renewcommand{\lstlistlistingname}{{Índice de Listados}}

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

	\renewcommand{\lstlistingname}{Listado}
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
					\addcontentsline{lol}{lstlisting}{\hspace{-1.5em}\protect{\thelstlisting.} \lstlistingname~\thelstlisting}
				}{
					\addcontentsline{lol}{lstlisting}{\hspace{-1.5em}\protect{\thelstlisting.} \titulolistado@titulo}}
			}{
				\addcontentsline{lol}{lstlisting}{\hspace{-1.5em}\protect{\thelstlisting.} \titulolistado@indice}
			}
		}{}
		\ifthenelse{\isundefined{\titulolistado@sinleyenda}}{
			\ifthenelse{\isundefined{\titulolistado@titulo}}{
				\par\centering\normalfont\normalsize\noindent{{\bfseries \lstlistingname\ifthenelse{\isundefined{\titulolistado@sinindice}}{~\thelstlisting}{}} \ifthenelse{\isundefined{\titulolistado@fuente}}{}{\\ {\bfseries Fuente:} \titulolistado@fuente}}\\
			}{
				\par\centering\normalfont\normalsize\noindent{{\bfseries \lstlistingname\ifthenelse{\isundefined{\titulolistado@sinindice}}{~\thelstlisting}{}:} \titulolistado@titulo \ifthenelse{\isundefined{\titulolistado@fuente}}{}{\\ {\bfseries Fuente:} \titulolistado@fuente}}\\
			}
		}{}
	}

	%	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% Índice de gráficos
	\newcommand{\listofchartsname}{{Índice de Gráficos}} 
	\newlistof[part]{charts}{loc}{\listofchartsname} 

	%Comando: listofcharts
	%Descripción: Crea el índice de gráficos.
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
	\newcommand{\chartname}{Gráfico}
	
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
					\addcontentsline{loc}{charts}{\protect{\thecharts.} \chartname~\thecharts}\par
				}{
					\addcontentsline{loc}{charts}{\protect{\thecharts.} \titulografico@titulo}\par
				}
			}{
				\addcontentsline{loc}{charts}{\protect{\thecharts.} \titulografico@indice}\par
			}
		}{}
		\ifthenelse{\isundefined{\titulografico@sinleyenda}}{
			\ifthenelse{\isundefined{\titulografico@titulo}}{
				\par\normalfont\normalsize\noindent{{\bfseries \chartname\ifthenelse{\isundefined{\titulografico@sinindice}}{~\thecharts}{}} \ifthenelse{\isundefined{\titulografico@fuente}}{}{\\ {\bfseries Fuente:} \titulografico@fuente}}\\
			}{
				\par\normalfont\normalsize\noindent{{\bfseries \chartname\ifthenelse{\isundefined{\titulografico@sinindice}}{~\thecharts}{}:} \titulografico@titulo \ifthenelse{\isundefined{\titulografico@fuente}}{}{\\ {\bfseries Fuente:} \titulografico@fuente}}\\
			}
		}{}
	}
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	%Índice de Ilustraciones
	\newcommand{\listofilustrationsname}{{Índice de Ilustraciones}} 
	\newlistof[part]{ilustrations}{loi}{\listofilustrationsname} 
%
%	%Comando: listofilustrations
%	%Descripción: Crea el índice de ilustraciones.
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
	\newcommand{\ilustrationname}{Ilustración}
	
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
					\addcontentsline{loi}{ilustrations}{\protect{\theilustrations.} \ilustrationname~\theilustrations}\par
				}{
					\addcontentsline{loi}{ilustrations}{\protect{\theilustrations.} \tituloilustracion@titulo}\par}
			}{
				\addcontentsline{loi}{ilustrations}{\protect{\theilustrations.} \tituloilustracion@indice}\par
			}
		}{}
		\ifthenelse{\isundefined{\tituloilustracion@sinleyenda}}{
			\ifthenelse{\isundefined{\tituloilustracion@titulo}}{
				\par\normalfont\normalsize\noindent{{\bfseries \ilustrationname\ifthenelse{\isundefined{\tituloilustracion@sinindice}}{~\theilustrations}{}} \ifthenelse{\isundefined{\tituloilustracion@fuente}}{}{\\ {\bfseries Fuente:} \tituloilustracion@fuente}}\\
			}{
				\par\normalfont\normalsize\noindent{{\bfseries \ilustrationname\ifthenelse{\isundefined{\tituloilustracion@sinindice}}{~\theilustrations}{}:} \tituloilustracion@titulo \ifthenelse{\isundefined{\tituloilustracion@fuente}}{}{\\ {\bfseries Fuente:} \tituloilustracion@fuente}}\\
			}
		}{}
	}

%	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% Índice de cuadros		
	\newcommand{\listoftabulationsname}{{Índice de Cuadros}} 
	\newlistof[part]{tabulations}{loq}{\listoftabulationsname} 

	%Descripción: Crea el índice de cuadros.
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
	\newcommand{\tabulationmname}{Cuadro}
	
	\define@key{titulocuadro}{titulo}{\def\titulocuadro@titulo{##1}}
	\define@key{titulocuadro}{etiqueta}{\def\titulocuadro@etiqueta{##1}}
	\define@key{titulocuadro}{indice}{\def\titulocuadro@indice{##1}}
	\define@key{titulocuadro}{sinleyenda}[true]{\def\titulocuadro@sinleyenda{##1}}
	\define@key{titulocuadro}{sinindice}[true]{\def\titulocuadro@sinindice{##1}}
	
	\newcommand{\titulocuadro}{
		\ifthenelse{\isundefined{\titulocuadro@sinindice}}{
			\refstepcounter{tabulations}
			\ifthenelse{\isundefined{\titulocuadro@etiqueta}}{}{\label{\titulocuadro@etiqueta}}
			\ifthenelse{\isundefined{\titulocuadro@indice}}{
				\ifthenelse{\isundefined{\titulocuadro@titulo}}{
					\addcontentsline{loq}{tabulations}{\protect{\thetabulations.} \tabulationmname~\thealgs}\par
				}{
					\addcontentsline{loq}{tabulations}{\protect{\thetabulations.} \titulocuadro@titulo}\par
				}
			}{
				\addcontentsline{loq}{tabulations}{\protect{\thetabulations.} \titulocuadro@indice}\par
			}
		}{}
		\ifthenelse{\isundefined{\titulocuadro@sinleyenda}}{
			\ifthenelse{\isundefined{\titulocuadro@titulo}}{
				\espaciodoble\normalfont\normalsize\noindent{\bfseries{\tabulationmname\ifthenelse{\isundefined{\titulocuadro@sinindice}}{~\thetabulations}{}}\\\espaciodoble}
			}{
				\espaciodoble\normalfont\normalsize\noindent{\bfseries{\tabulationmname\ifthenelse{\isundefined{\titulocuadro@sinindice}}{~\thetabulations}{}}\\\espaciodoble \titulocuadro@titulo\\\espaciodoble}
			}
		}{}
	}
	
%	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%Índice de Pendientes
	\newcommand{\listoftodosname}{{Índice de Pendientes}} 
	\newlistof[part]{todos}{lod}{\listoftodosname}

	%Comando: listoftodos
	%Descripción: Crea el índice de pendientes.
	\renewcommand{\listoftodos}{
		{\color{red}
		\indexarpreliminar{ÍNDICE DE PENDIENTES}
		\capitulosinnumeracion{{Índice de Pendientes}}
		\flushright{\textbf{PÁG.}}
		\@starttoc{lod}}
	}
	\renewcommand{\thetodos}{\@arabic\c@todos}
	
	%Comando: pendiente
	%Descripción: Agrega una anotación al índice de pendientes y la muestra en el lugar donde fue agregada. Para mostrar los pendientes, ejecutar antes de \configurar \habilitarpendientes
	%Parámetros: [1] Texto del pendiente (e.g. Mejorar redacción)
	\newcommand{\pendiente}[1]{
		\ifthenelse{\equal{\@pendientes}{true}}{
			\refstepcounter{todos}
			% \begin{spacing}{0.75}
			\noindent{\color{red}\normalfont\scriptsize{\bfseries{\thetodos:} ##1}}
			% \end{spacing}
			\addcontentsline{lod}{todos}{\protect{\thetodos.} ##1}
		}{}
	}

%	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%Índice de Notas
	\newcommand{\listofnotesnames}{{Índice de Notas}} 
	\newlistof[part]{notes}{lon}{\listofnotesnames} 

	%Comando: listofnotes
	%Descripción: Crea el índice de notas.
	\renewcommand{\listofnotes}{
		{\color{blue}
		\indexarpreliminar{ÍNDICE DE NOTAS}
		\capitulosinnumeracion{{Índice de Notas}}
		\flushright{\textbf{PÁG.}}
		\@starttoc{lon}}
	}
	\renewcommand{\thenotes}{\@arabic\c@notes}
	%Comando: nota
	%Descripción: Agrega una nota al índice de notas y la muestra en el lugar donde fue agregada. Para mostrar las notas, ejecutar antes de \configurar \habilitarnotas
	%Parámetros: [1] Texto de la nota (e.g. \nota{Esto es una nota})
	\newcommand{\nota}[1]{
		\ifthenelse{\equal{\@notas}{true}}{
			\refstepcounter{notes} 
			\noindent{\color{blue}\normalfont\scriptsize{\bfseries{\thenotes:} ##1}}
			\addcontentsline{lon}{notes}{\protect{\thenotes.} ##1}\par
		}{}
	}
	
	
%	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%Índice de Algoritmos
	\newcommand{\listofalgorithmsname}{{Índice de Algoritmos}} 
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
	\newcommand{\algorithmname}{Algoritmo}
	
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
					\addcontentsline{lal}{algs}{\protect{\thealgs.} \algorithmname~\thealgs}\par
				}{
					\addcontentsline{lal}{algs}{\protect{\thealgs.} \tituloalgoritmo@titulo}\par
				}
			}{
				\addcontentsline{lal}{algs}{\protect{\thealgs.} \tituloalgoritmo@indice}\par
			}
		}{}
		\ifthenelse{\isundefined{\tituloalgoritmo@sinleyenda}}{
			\ifthenelse{\isundefined{\tituloalgoritmo@titulo}}{
				\centering\par\normalfont\normalsize\noindent{{\bfseries \algorithmname\ifthenelse{\isundefined{\tituloalgoritmo@sinindice}}{~\thealgs}{}} \ifthenelse{\isundefined{\tituloalgoritmo@fuente}}{}{\\ {\bfseries Fuente:} \tituloalgoritmo@fuente}}\\
			}{
				\centering\par\normalfont\normalsize\noindent{{\bfseries \algorithmname\ifthenelse{\isundefined{\tituloalgoritmo@sinindice}}{~\thealgs}{}:} \tituloalgoritmo@titulo \ifthenelse{\isundefined{\tituloalgoritmo@fuente}}{}{\\ {\bfseries Fuente:} \tituloalgoritmo@fuente}}\\
			}
		}{}
	}

%	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	\formatearindice
}

%Comando: formatearindice
%Descripción: Le da formato a los índices, fuentes, tamaños, identaciones, entre otras. Llamado desde \configurarindice.
\newcommand{\formatearindice}{
	
	%Índice general
	%Para las partes. Usado en Anexos para que los anexos salgan dentro de una carpeta en el outline
	\renewcommand{\cftpartfont}{\normalfont\normalsize}
	\renewcommand{\cftpartpagefont}{\normalfont\normalsize}
	\renewcommand{\cftpartleader}{\normalfont\normalsize\cftdotfill{\cftpartdotsep}}
	\renewcommand{\cftpartdotsep}{\cftdotsep}
	\renewcommand{\cftpartindent}{0cm}
	\setlength{\cftbeforepartskip}{0cm}
	
	%Para capítulos sin numeración se usará paragraph para que salgan en el índice correctamente
	%Principalmente hecho para las páginas preliminares
	\renewcommand{\cftparafont}{\normalfont\normalsize}
	\renewcommand{\cftparapagefont}{\normalfont\normalsize}
	\renewcommand{\cftparaleader}{\normalfont\normalsize\cftdotfill{\cftparadotsep}}
	\renewcommand{\cftparadotsep}{\cftdotsep}
	\renewcommand{\cftparaindent}{0cm}
	\setlength{\cftbeforeparaskip}{0cm}
	
	%Capítulos con numeración
	\renewcommand{\cftchapfont}{\normalfont\normalsize}
	\renewcommand{\cftchappagefont}{\normalfont\normalsize}
	\setlength{\cftbeforechapskip}{0cm}
	\setlength{\cftchapindent}{2\parindent}
	\setlength{\cftchapnumwidth}{2\parindent}
	\renewcommand{\cftchapleader}{\normalfont\normalsize\cftdotfill{\cftchapdotsep}}
	\renewcommand{\cftchapdotsep}{\cftdotsep}
	%Secciones
	\renewcommand{\cftsecfont}{\normalfont\normalsize}
	\setlength{\cftbeforesecskip}{0cm}
	\setlength{\cftsecindent}{5\parindent}
	
	%Subsecciones
	\renewcommand{\cftsubsecfont}{\normalfont\normalsize}
	\setlength{\cftbeforesubsecskip}{0cm}
	\setlength{\cftsubsecindent}{6\parindent}
	%Subsubsecciones
	\renewcommand{\cftsubsubsecfont}{\normalfont\normalsize}	
	\setlength{\cftbeforesubsubsecskip}{0cm}
	\setlength{\cftsubsubsecindent}{7\parindent}
	
}

%Comando: hacerindicegeneral
%Descripción: Crea el índice general.
\newcommand{\hacerindicegeneral}{
	\tableofcontents
	\newpage
}

%Comando: hacerindiceilustracions
%Descripción: Crea el índice de ilustraciones.
\newcommand{\hacerindiceilustraciones}{
	\listofilustrations
	\newpage
}

%Comando: hacerindicegraficos
%Descripción: Crea el índice de gráficos.
\newcommand{\hacerindicegraficos}{
	\listofcharts
	\newpage
}

%Comando: hacerindicecuadros
%Descripción: Crea el índice de cuadros
\newcommand{\hacerindicecuadros}{
	\listoftabulations
	\newpage
}

%Comando: hacerindicelistados
%Descripción: Crea el índice de listados.
\newcommand{\hacerindicelistados}{
	\lstlistoflistings
	\newpage
}

%Comando: hacerindicependientes
%Descripción: Crea el índice de pendientes.
\newcommand{\hacerindicependientes}{
	\listoftodos
	\newpage
}

%Comando: hacerindicenotas
%Descripción: Crea el índice de notas.
\newcommand{\hacerindicenotas}{
	\listofnotes
	\newpage
}

%Comando: hacerindicealgoritmos
%Descripción: Crea el índice de algoritmos.
\newcommand{\hacerindicealgoritmos}{
	\listofalgorithms
	\newpage
}	

%Comando: hacerindices
%Descripción: Crea todos los índices en el orden adecuado. En caso de que los pendientes estén habilitados, mostrará el índice de pendientes también.
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

%Comando: indexarpreliminar
%Descripción: Agrega el preliminar al índice general. Se usa paragraph para evitar que se incluyan siguientes secciones en el outline.
%Parámetros: [1] Nombre a mostrar en el índice
\newcommand{\indexarpreliminar}[1]{
	\phantomsection % Recomendado antes de addcontentsline para evitar problemas con hyperref. 	
	\MakeUppercase{\gdef\noexpand\aux{#1}}
	\addcontentsline{toc}{paragraph}{\aux} %Única forma que encontré para expandir las mayúsculas y evitar el warning con el \uppercase al generarse el bookmark.
	%\addcontentsline{toc}{paragraph}{\uppercase{#1}} %También puede resolverse quitando el \uppercase y asegurandose de colocar manualmente en mayúscula todos los títulos en el documento.
}

%Comando: indexarintroduccion
%Descripción: Agrega la introducción al índice general y agrega la palabra capítulo al índice.
%Parámetros: [1] Nombre a mostrar en el índice
\newcommand{\indexarintroduccion}[1]{
	\indexarpreliminar{#1}
	\addtocontents{toc}
	{\protect\mbox{\normalfont\normalsize \bfseries CAPÍTULO}\protect\hfill\par}
}

%Comando: indexarparte
%Descripción: Agrega la parte al índice general. Caso Anexos. 
%Parámetros: [1] Nombre a mostrar en el índice
\newcommand{\indexarparte}[1]{
	\phantomsection % Recomendado antes de addcontentsline para evitar problemas con hyperref. 	
	\MakeUppercase{\gdef\noexpand\aux{#1}}
	\addcontentsline{toc}{part}{\aux} %Única forma que encontré para expandir las mayúsculas y evitar el warning con el \uppercase al generarse el bookmark.
	%\addcontentsline{toc}{part}{\uppercase{#1}} %También puede resolverse quitando el \uppercase y asegurandose de colocar manualmente en mayúscula todos los títulos en el documento
}

%Comando: indexarcapitulo
%Descripción: Agrega el capítulo al índice general. No sé en qué caso, pero por si acaso.
%Parámetros: [1] Nombre a mostrar en el índice
\newcommand{\indexarcapitulo}[1]{
	\phantomsection % Recomendado antes de addcontentsline para evitar problemas con hyperref. 	
	\addcontentsline{toc}{chapter}{#1}
}

%Comando: indexarseccion
%Descripción: Agrega la sección al índice general. 
%Parámetros: [1] Nombre a mostrar en el índice
\newcommand{\indexarseccion}[1]{
	%\phantomsection % Recomendado antes de addcontentsline para evitar problemas con hyperref. 	
	\addcontentsline{toc}{section}{#1}
}

%Comando: indexarsubseccion
%Descripción: Agrega la subsección al índice general. 
%Parámetros: [1] Nombre a mostrar en el índice
\newcommand{\indexarsubseccion}[1]{
	%\phantomsection % Recomendado antes de addcontentsline para evitar problemas con hyperref. 	
	\addcontentsline{toc}{subsection}{#1}
}

%Comando: indexarsubsubseccion
%Descripción: Agrega la subsubsección al índice general. 
%Parámetros: [1] Nombre a mostrar en el índice
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

% título más apropiado cuando se incluyen acrónimos
\newcommand{\hacerglosarioconacronimos}{
	\continuarsubsubseccion
	\printglossary[title={Glosario de Acrónimos y Términos}, toctitle={Glosario de Acrónimos y Términos}]
	\continuarsubsubseccion
}

%Comando: hacercaratula
%Descripción: Crea la carátula de la tesis, la que va por fuera.
\newcommand{\hacercaratula}{
	%\setcounter{page}{-1}
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
			{\@ciudad, \ifthenelse{\isundefined{\@mesencaratula}}{}{\@mesdefensa\ de }\@annodefensa.}
		\end{center}

	\newpage
}

%Comando: hacerpresentacion
%Descripción: Crea la hoja de presentación de la tesis.
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
		{Trabajo presentado para optar al grado de\\
		\@grado}
		\vfill
		\begin{flushright}
			Por: \MakeUppercase{\@autor}
		\end{flushright}
		\vfill
		{\@ciudad, \ifthenelse{\isundefined{\@mesencaratula}}{}{\@mesdefensa\ de }\@annodefensa.}
	\end{center}
	\newpage
}

%Comando: haceraprobacion
%Descripción: Crea la hoja de aprobación
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
					\textbf{Tutor}
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
		{\@ciudad, \@diadefensa~ de \@mesdefensa~ de \@annodefensa.}
	\end{center}
	\newpage
}

%Comando: hacerresumen
%Descripción: Crea el resumen de la tesis.
\newcommand{\hacerresumen}{
	\begin{center}
		\indexarpreliminar{Resumen}
	%\begin{singlespace}
		\MakeUppercase{Universidad Centroccidental} 
		\textquotedblleft \MakeUppercase{Lisandro Alvarado}\textquotedblright\\
		\MakeUppercase{Decanato de \@decanato}\\
		\MakeUppercase{\@postgrado}\\
		\espaciotriple
		\MakeUppercase{\textbf{\@titulo}}\\
	\espaciotriple
	\raggedleft{
		\textbf{Autor:} \@autor\\
		\textbf{Tutor:} \@tutor\\
		\ifthenelse{\isundefined{\@fechaenresumen}}{}{
			\textbf{Fecha:} \@mesdefensa\ \@annodefensa\\
		}
	}
	\espaciotriple
	\centering{{\textbf{\MakeUppercase{Resumen}}}}\\
	\espaciotriple
	\begin{singlespace}
	\justifying{\@resumen}
	\end{singlespace}
	\noindent\justifying{\textbf{Palabras Clave:} \@palabrasclave}
	\end{center}
	\newpage
}

%Comando: hacerabstact
%Descripción: Crea el abstract de la tesis.
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
			\textbf{Date:} \@monthdefensa\ \@annodefensa\\
		}
	}
	\espaciotriple
	\centering{\MakeUppercase{\textbf{Abstract}}}
	\espaciotriple
	\begin{singlespace}
	\justifying{\@abstract}
	\end{singlespace}
	\noindent\justifying{\textbf{Keywords:} \@keywords}
	\end{center}
	\selectlanguage{spanish}
	\newpage
}

%Comando: haceranexos
%Descripción: Prepara el documento para agregar anexos.
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

% Comando: citar
% Descripción: Introduce una referencia bibliográfica de la forma Autor (año).
% Parámetros: [1] Identificador del registro bibliográfico.
% Uso: 
% ... de acuerdo con \citar{parma:aco}, el algoritmo de ...
% Resultado:
% ... de acuerdo con Parma et al. (2007), el algoritmo de ...
%\newcommand{\citar}[1]{\citet{#1}}
% Según el Manual de Trabajos, esta cita solo debe usarse cuando el nombre del autor es parte de la narrativa. Cuando no, usar \citep. También puede citarse solo el autor en párrafos cercanos a la primera cita con \citeauthor. Otros comandos son: \citet*, \citep*, \citep[][], \citeauthor*, \citeyear.

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
	\section*{#1}
	\indexarseccion{#1}
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
	\subsection*{#1}
	\indexarsubseccion{#1}
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
	\subsubsection*{#1}
	\indexarsubsubseccion{#1}
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

% Agrega página en blanco.
\newcommand{\pagenblanco}{
	\newpage
	\thispagestyle{empty}
	\mbox{}
	\newpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Comandos no internos de la versión anterior

\def\@citarcomo{\variablefaltante{citarcomo}} % Para introducir una cita de la forma Autor (año), donde Autor es el apellido del autor del trabajo de grado
\newcommand{\citarcomo}[1]{\def\@citarcomo{#1}}

% Comando: yo
% Descripción: Introduce el apellido del autor y el año de este trabajo (e.g. Bar (2009)).
% Uso: \yo
\newcommand{\yo}{\@citarcomo\ (\@annodefensa)} 

% Ambiente: ecuaciones*
% Descripción: Prepara el contexto para insertar varias ecuaciones sin enumerarlas
% Uso: 
% \begin{ecuaciones*}
% \sum{F_{x}} = 0\\
% \sum{M_{x} = 0}
% \end{ecuaciones*}
%
\newenvironment{ecuaciones*}
	{	
		\espaciosimple
		\begin{eqnarray*}
	}
	{\end{eqnarray*}}
		
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

% Comando: refilustracion
% Descripción: Hace referencia a una ilustración
% Parametros: [1] Etiqueta
% Uso: \refilustracion{etiqueta}
\newcommand{\refilustracion}[1]{\hyperref[#1]{Ilustración \ref{#1}}}
\newcommand{\refpilustracion}[1]{(\refilustracion{#1})}

% Comando: refcuadro
% Descripción: Hace referencia a un cuadro
% Parametros: [1] Etiqueta
% Uso: \refcuadro{etiqueta}
\newcommand{\refcuadro}[1]{\hyperref[#1]{Cuadro \ref{#1}}}
\newcommand{\refpcuadro}[1]{(\refcuadro{#1})}

% Comando: refalgoritmo
% Descripción: Hace referencia a un algoritmo
% Parametros: [1] Etiqueta
% Uso: \refalgoritmo{etiqueta}
\newcommand{\refalgoritmo}[1]{\hyperref[#1]{Algoritmo \ref{#1}}}
\newcommand{\refpalgoritmo}[1]{(\refalgoritmo{#1})}

% Comando: refgrafico
% Descripción: Hace referencia a un grafico
% Parametros: [1] Etiqueta
% Uso: \refgrafico{etiqueta}
\newcommand{\refgrafico}[1]{\hyperref[#1]{Gráfico \ref{#1}}}
\newcommand{\refpgrafico}[1]{(\refgrafico{#1})}

% Comando: reflistado
% Descripción: Hace referencia a un listado
% Parametros: [1] Etiqueta
% Uso: \reflistado{etiqueta}
\newcommand{\reflistado}[1]{\hyperref[#1]{Listado \ref{#1}}}
\newcommand{\refplistado}[1]{(\reflistado{#1})}

% Para citar titulo
%\renewcommand\defcitealias[2]{\@ifundefined{al@#1\@extra@b@citeb}{}{\PackageWarning{natbib}{Overwriting existing alias for citation #1}}\@namedef{al@#1\@extra@b@citeb}{#2}}
\renewcommand\defcitealias[2]{\@namedef{al@#1\@extra@b@citeb}{#2}}
\newcommand{\citetitle}[1]{\defcitealias{#1}{\usebibentry{#1}{title}}``\citetalias{#1}''}

% Variable bibliografia
\def\@bibliografia{bibliografia}
\newcommand{\bibliografia}[1]{
	\def\@bibliografia{#1}
	\bibinput{#1}
}

% Comando comillas
\newcommand{\comillas}[1]{``#1''}

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