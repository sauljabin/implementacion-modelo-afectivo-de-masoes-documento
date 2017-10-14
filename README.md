# Trabajo de Grado

**Implementación de un Modelo Afectivo para la Arquitectura Multiagente para Sistemas Auto-Organizados y Emergentes (MASOES)**

## Descripción

Trabajo presentado en la Universidad Centroccidental "Lisandro Alvarado" para
optar al grado de Magister Scientiarum en Ciencias de la Computación Mención
Inteligencia Artificial. Barquisimeto, Venezuela.

* Autor: Ing. Saúl Jabín Piña Alvarado (<sauljabin@gmail.com>)
* Tutora: Dra. Niriaska Perozo Guédez (<nperozo@ucla.edu.ve>)
* Trabajo de Grado: https://bitbucket.org/sauljabin/trabajo-de-grado-ucla
* Implemención en JAVA: https://bitbucket.org/sauljabin/trabajo-de-grado-ucla-implementacion
* JADE: http://jade.tilab.com

## Resumen

La computación emocional es un área reciente de la inteligencia artificial que
tiene como objetivo mejorar los procesos interactivos entre agentes emocionales
y el ser humano, tanto en aplicaciones de software como de hardware. Debido a
las posibles aplicaciones en el área, actualmente la comunidad científica
realiza esfuerzos para aplicar las teorías existentes en sistemas multiagente.
Diferentes autores estudian modelos emocionales con el objetivo de mejorar la
interacción entre agentes inteligentes, un ejemplo es el modelo afectivo de
MASOES, aunque este modelo afectivo ha sido verificado formalmente a nivel de
diseño, no ha sido verificado a nivel de implementación. Frente a lo expuesto,
el presente trabajo propone una implementación del modelo afectivo de MASOES
sobre un sistema multiagente, con la finalidad de brindar un entorno para la
interacción entre los procesos emocionales y las diferentes funciones de un
agente. Adicionalmente, se propone el cálculo de la Emoción Social, permitiendo
describir el estado emocional colectivo de un grupo de agentes emocionales. Para
esto, se diseñó y desarrolló un sistema multiagente basado en el marco de
trabajo JADE, el cual utiliza el estándar FIPA que permite el desarrollo de
agentes universales. Posteriormente, se aplicó lo implementado sobre un caso de
estudio utilizando simulaciones para generar emociones a nivel individual y
colectivo, y se comparó los resultados a nivel de implementación con los
obtenidos por Perozo (2011) a nivel de diseño.


# Plantilla LaTeX Trabajo de Grado UCLA

## Descripción
Plantilla en LaTeX para elaborar trabajos de grado de la
Universidad Centroccidental Lisandro Alvarado (UCLA).
Barquisimeto, Venezuela.

* v3.4 [Saúl Piña (Año 2014-2017)](https://github.com/sauljabin/plantilla-latex-trabajo-de-grado-ucla)
* v2.0 [Miguel León (Año 2013)](https://code.google.com/p/uclamsc)
* v1.1 [Juan Rada y Rubén Parma (Año 2009)](https://code.google.com/p/latex-uclamsc)
* Licencia GPL 3.

## Normas
* [Manual para la Elaboración del Trabajo Conducente a Grado Académico de Especialización, Maestría y Doctorado](doc/Manual-Trabajo-Grado-2002.pdf)

## Instrucciones
* El código fuente de la plantilla de trabajo de grado se encuentra en el directorio **src/main**.
* El código de pruebas se encuentra en el directorio **src/test**.
* Los archivos pdf se generarán en el directorio **build**.
* Ejecutar ```make prueba``` para generar documento de prueba.
* Ejecutar ```make proyecto``` para generar proyecto.
* Ejecutar ```make trabajo``` para generar trabajo de grado.
* Ejecutar ```make docker-build``` para crear imagen de docker.
* Ejecutar ```make docker-prueba``` para generar documento de prueba con docker.
* Ejecutar ```make docker-proyecto``` para generar proyecto con docker.
* Ejecutar ```make docker-trabajo``` para generar trabajo de grado con docker.

## Cuerpo del Documento Principal

```TeX
\documentclass{uclamsc}
\includeonly{
	Capítulos a incluir en la compilación
}
\bibliografia{nombre del archivo principal}
Comandos de indentificación
Configuraciones especiales
\begin{document}
	Incluir glosario si se va a usar \input{}
	Incluir resumen \resumen{}
	Incluir abstract \abstract{}
	\begin{preliminares}
		Comandos de preliminares
	\end{preliminares}
	\begin{contenido}
		Comandos de contenido
	\end{contenido}
	\hacerbibliografia
	\begin{anexos}
		Comandos de anexos
	\end{anexos}
\end{document}
```

* Es necesario importar la clase `uclamsc` con el comando  `\documentclass{uclamsc}`.
* La opción `doblecara` (`\documentclass[doblecara]{uclamsc}`), formatea el documento para impresión en ambas caras de la hoja.

## Ambientes Principales
#### Preliminares
* `\hacercaratula`, crea la carátula exterior de la tesis.
* `\hacerpresentacion`, crea la hoja de presentación de la tesis.
* `\haceraprobacion`, crea la hoja de aprobación requerida para el trabajo final.
* `\preliminar{}`, para titular e indexar un capítulo de los preliminares.
* `\hacerindices`, crea todos los índices.
* `\hacerresumen`, crea la hoja con el resumen de la tesis.
* `\hacerabstract`, crea la hoja con el abstract de la tesis (opcional).

#### Contenido
* `\introduccion`, usado al principio de la introducción para indexar la misma y agregar la palabra “CAPÍTULO” al índice general.
* `\capitulo{}`, para titular e indexar un capítulo del contenido.
* Comandos `\seccion{}`, `\subseccion{}` y `\subsubseccion{}`, para agregar e indexar títulos de segundo, tercero y cuarto nivel.

#### Bibliografía
* `\hacerbibliografia{}`, crea la bibliografía y la agrega al índice general. Usado después del ambiente contenido y antes del ambiente anexos si este se incluye.

#### Anexos
* `\anexo{}`, para titular e indexar un anexo.

## Comandos de Identificación
#### Sobre el autor
* `\autor{}`, nombre del autor.
* `\ciautor{}`, cédula del autor.
* `\citarcomo{}`, apellido del autor.
* `\esautora`, permite incluir el género femenino: "Autora".

#### Sobre el trabajo
* `\titulo{}`, título de la investigación.
* `\title{}`, título del trabajo en inglés.
* `\palabrasclave{}`, palabras claves asociadas al trabajo de investigación.
* `\keywords{}`, palabras claves en inglés.
* `\grado{}`, permite personalizar el grado al que se desea optar.
* `\mencion{}`, permite personalizar la mención.

#### Sobre la universidad
* `\decanato{}`, decanato de la UCLA.
* `\postgrado{}`, postgrado cursado.

#### Sobre el tutor
* `\tutor{}`, nombre del tutor.
* `\citutor{}`, cédula del tutor.
* `\estutora`, permite incluir el género femenino: "Tutora".

#### Sobre la presentación
* `\ciudad{}`, ciudad de la presentación.
* `\diapresentacion{}`, día de la presentación.
* `\mespresentacion{}`, mes de la presentación.
* `\monthpresentacion{}`, mes de la presentación en inglés para el abstract.
* `\anopresentacion{}`, año de la presentación.
* `\primerjurado{}`, nombre del primer jurado.
* `\segundojurado{}`, nombre del segundo jurado.

## Configuraciones Especiales
* `\mesencaratula`, incluye el mes en las hojas de portada y presentación.
* `\tutorenpresentacion`, incluye el nombre del tutor en la presentación.
* `\setnombretrabajo{}`, define el nombre del trabajo, por defecto es: Trabajo de grado.
* `\esproyecto`, define el nombre del trabajo como: Proyecto de trabajo de grado.
* `\fechaenresumen`, incluye la fecha en las hojas de resumen y abstract.
* `\habilitarpendientes`, muestra los pendientes y el índice de pendientes.
* `\habilitarnotas`, muestra las anotaciones y el índice de anotaciones.
* `\setnombreilustracion{}{}`, Personaliza el nombre a mostrar en ilustraciones, primer parámetro singular, segundo plural, ejemplo: `\setnombreilustracion{Figura}{Figuras}`.
* `\setnombrecuadro{}{}`, Personaliza el nombre a mostrar en cuadros, primer parámetro singular, segundo plural, ejemplo: `\setnombrecuadro{Tabla}{Tablas}`.
* `\setnombrealgoritmo{}{}`, Personaliza el nombre a mostrar en algoritmos, primer parámetro singular, segundo plural, ejemplo: `\setnombrealgoritmo{Algoritmo}{Algoritmos}`.
* `\setnombregrafico{}{}`, Personaliza el nombre a mostrar en gráficos, primer parámetro singular, segundo plural, ejemplo: `\setnombregrafico{Grafico}{Gráficos}`.
* `\setnombrelistado{}{}`, Personaliza el nombre a mostrar en listados, primer parámetro singular, segundo plural, ejemplo: `\setnombrelistado{Listado}{Listados}`.
* `\numerarsecciones`, Cambia el formato de presentación de las secciones y les agrega numeración.

## Comandos Para Listas

Comandos originales: [LaTeX List Structures](https://en.wikibooks.org/wiki/LaTeX/List_Structures).

#### Enumeración
Ambiente `enumeracion`, permite crear una lista enumerada, uso:
```TeX
\begin{enumeracion}
	\item foo
	\item bar
	\item foobar
\end{enumeracion}
```

#### Viñetas
Ambiente `vinetas`, permite crear una lista no numerada, uso:
```TeX
\begin{vinetas}
	\item foo
	\item bar
	\item foobar
\end{vinetas}
```

#### Enumeración en parrafo
Ambiente `enumeracionenparrafo`, para enumerar dentro de un párrafo, uso:
```TeX
\begin{enumeracionenparrafo}
	\item uno
	\item dos
\end{enumeracionenparrafo}
```

## Ilustración
Ambiente `ilustracion` permite mostrar una ilustración, uso:
```TeX
\begin{ilustracion}[parametros]
	\includegraphics{ruta_archivo}
\end{ilustracion}
```

Lista de parámetros para el ambiente `ilustracion`:

Parámetro | Descripción | Ejemplo
--- | --- | ---
titulo | Asigna un título a la ilustración | titulo=Este es el título
etiqueta | Valor que permite hacer referencia a la ilustración | etiqueta=ilustracion1
fuente | Permite agregar la fuente | fuente=\cite{bib}
indice | Permite personalizar el índice  |indice=Índice personalizado
sinleyenda | Evita que se muestre el título | sinleyenda
sinindice | Evita que se muestre en el índice | sinindice

Referencia a una ilustración usando el comando `\refilustracion{etiqueta}` o `\refpilustracion{etiqueta}`.

## Gráfico
Ambiente `grafico` para mostrar un gráfico, uso:
```TeX
\begin{grafico}[parametros]
	\includegraphics{ruta_archivo}
\end{grafico}
```

Lista de parámetros para el ambiente `grafico`:

Parámetro | Descripción | Ejemplo
--- | --- | ---
titulo | Asigna un título al gráfico | titulo=Este es el título
etiqueta | Valor que permite hacer referencia al gráfico | etiqueta=grafico1
fuente | Permite agregar la fuente | fuente=\cite{bib}
indice | Permite personalizar el índice | indice=Índice personalizado
sinleyenda | Evita que se muestre el título | sinleyenda
sinindice | Evita que se muestre en el índice | sinindice

Referencia a un gráfico usando el comando `\refgrafico{etiqueta}` o `\refpgrafico{etiqueta}`.

## Cuadro
Ambiente `cuadro` para mostrar una tabla y agregarla al índice de cuadros, uso:
```TeX
\begin{cuadro}[parametros]{columnas}
	...
\end{cuadro}
```
Utilizar el comando `\fuentecuadro{# columnas en el cuadro}{fuente}` dentro del ambiente para agregar la fuente de donde se tomó el cuadro. Véase el uso del ambiente `tabular` o del paquete `ctable`.

Referencia rápida en [LaTeX/Tables](http://en.wikibooks.org/wiki/LaTeX/Tables).

Lista de parámetros para el ambiente `cuadro`:

Parámetro | Descripción | Ejemplo
--- | --- | ---
titulo | Asigna un título al cuadre | titulo=Este es el título
etiqueta | Valor que permite hacer referencia al cuadro | etiqueta=cuadro1
indice | Permite personalizar el índice | indice=Índice personalizado
sinleyenda | Evita que se muestre el título | sinleyenda
sinindice | Evita que se muestre en el índice | sinindice
letra | Estilo de letra a usar en el cuadro | letra=\tiny
columnas | Parámetro obligatorio, configura las columnas | lcc

Referencia a un cuadro usando el comando `\refcuadro{etiqueta}` o `\refpcuadro{etiqueta}`.

## Ecuación
Ambiente `ecuacion` para insertar una ecuación con etiqueta para hacerle referencia, uso:
```TeX
\begin{ecuacion}{etiqueta}
	y = x + 1
\end{ecuacion}
```

Ambiente `ecuaciones` para insertar una lista de ecuaciones numeradas, uso:
```TeX
\begin{ecuaciones}
	y = x + 1 \\
	z = x + 2
\end{ecuaciones}
```
Referencia a una ecuación usando el comando `\refecuacion{etiqueta}` o `\refpecuacion{etiqueta}`.

## Listado
Ambiente `listado` para insertar un listado, usado principalmente para códigos y algoritmos, en el parámetro puede indicarse un lenguaje ya soportado, uno definido por el usuario o nada, uso:
```TeX
\begin{listado}[parametros]{lenguaje}
	...
\end{listado}
```

Más información en [LaTeX/Listings](http://en.wikibooks.org/wiki/LaTeX/Source_Code_Listings).

Utilizar el comando `\letralistados[]` para restablecer la letra por defecto, utilizar con un parámetro opcional para cambiar el estilo de la letra.

Utilizar el comando `\lstdefinelanguage{}{}` ([listings](http://texdoc.net/texmf-dist/doc/latex/listings/listings.pdf)) y la clave `morekeywords` del paquete listings para definir un lenguaje personalizado. Véase la documentación.

Utilizar el comando `\definirliterales{}` para definir literales de reemplazo. Los parámetros tienen la forma `{match}{{reemplazo}}largo` y van separados solo por espacios. Véase la documentación. Ejemplo:
```TeX
\definirliterales{
	{:=}{{$\leftarrow$}}2
	{<<}{{$\langle$}}1 {>>}{{$\rangle$}}1
}
\begin{listado}[sinleyenda, sinindice]{}
	x := <<valor>>
\end{listado}
```

Lista de parámetros para el ambiente `listado`:

Parámetro | Descripción | Ejemplo
--- | --- | ---
titulo | Asigna un título al listado | titulo=Este es el título
etiqueta | Valor que permite hacer referencia al listado | etiqueta=listado1
fuente | Permite agregar la fuente | fuente=\cite{bib}
indice | Permite personalizar el índice | indice=Índice personalizado
sinleyenda | Evita que se muestre el título | sinleyenda
sinindice | Evita que se muestre en el índice | sinindice
lenguaje | Parámetro obligatorio, configura el lenguaje | [LaTeX]TeX

Referencia a un gráfico usando el comando `\reflistado{etiqueta}` o `\refplistado{etiqueta}`.

## Algoritmo
Ambiente algoritmo para escribir algoritmos en pseudocódigo. Los parámetros opcionales lo agregan al índice de algoritmos, uso:
```TeX
\begin{algoritmo}[parametros]
	...
\end{algoritmo}
```

Este ambiente usa el paquete [algorithm2e](http://en.wikibooks.org/wiki/LaTeX/Algorithms#Typesetting_using_the_algorithm2e_package).

Lista de parámetros para el ambiente `algoritmo`:

Parámetro | Descripción | Ejemplo
--- | --- | ---
titulo | Asigna un título al algoritmo | titulo=Este es el título
etiqueta | Valor que permite hacer referencia al algoritmo | etiqueta=algoritmo1
fuente | Permite agregar la fuente | fuente=\cite{bib}
indice | Permite personalizar el índice | indice=Índice personalizado
sinleyenda | Evita que se muestre el título | sinleyenda
sinindice | Evita que se muestre en el índice | sinindice

Referencia a un algoritmo usando el comando `\refalgoritmo{etiqueta}` o `\refpalgoritmo{etiqueta}`.

## Cita Textual
Ambiente `citatextual` prepara el contexto para una cita textual de más de 40 palabras, uso:
```TeX
\begin{citatextual}
	...Esto es una cita textual... (p. 199)
\end{citatextual}
```

## Secciones
Una sección se puede identificar con el comando `\label{valor}`, para hacer referencia a ella es necesario usar `\refseccion{etiqueta}` o `\refpseccion{etiqueta}`.

Es importante activar la numeración de secciones con `\numerarsecciones`, en la configuración del documento.

## Comandos de Referencia Bibliográfica
Para incluir las referencias, agregue al archivo **.bib** las descripciones de las mismas en formato **bibtex**. Normalmente las descripciones de libros y artículos conseguidos en Internet se ofrecen en este formato.

Para insertar referencias en el documento, utilice los comandos del paquete [natbib](http://www.ctan.org/pkg/natbib). Utilice `\citet{}` si el nombre del autor es parte de la narrativa, si no, utilice el comando `\citep{}`.

Para citar solo el autor en párrafos cercanos a la primera cita, el comando `\citeauthor{}`. Otros comandos son: `\citet*{}`, `\citep*{}`, `\citep[][]`, `\citeauthor*{}`,`\citeyear{}`. Referencia rápida en [LaTeX/Bibliography](https://en.wikibooks.org/wiki/LaTeX/Bibliography_Management), [BibTeX](https://verbosus.com/bibtex-style-examples.html), [Guía BibTeX](ftp://ftp.dante.de/ctan%3A/info/spanish/guia-bibtex/guia-bibtex.pdf).

Ejemplos:
```TeX
\citet{key}:                Jones et al. (1990)
\citet*{key}:               Jones, Baker, and Smith (1990)
\citep{key}:                (Jones et al., 1990)
\citep*{key}:               (Jones, Baker, and Smith, 1990)
\citep[chap. 2]{key}:       (Jones et al., 1990, chap. 2)
\citep[e.g.][]{key}:        (e.g. Jones et al., 1990)
\citep[e.g.][p. 32]{key}:   (e.g. Jones et al., p. 32)
\citeauthor{key}:           Jones et al.
\citeauthor*{key}:          Jones, Baker, and Smith
\citeyear{key}:             1990
\citepyear{key}:            (1990)
```
Para citar solo el título su puede usar el comando `\citetitle{}` y `\citeptitle{}`.

## Glosario
El comando `\hacerglosario` ajusta y titula (**Definición de Términos Básicos**) la sección de términos del glosario insertada por el comando `\printglossary`. Véase uso del paquete [glossaries](http://www.ctan.org/tex-archive/macros/latex/contrib/glossaries). Referencia rápida en [LaTeX/Glossary](http://en.wikibooks.org/wiki/LaTeX/Glossary).

El comando `\hacerglosarioconacronimos`, igual que `\hacerglosario` pero titulando la sección **Glosario de Acrónimos y Términos**, más apropiado para cuando se definen acrónimos en el glosario.

Para agregar un término al glosario se debe usar el comando `\agregartermino`, para referirse al término usar el comando `\gls{}` o `\glspl{}` para plurales. Los términos deben ser agregados en el archivo **capitulos/glosario**, y debe incluirse en el cuerpo del documento con el comando `\input{capitulos/glosario}`.

## Otros Comandos

#### Pendientes
* `\habilitarpendientes`, muestra los pendientes y el índice de pendientes, se coloca en configuraciones especiales.
* `\pendiente{}`, permite anotar un pendiente.

#### Notas
* `\habilitarnotas`, muestra las anotaciones y el índice de anotaciones, se coloca en configuraciones especiales.
* `\nota{}`, permite crear una anotación.

#### Espaciado
* `\espaciodoble`, deja espacio vertical de 12pt.
* `\espaciotriple`, deja espacio vertical de 22pt.
* `\tab{}`, deja espacio horizontal de #em.
* `\tabm`, deja un espacio horizontal en modo math.
* `\pagenblanco`, para insertar una página completamente en blanco (sin enumeración).

#### Otros
* `\yo`, muestra la referencia al autor del trabajo de grado. Para usar este comando previamente se debe asignar el apellido del autor con el comando `\citarcomo{}` en la sección de identificación.
* `\comillas{}`, coloca un texto entre comillas dobles.
* `\eningles{}`, coloca un texto entre comillas dobles, con paréntesis y en cursiva, ejemplo: (*"Java Agent Development Framework"*, en inglés).
* `\verb| |`, coloca un texto en formato de código fuente. Es una alternativa a los listados. También se puede usar `\codigoenlinea{}`.
* Referencia a los ambientes con etiquetas mediante el uso del comando `\ref{etiqueta}`, también sirve para mencionar secciones.
* `\R`, `\Rcuadrado` y `\Rcubo` permiten agregar el símbolo de los reales.
