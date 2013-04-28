% Universidad Centroccidental Lisandro Alvarado
% Tesis de Maestría
% por Juan Rada Vilela <jcrada@gmail.com> y Rubén Parma <parmaia@gmail.com>
% bajo Licencia GNU General Public License. 

\NeedsTeXFormat{LaTeX2e}
\newcommand{\uclamscversion}{1.1}
\newcommand{\uclamscdate}{2009/03/01}
\ProvidesClass{uclamsc}[\uclamscdate, \uclamscversion]
\typeout{Reportar dudas y errores a <jcrada@gmail.com, parmaia@gmail.com>.}


\LoadClass[12pt,oneside,letterpaper,final]{book}

\def\@final{false} 
\newcommand{\final}[1]{\def\@final{#1}}
\RequirePackage[english,spanish]{babel} %english para el abstract, es-lcroman para números romanos en minúsculas en páginas preliminares
\RequirePackage[top=2.55cm,bottom=2.55cm,left=3.4cm,right=2.55cm]{geometry} %Para los márgenes
\RequirePackage[utf8]{inputenc} %El encoding por defecto es utf8, aunque en Windows podría traer problemas (e.g. no mostrar caracteres acentuados)
\RequirePackage[T1]{fontenc} %Para evitar advertencia al compilar
\RequirePackage[onehalfspacing]{setspace} %Para el espaciado del documento
\RequirePackage[colorlinks]{hyperref} %Para hipervínculos en el documento (ver \iniciar)
\RequirePackage{url} %Para dar formato a direcciones web.
\RequirePackage{ragged2e} %Para justificar texto (\justifying)
\RequirePackage{paralist} %Para enumeraciones dentro de párrafos
\RequirePackage{enumitem} %Para enumeraciones
\RequirePackage{color} %Para poner color en notas y pendientes
\RequirePackage{fancyhdr} %Para poner numeración de páginas en la parte baja
\RequirePackage{subfigure}
\RequirePackage[subfigure]{tocloft} %Para configurar índice general, de figuras y cuadros
\RequirePackage{graphicx} %Para insertar imágenes
\RequirePackage{float} %Para el ambiente de las imágenes
\RequirePackage{supertabular} %Para los cuadros
\RequirePackage{ctable} %Para los cuadros, particularmente las líneas (\toprule, \midrule, \bottomrule)
\RequirePackage{natbib} %Para la bibliografía
\RequirePackage{calc} %Para poder realizar operaciones con las variables
\RequirePackage{ifthen} %Para condiciones, usado en pendientes
\RequirePackage[toc,section=section]{glossaries} %Para la definición de términos básicos
\RequirePackage{printlen} %Para imprimir valores usando \printlength{\length}


%Comando: pendientes
%Descripción: Llamado al configurar para listar los pendientes de uclamsc.cls
\newcommand{\pendientes}{
	% \pendiente{Arreglar sangría} Realizado.
	
}

\newcommand{\variablefaltante}[1]{{\tt \bfseries DEFINIR \textbackslash {#1}\{\} }}

\def\@titulo{\variablefaltante{titulo}} % Título del trabajo de grado
\newcommand{\titulo}[1]{\def\@titulo{#1}}
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
\def\@annodefensa{\variablefaltante{annodefensa}} % Año de la defensa (e.g. 2009)
\newcommand{\annodefensa}[1]{\def\@annodefensa{#1}}

\def\@tutor{\variablefaltante{tutor}}	% Nombre del tutor
\newcommand{\tutor}[1]{\def\@tutor{#1}}
\def\@primerjurado{\variablefaltante{primerjurado}} % Nombre del primer jurado
\newcommand{\primerjurado}[1]{\def\@primerjurado{#1}}
\def\@segundojurado{\variablefaltante{segundojurado}} % Nombre del segundo jurado
\newcommand{\segundojurado}[1]{\def\@segundojurado{#1}}

\def\@resumen{\variablefaltante{resumen}} % Resumen del trabajo
\newcommand{\resumen}[1]{\def\@resumen{#1}}
\def\@palabrasclave{\variablefaltante{palabrasclave}} % Palabras clave separadas por coma. (e.g. IA, PSO, etc.)
\newcommand{\palabrasclave}[1]{\def\@palabrasclave{#1}}

\title{\variablefaltante{title}} % Título del trabajo en inglés
\def\@abstract{\variablefaltante{abstract}}
\newcommand{\abstract}[1]{\def\@abstract{#1}} % Resumen del trabajo en inglés
\def\@keywords{\variablefaltante{keywords}}
\newcommand{\keywords}[1]{\def\@keywords{#1}} % Palabras clave del trabajo en inglés.
\def\@citarcomo{\variablefaltante{citarcomo}} % Para introducir una cita de la forma Autor (año), donde Autor es el apellido del autor del trabajo de grado
\newcommand{\citarcomo}[1]{\def\@citarcomo{#1}}

% Comando: yo
% Descripción: Introduce el apellido del autor y el año de este trabajo (e.g. Bar (2009)).
%Uso: \yo
\newcommand{\yo}{\@citarcomo\ (\@annodefensa)} 

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


% Comando: preambulo
% Descripción: Para ser utilizado antes de \begin{document}. Hace glosarios, entre otras cosas
\newcommand{\preambulo}{
	\listfiles
	\makeglossaries
}

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

% Comando: espaciotriple
% Descripción: Agrega un espacio simple
\newcommand{\espaciosimple}{
	\vspace{0cm}
}

% Comando: tab
% Descripción: Inserta un espacio simulando a una tabulación.
% Uso: \tab
\newcommand{\tab}[1]{\hspace{#1em}}

% Comando: tabm
% Descripción: Inserta un especio simulando a una tabulación pero en modo matemático.
% Uso: $\tab$ \begin{ecuaciones} \tabm \tabm \end{ecuaciones}
\newcommand{\tabm}{\;\;\;\;\;\;}


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
	{
		\setcounter{tmpcounter}{\value{enumi}}
		\begin{inparaenum}[(a)]
	}
	{
		\setcounter{enumi}{\value{tmpcounter}}
		\end{inparaenum}
	}
	
% Ambiente: preliminares 
% Descripción: Para usar en las páginas preliminares, determina numeración de páginas.
% Uso:
% \begin{preliminares}
% \include{chapters/dedicatoria}
% \include{chapters/agradecimientos}
% \end{preliminares}
% 
\ifx\spanishlcroman\undefined
	\newcommand\spanishlcroman{\def\@roman##1{\romannumeral##1}}		
\else
	
\fi
\newenvironment{preliminares}
	{
		\spanishlcroman
		\pagenumbering{roman}
	}
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
\newenvironment{anexos}{}{}

% Ambiente: ilustracion
% Descripción: Prepara el contexto para insertar una ilustración o imagen.
% Uso: 
% \begin{ilustracion}
% 	\includegraphics[height=2cm,width=2cm]{figures/cuadrado.png}
%	\tituloilustracion{Cuadrado}{etiqueta}
% \end{ilustracion}
%
\newenvironment{ilustracion}
	{\begin{figure}[htcb] \espaciotriple\centering}
	{\end{figure}}

% Ambiente: grafico
% Descripción: Prepara el contexto para insertar un gráfico (e.g. gráfico de barras, líneas, torta, etc.).
% Uso: 
% \begin{grafico}
% 	\includegraphics[height=2cm,width=2cm]{figures/fitness.png}
%	\titulografico{Fitness vs. Épocas}{etiqueta}
% \end{grafico}
%
\newenvironment{grafico}
	{\begin{figure}[htcb] \espaciotriple\centering}
	{\end{figure}}

% Ambiente: cuadro
% Descripción: Prepara el contexto para insertar un cuadro o tabla.
% Parámetros: [1] columnas y formato, [2] título del cuadro, [3] etiqueta para luego referirse al mismo como \ref{etiqueta}.
% Uso: 
% \begin{cuadro}{cccc}{Piedra, Papel ó Tijeras – Forma Normal}{cua:ppt-fn}
% 	\toprule
% 	Jugares I/II & Piedra & Papel & Tijeras\\
% 	\midrule
% 	Piedra   & (0,0) & (-1,1) & (1,-1)\\
% 	Papel   & (1,-1) & (0,0) & (-1,1)\\
% 	Tijeras   & (-1,1) & (1,-1) & (0,0)\\
% 	\bottomrule
% 	\fuentecuadro{4}{Juan Rada (2005)}
% \end{cuadro}

\newenvironment{cuadro}[3] %título, etiqueta
	{
		\begin{table}[htb]
		\centering
		\espaciodoble
		\titulocuadro{#2}
		\label{#3}
		% \scriptsize
		\begin{spacing}{1.0}
		\begin{tabular}{#1}
	}
	{
		\end{tabular}
		\end{spacing}
		\end{table}
	}

\newenvironment{cuadro*}[1] %título, etiqueta
	{
		\begin{tabular}{#1}
	}
	{
		\end{tabular}
	}


\newenvironment{cuadrolargo}[3] %título, etiqueta
	{
		\begin{table}[htb]
		\centering
		\espaciodoble
		\titulocuadro{#2}
		\label{#3}
		\scriptsize
		\begin{spacing}{1.0}
		\begin{tabular}{#1}
	}
	{
		\end{tabular}
		\end{spacing}
		\end{table}
	}
	
% Comando: citatextual
% Descripción: Introduce una cita textual
% Parámetros: [1] cita textual
% Uso: \citatextual{Esto es una cita textual}
\newcommand{\citatextual}[1]{\textquotedblleft #1\textquotedblright}

% Ambiente: citatextuallarga
% Descripción: Prepara el contexto para una cita textual de más de 40 palabras. Se recomienda comenzar la cita inmediatamente luego (sin espacios) de \begin{citatextuallarga} para evitar espacios que se puedan agregar al principio de la línea.
% Uso: 
% \begin{citatextuallarga}...Esto es una cita textual... (40 palabras)...
% \end{citatextuallarga}
%
\newenvironment{citatextuallarga}
	{
		\espaciodoble
		\begin{spacing}{1.0}
		\setlength{\leftskip}{\leftskip+{2\parindent}}
		\setlength{\rightskip}{\rightskip+{2\parindent}}
		\noindent
	}
	{	
		\end{spacing}
		\espaciodoble
	}
	
% Ambiente: citatextualmuylarga
% Descripción: Prepara el contexto para una cita textual de varios párrafos.
% Uso: 
% \begin{citatextualmuylarga}
% ...Esto es una cita textual... (40 palabras)...\par
% ...Esto es una cita textual... (40 palabras)...\par
% ...Esto es una cita textual... (40 palabras)...\par
% \end{citatextualmuylarga}
%	
\newenvironment{citatextualmuylarga} % Para citas textuales de dos o más párrafos
	{
		\espaciodoble
		\begin{spacing}{1.0}
		\setlength{\leftskip}{\leftskip+{2\parindent}}
		\setlength{\rightskip}{\rightskip+{2\parindent}}
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
	{	% \espaciosimple
		\begin{equation}
		\label{#1}
	}
	{\end{equation}}

% Ambiente: ecuaciones
% Descripción: Prepara el contexto para insertar varias ecuaciones
% Uso: 
% \begin{ecuaciones}
% &\sum{F_{x}} = 0&\\  %Para centrar se utilizan & xxxxx &
% \sum{M_{x} = 0}
% \end{ecuaciones}
%
\newenvironment{ecuaciones}
	{			% \espaciosimple
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
\newcommand{\agregartermino}[2]{
	\newglossaryentry{#1}{#2}
}


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
	\newcounter{tmpcounter} % Contador de uso general.
	
	\ifthenelse{\equal{\@final}{false}}{
		\hypersetup{
			pdftitle = {\@titulo},
			pdfauthor = {\@autor},
			pdfkeywords = {\@palabrasclave},
			pdfborder={0 0 0},
			linkcolor = red,
			anchorcolor = red,
			citecolor = blue, 
			filecolor = red, 
			urlcolor = red
		}
	}{
		\hypersetup{
			pdftitle = {\@titulo},
			pdfauthor = {\@autor},
			pdfkeywords = {\@palabrasclave},
			pdfborder={0 0 0},
			linkcolor = black,
			anchorcolor = black,
			citecolor = black, 
			filecolor = black, 
			urlcolor = black
		}
	}
	
}

% Comando: configurarestructura
% Descripción: Determina el formato de capítulos, secciones, subsecciones y subsubsecciones
\newcommand{\configurarestructura}{
	\def\@makechapterhead##1{ %Para los capítulos numerados
		\vspace*{0cm}	%Espacio de 1cm antes de cada capítulo
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
	\renewcommand{\section}{\@startsection{section}{1}{\z@}{22pt}{22pt}{\normalfont\normalsize\bfseries}}
	\renewcommand{\subsection}{\@startsection{subsection}{2}{\parindent}{22pt}{22pt}{\normalfont\normalsize\bfseries}}
	\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{2\parindent}{22pt}{22pt}{\normalfont\normalsize\bfseries}}
	
	
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
		\capitulosinnumeracion{{Índice General}}
		\indexarpreliminar{Índice General}
		\flushright{\bfseries PÁG.}
		\flushleft
		\@starttoc{toc}
	}
	\setcounter{tocdepth}{5} % Para mostrar hasta los párrafos (caso de preliminares).
		
	% Índice de gráficos
	\newcommand{\listofchartsname}{{Índice de Gráficos}} 
	\newlistof[part]{charts}{loc}{\listofchartsname} 

	%Comando: listofcharts
	%Descripción: Crea el índice de gráficos.
	\renewcommand{\listofcharts}{
		\capitulosinnumeracion{{Índice de Gráficos}}
		\indexarpreliminar{Índice de Gráficos}
		\flushright{\bfseries PÁG.}
		\@starttoc{loc}
	}
	\renewcommand{\thecharts}{\@arabic\c@charts}
	
	%Comando: titulografico
	%Descripción: Agrega un título al gráfico y lo coloca en el índice de gráficos.
	%Parámetros: [1] Título del gráfico, [2] Etiqueta
	\newcommand{\titulografico}[2]{
		\refstepcounter{charts} 
		\par\normalfont\normalsize\noindent{{\bfseries Gráfico~\thecharts.} ##1}
		\label{##2}
		\addcontentsline{loc}{charts}{\protect{\thecharts. }##1}\par
		\espaciodoble
	} 

%	%Índice de Ilustraciones
	\newcommand{\listofilustrationsname}{{Índice de Ilustraciones}} 
	\newlistof[part]{ilustrations}{loi}{\listofilustrationsname} 
%
%	%Comando: listofcharts
%	%Descripción: Crea el índice de ilustraciones.
	\renewcommand{\listofilustrations}{
		\capitulosinnumeracion{{Índice de Ilustraciones}}
		\indexarpreliminar{Índice de Ilustraciones}
		\flushright{\bfseries PÁG.}
		\@starttoc{loi}
	}
	\renewcommand{\theilustrations}{\@arabic\c@ilustrations}
%
%	%Comando: tituloilustracion
%	%Descripción: Agrega un título a la ilustracion y la coloca en el índice de ilustraciones.
% Parámetros: [1] Título de la ilustración, [2] Etiqueta
% 
	\newcommand{\tituloilustracion}[2]{
		\refstepcounter{ilustrations} 
		\par\normalfont\normalsize\noindent{{\bfseries Ilustración~\theilustrations.} ##1}
		\label{##2}
		\addcontentsline{loi}{ilustrations}{\protect{\theilustrations. }##1}\par
		\espaciodoble
	}
	
	% Índice de cuadros		
	
	\newcommand{\listoftabulationsname}{{Índice de Cuadros}} 
	\newlistof[part]{tabulations}{loq}{\listoftabulationsname} 

	%Comando: listofcharts
	%Descripción: Crea el índice de cuadros.
	\renewcommand{\listoftabulations}{
		\capitulosinnumeracion{{Índice de Cuadros}}
		\indexarpreliminar{Índice de Cuadros}
		\flushright{\textbf{PÁG.}}
		\@starttoc{loq}
	}
	\renewcommand{\thetabulations}{\@arabic\c@tabulations}

	%Comando: titulocuadro
	%Descripción: Agrega un título al cuadro y lo coloca en el índice de cuadros.
	%Parámetros: [1] Título del cuadro
	\newcommand{\titulocuadro}[1]{
		\refstepcounter{tabulations} 
		\espaciodoble\normalfont\normalsize\noindent{\bfseries{Cuadro~\thetabulations.}\\\espaciotriple ##1\espaciodoble}
		\addcontentsline{loq}{tabulations}{\protect{\thetabulations. }##1}\par
	}
	
	%Comando: fuentecuadro
	%Descripción: Agrega la fuente del cuadro
	%Parámetros: [1] Columnas del cuadro, [2] Fuente (e.g. Juan Rada (2005))
	\newcommand{\fuentecuadro}[2]{\multicolumn{##1}{l}{\normalsize{\bfseries Fuente:} ##2.} \hfill\espaciodoble}
	
	%Índice de Pendientes
	\newcommand{\listoftodosname}{{Índice de Pendientes}} 
	\newlistof[part]{todos}{lod}{\listoftodosname} 

	%Comando: listoftodos
	%Descripción: Crea el índice de pendientes.
	\renewcommand{\listoftodos}{
		{\color{red}
		\capitulosinnumeracion{{Índice de Pendientes}}
		\indexarpreliminar{ÍNDICE DE PENDIENTES}
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
			\noindent{\color{red}\normalfont\scriptsize{\bfseries{\thetodos. }##1}}
			% \end{spacing}
			\addcontentsline{lod}{todos}{\protect{\thetodos. }##1}
		}{}
	}
	
	%%%%%%
	%Índice de Notas
	\newcommand{\listofnotesnames}{{Índice de Notas}} 
	\newlistof[part]{notes}{lon}{\listofnotesnames} 

	%Comando: listofnotes
	%Descripción: Crea el índice de notas.
	\renewcommand{\listofnotes}{
		{\color{blue}
		\capitulosinnumeracion{{Índice de Notas}}
		\indexarpreliminar{ÍNDICE DE NOTAS}
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
			\noindent{\color{blue}\normalfont\scriptsize{\bfseries{\thenotes. }##1}}
			\addcontentsline{lon}{notes}{\protect{\thenotes. }##1}\par
		}{}
	}
	
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

%Comando: hacerindice
%Descripción: Crea todos los índices en el orden adecuado. En caso de que los pendientes estén habilitados, mostrará el índice de pendientes también.
\newcommand{\hacerindice}{
	\hacerindicegeneral
	\hacerindicecuadros
	\hacerindicegraficos
	\hacerindiceilustraciones
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
	\addcontentsline{toc}{paragraph}{\uppercase{#1}}
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
	\addcontentsline{toc}{part}{\uppercase{#1}}
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
	\phantomsection % Recomendado antes de addcontentsline para evitar problemas con hyperref. 	
	\addcontentsline{toc}{section}{#1}
}

%Comando: indexarsubseccion
%Descripción: Agrega la subsección al índice general. 
%Parámetros: [1] Nombre a mostrar en el índice
\newcommand{\indexarsubseccion}[1]{
	\phantomsection % Recomendado antes de addcontentsline para evitar problemas con hyperref. 	
	\addcontentsline{toc}{subsection}{#1}
}

%Comando: indexarsubsubseccion
%Descripción: Agrega la subsubsección al índice general. 
%Parámetros: [1] Nombre a mostrar en el índice
\newcommand{\indexarsubsubseccion}[1]{
	\phantomsection % Recomendado antes de addcontentsline para evitar problemas con hyperref. 	
	\addcontentsline{toc}{subsubsection}{#1}
}

% Comando: hacerglosario
% Descripción: Agrega la definición de términos básicos al trabajo.
\newcommand{\hacerglosario}{
	\continuarsubsubseccion
	\printglossary[title={Definición de Términos Básicos},toctitle={Definición de Términos Básicos}]
	\continuarsubsubseccion
}

%Comando: hacercaratula
%Descripción: Crea la carátula de la tesis, la que va por fuera.
\newcommand{\hacercaratula}{
	\setcounter{page}{-1}
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
			{\@ciudad, \@annodefensa.}
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
		\MakeUppercase{Postgrado de \@postgrado}
		\vfill 
		{\textbf{\MakeUppercase{\@titulo}}}\\
		\vfill
		{Trabajo presentado para optar al grado de\\
		Magister Scientiarum}
		\vfill
		\begin{flushright}
			Por: \MakeUppercase{\@autor}
		\end{flushright}
		\vfill
		{\@ciudad, \@annodefensa.}
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
		\MakeUppercase{Universidad Centroccidental} \citatextual{\MakeUppercase{Lisandro Alvarado}}\\
		\MakeUppercase{Decanato de \@decanato}\\
		\MakeUppercase{Postgrado de \@postgrado}\\
		\espaciotriple
		\MakeUppercase{\@titulo}\\
	\espaciotriple
	\raggedleft{
		\textbf{Autor:} \@autor\\
		\textbf{Tutor:} \@tutor\\
	}
	\espaciotriple
	\centering{{\textbf{\MakeUppercase{Resumen}}}}
	\espaciotriple
	\begin{singlespace}
	\justifying{\@resumen}
	\end{singlespace}
	\begin{singlespace}
	\noindent\justifying{\textbf{Palabras Clave:} \@palabrasclave.}
	\end{singlespace}
	\end{center}
	\newpage
}

%Comando: hacerabstact
%Descripción: Crea el abstract de la tesis.
\newcommand{\hacerabstract}{
	\selectlanguage{english}
	\begin{center}
		\indexarpreliminar{Abstract}
		\MakeUppercase{Universidad Centroccidental} \citatextual{\MakeUppercase{Lisandro Alvarado}}\\
		\MakeUppercase{Decanato de \@decanato}\\
		\MakeUppercase{Postgrado de \@postgrado}\\
		\espaciotriple
		\MakeUppercase{\@title}\\
	\espaciotriple
	\raggedleft{
		\textbf{Author:} \@autor\\
		\textbf{Supervisor:} \@tutor\\
	}
	\espaciotriple
	\centering{\MakeUppercase{\textbf{Abstract}}}
	\espaciotriple
	\begin{singlespace}
	\justifying{\@abstract}
	\end{singlespace}
	\begin{singlespace}
	\noindent\justifying{\textbf{Keywords:} \@keywords.}
	\end{singlespace}
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
		\ 
		\vfill
		\centering{\normalfont \normalsize \bfseries \MakeUppercase{##1}}\\
		\vfill
		\ 
		\justifying
		}
	\capitulosinnumeracion{Anexos}
	\indexarparte{Anexos}
	
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
\newcommand{\hacerbibliografia}[1]{
	%Si existen ítems bibtex de tipo @misc, es necesario borrar el comando \url de la propiedad URL. Causa problemas.
	\renewcommand\bibsection{\capitulosinnumeracion{Referencias Bibliográficas}}
	\bibliographystyle{uclamsc}
	\bibliography{#1}
	\indexarparte{Referencias Bibliográficas}
}

% Comando: citar
% Descripción: Introduce una referencia bibliográfica de la forma Autor (año).
% Parámetros: [1] Identificador del registro bibliográfico.
% Uso: 
% ... de acuerdo con \citar{parma:aco}, el algoritmo de ...
% Resultado:
% ... de acuerdo con Parma et al. (2007), el algoritmo de ...
\newcommand{\citar}[1]{\citet{#1}}

% Comando: preliminar
% Descripción: Crea una página preliminar.
% Parámetros: [1] Nombre del preliminar
% Uso: 
% \preliminar{Agradecimientos}
\newcommand{\preliminar}[1]{
	\setlength{\leftskip}{0cm}
	\capitulosinnumeracion{#1}
	\indexarpreliminar{#1}
	\setlength{\leftskip}{0cm}
}

% Comando: introduccion
% Descripción: Crea la introducción. No recibe parámetros, se distingue por la forma en que se indexa la introducción
% Uso: 
% \introduccion
% Desde los años 500 AC, la comunidad bla bla bla bla bla bla bla bla bla bla bla bla .
\newcommand{\introduccion}{
	\setlength{\leftskip}{0cm}
	\capitulosinnumeracion{Introducción}
	\indexarintroduccion{Introducción}
	\setlength{\leftskip}{0cm}
}

% Comando: capitulo
% Descripción: Crea un capitulo.
% Uso: 
% \capitulo{El Problema}
\newcommand{\capitulo}[1]{
	\setlength{\leftskip}{0cm}
	\chapter{\uppercase{#1}}
	\continuarcapitulo
}

% Comando: capitulosinnumeracion
% Descripción: Crea un capitulo sin numeración.
% Uso: 
% \capitulo*{Anexos}
\newcommand{\capitulosinnumeracion}[1]{
	\setlength{\leftskip}{0cm}
	\chapter*{\uppercase{#1}}
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
	\setlength{\leftskip}{\parindent}
}

% Comando: subsubseccion
% Descripción: Crea una subsubsección.
% Uso: 
% \subsubseccion{Particle Swarm Optimization}
\newcommand{\subsubseccion}[1]{
	\setlength{\leftskip}{0cm}
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
	\setlength{\leftskip}{2\parindent}
}

% Comando: anexo
% Descripción: Prepara el documento para un anexo/
% Parámetros: [1] Título del anexo.
% Uso: 
% \anexo{Curriculum Vitae}
\newcommand{\anexo}[1]{
	\chapter{#1}
}
