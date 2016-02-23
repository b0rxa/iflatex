%% Formato de ISG generico

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{isgcvanexos}[2009/11/16 v0.1]

\LoadClassWithOptions{book}[2005/09/16]

\RequirePackage{graphicx}
\RequirePackage{pdfpages}

% DEFINICION DE LOS TAMAÑOS DE LA HOJA

\paperheight 297mm
\paperwidth  210mm
\textwidth 180mm   
\textheight 245mm
\topmargin -15mm
\oddsidemargin -10.4mm
\evensidemargin -10.4mm
\marginparwidth 0mm
\marginparsep 0mm
\headsep 0mm
\headheight 5mm
\@ifundefined{footheight}{\newdimen\footheight}{}% this is for LaTeX2e
\footheight 5mm               % Height of box containing running foot.
\@ifundefined{footsep}{\newdimen\footsep}{}% this is for LaTeX2e
\footsep 0mm               % Height of box containing running foot.

% \@twosidefalse 
\@twosidetrue 
\@mparswitchfalse

% DEFINICION DE LOS COMANDOS PARA LA CREACION DEL PIE DE PAGINA DE LA PRIMERA PAGINA

\def\@nombreapartado{}

\def\nombre#1{\gdef\@nombre{#1}}
\def\@nombre{}

\def\dni#1{\gdef\@dni{#1}}
\def\@dni{}

\def\convocatoria#1{\gdef\@convocatoria{#1}}
\def\@convocatoria{}

\def\titulo#1{\gdef\@titulo{#1}}
\def\@titulo{Justificaci\'on de los m\'eritos alegados en el curriculum vitae}

\def\maketitle{\@maketitle \clearpage}

\def\@maketitle{
  \newpage
  \pagestyle{empty}
  \null
  \begingroup
  \vskip 7cm
  {\centering \scalebox{2}{\Huge Anexo} \par}
  \vskip 2em
  {\centering \huge \@titulo \par}
  \vfill
  {\Large\begin{tabular}{lll}
    {\bf NOMBRE} & \hspace{10mm} &\@nombre \\
    {\bf DNI} & &\@dni \\
    {\bf CONVOCATORIA} & &\@convocatoria \\
   \end{tabular}\par}
  \vskip 10mm
 
\endgroup}

\newcounter{isgapartadocounter}
\newcounter{isgcontenidocounter}[isgapartadocounter]

\newcommand\theapartado{\arabic{isgapartadocounter}}
\newcommand\thecontenido{\theapartado.\arabic{isgcontenidocounter}}

\setcounter{isgapartadocounter}{0}
\setcounter{isgcontenidocounter}{1}


\newcommand{\descripcion}[1]{\stepcounter{isgcontenidocounter} \addcontentsline{desc}{subsection}{\protect\numberline{\thecontenido}#1\vspace{3mm}}} 
\addtocontents{desc}{\protect\addvspace{10\p@}}%


\newcommand\contenidos{%
    \centering
    \chapter*{\centering LISTADO DE DOCUMENTOS}%
    \@starttoc{desc}
    \clearpage
    }

\newcommand{\apartado}[1]{
  \def\@nombreapartado{#1}
  \pagestyle{empty}
  \cleardoublepage\stepcounter{isgapartadocounter}~
  \addcontentsline{desc}{section}{\protect\numberline{\theapartado}#1\vspace{3mm}}
  %\pagestyle{empty}
  \begin{minipage}{0.8\textwidth}
    \vspace{90mm}
    \parbox{140mm}{\Huge \centering #1}
  \end{minipage}
  \cleardoublepage
  \pagestyle{isghead}}

% DEFINICION DE LAS OPCIONES GLOBALES DEL INCLUDEPDF
\includepdfset{pagecommand={\pagestyle{isghead}},noautoscale=true}

% comando para insertar pdfs con multiples hojas
% \insertarpdf[paginas-seleccionadas]{descipción para la tabla de contenidos}{path del fichero pdf}
% El parámetro paginas-seleccionadas es opcional, si no se indica inserta todas las páginas del pdf, si se quiere  seleccionar un subconjunt de páginas, la selección se puede hacer por una lista de páginas separadas por comas, o rangos de páginas (separados por giones). Si se quiere, se puede insertar páginas en blanco incluyendo {}.
% Ejemplos:
% 	/insertarpdf[1-3,7-last]{cita bibliográfica del primer articulo}{./articulo1.pdf}
%	 Inserta la pagías 1,2,3 y de la 7 hasta la última del fichero artículo1.pdf con la descripción dada
%	/insertarpdf[1,{},3]{cita bibliográfica del segundo articulo}{./articulo.pdf}
%	 Inserta las páginas 1 y 3 del fichero articulo2.pdf con su descripción dejando una página en blanco entre ellas

\newcommand{\insertarpdf}[3][1-last]{  
  \descripcion{#2}
  \includepdf[height=220mm, pages={#1}]{#3}
  
}


% DEFINICION DEL ENCABEZADO / PIE

\def\ps@isghead{
     \def\@oddhead{\parbox{\textwidth}{
     \hspace{0.5cm}
     \@nombreapartado
     \hfill
     \thepage
     \hspace{0.5cm}
     }}%
     \def\@evenhead{\parbox{\textwidth}{
     \hspace{0.5cm}          
     \thepage
      \hfill
     Justificaci\'on Meritos C.V. \@nombre~(\@dni)
     \hspace{0.5cm}
     }}%
}


\pagestyle{isghead}

%end of file isgcvanexos.cls