%% Ikerkuntza operatiboa irakasgaiaren dokumentazioa prestatzeko formatua

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{ifirak}[2012/05/18 v0.1]

\LoadClassWithOptions{article}[2005/09/16]

\RequirePackage{graphicx}
\RequirePackage{color}

% DEFINICION DE LOS TAMAÑOS DE LA HOJA

\paperheight 297mm
\paperwidth  210mm
\setlength{\pdfpagewidth}{\paperwidth}
\setlength{\pdfpageheight}{\paperheight}
\textwidth 0.81\paperwidth   
\textheight 0.75\paperheight
\voffset -38mm
\hoffset -5mm
\topmargin 15mm
\oddsidemargin 0mm
\evensidemargin 0mm
\marginparwidth 30mm
\marginparsep 0mm
\headsep 25mm
\headheight 20mm
\@ifundefined{footheight}{\newdimen\footheight}{}% this is for LaTeX2e
\footheight 25mm               % Height of box containing running foot.
\@ifundefined{footsep}{\newdimen\footsep}{}% this is for LaTeX2e
\footsep 20mm               % Height of box containing running foot.

\@twosidefalse 
\@mparswitchfalse


% PACKAGE OPTION DEFINITIONS

\def\@campus{CAMPUS DE GUIPUZCOA}
\def\@campusa{GIPUZKOAKO CAMPUSA}

\DeclareOption{gipuzkoa}{}

\DeclareOption{bizkaia}
   {\def\@campus{CAMPUS DE VIZKAYA}
    \def\@campusa{BIZKAIKO CAMPUSA}}
\DeclareOption{araba}
   {\def\@campus{CAMPUS DE ALAVA}
    \def\@campusa{ARABAKO CAMPUSA}}
\DeclareOption{eu}
   {\renewcommand\abstractname{Laburpena} 
    \renewcommand\refname{Bibliografia}
    \renewcommand\figurename{Irudia}
    \renewcommand\tablename{Taula}
    \renewcommand\today{\number\year(e)ko\space\ifcase\month\or
    urtarrilak\or otsailak\or martxoak\or apirilak\or
    maiatzak\or ekainak\or uztailak\or abuztuak\or
    irailak\or urriak\or azaroak\or
    abenduak\fi~\number\day}
    \def\@theirakaslea{Irakaslea: }
    \def\@theikasturtea{Ikasturtea: }
    \def\@thetel{Telefonoa: }
    \def\@theeposta{E-posta: }}
\DeclareOption{es}
   {\renewcommand\abstractname{Resumen} 
    \renewcommand\refname{Bibliograf\'ia}
    \renewcommand\figurename{Figura}
    \renewcommand\tablename{Tabla}
    \renewcommand\today{{\number\day} de\space\ifcase\month\or
    Enero\or Febrero\or Marzo\or Abril\or
    Mayo\or Junio\or Julio\or Agosto\or
    Septiembre\or Noviembre\or Diciembre\or
    abenduak\fi~de {\number\year}}
    \def\@theirakaslea{Profesor(a): }
    \def\@theikasturtea{A\~no: }
    \def\@thetel{Tel\'efono: }
    \def\@theeposta{E-mail: }}
\DeclareOption{en}{
    \def\@theirakaslea{Lecturer: }
    \def\@theikasturtea{Year: }
    \def\@thetel{Telephone: }
    \def\@theeposta{E-mail: }}

\ProcessOptions

% COMMAND DEFINITIONS

\def\fakultatea#1{\gdef\@fakultatea{#1}}
\def\@fakultatea{informatika}

\def\irakasgaia#1{\gdef\@irakasgaia{#1}}
\def\@irakasgaia{Ikerketa Operatiboa}

\def\ikasturtea#1{\gdef\@ikasturtea{#1}}
\def\@ikasturtea{2011/2012}

\def\irakaslea#1{\gdef\@irakaslea{#1}}
\def\@irakaslea{Borja Calvo}

\def\tel#1{\gdef\@tel{#1}}
\def\@tel{943 01 5013}

\def\mail#1{\gdef\@mail{#1}}
\def\@mail{borja.calvo@ehu.es}

\def\addrs#1{\gdef\@addrs{#1}}
\def\@addrs{Paseo Manuel de Lardizabal, 1\\ 20018 Donostia (Gipuzkoa)}
\def\@helbidea{
     \begin{tabular}[b]{rrr@{}}
     \@campusa \\
     \textcolor[rgb]{0.3,0.3,0.3}{\@campus} \\
     \@addrs
    \end{tabular}
}

\def\@irakasgaiahead{
  \fontfamily{phv}\selectfont
  \begin{tabular}[b]{r}
  \@irakasgaia \\
  \textcolor[rgb]{0.3,0.3,0.3}{\@ikasturtea} \\
  \end{tabular}
}
\def\@irakasgaiatitle{
   \fontfamily{phv}\selectfont
   \begin{tabular}[b]{c}
   \@irakasgaia \\
   \textcolor[rgb]{0.3,0.3,0.3}{\@ikasturtea} \\
   \end{tabular}
}

% DEFINICION DE LOS DOS TIPOS DE ENCABEZADO / PIE (PRIMERA PAGINA Y SIGUIENTES)

\def\ps@iohead{
     \def\@oddhead{\parbox{\textwidth}{
     \hspace{-10mm}
     \includegraphics[width=45mm]{ehu}\hfill
     \@irakasgaiahead
     \hspace{-10mm}
     }}%
     \def\@oddfoot{{\parbox{\textwidth}{\centering \thepage}}}%
     \let\evenhead\@evenfoot
     \let\@evenfoot\@oddfoot
}

\def\ps@ioheadfirst{
     \def\@oddhead{}%
     \def\@oddfoot{{\parbox{\textwidth}{\scriptsize
      \fontfamily{phv}\selectfont
      \begin{tabular}[b]{ll}	
        \@theikasturtea & \@ikasturtea \\
        \@theirakaslea & \@irakaslea \\
        \@thetel & \@tel \\
        \@theeposta & \@mail \\
     \end{tabular}
     \hfill
     \@helbidea}}}%
     \let\evenhead\@evenfoot
     \let\@evenfoot\@oddfoot
}

%REDEFINICION DEL COMANDO maketitle PARA QUE NO SE CARGUE EL ESTILO DE LA PRIMERA PAGINA

\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{ioheadfirst}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

% CREACION DE LA PRIMERA PAGINA

\def\@maketitle{%
\enlargethispage{-10mm}
  \newpage
  \null
\vskip -30mm
\hspace{-16mm}
\begin{minipage}{1.12\textwidth}
\hrule
\vskip 2mm
\raisebox{-0.5\height}{\includegraphics[height=18mm,width=45mm,keepaspectratio=true]{ehu}}
\hfill
\raisebox{-0.5\height}{\Large\@irakasgaiatitle}
\hfill
\raisebox{-0.5\height}{\includegraphics[height=18mm,width=45mm,keepaspectratio=true]{\@fakultatea}}
\vskip 2mm
\hrule
\end{minipage}
\vskip 20mm%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em
}

\pagestyle{iohead}

%end of file isgreport.cls
