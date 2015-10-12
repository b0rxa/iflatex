% Formato ISG para tesis doctorales
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{ifthesis}[2009/10/12 v0.2]

\LoadClassWithOptions{springerbook}[2006/10/31]

\RequirePackage{graphicx}
%New commands to define subtile, the department, the advisers and so on

\def\subtitle#1{\gdef\@subtitle{#1}}
\def\@subtitle{}

\def\department#1{\gdef\@department{#1}}
\def\@department{Department of Computer Science and Artificial Intelligence}
  
\def\departamento#1{\gdef\@departamento{#1}}
\def\@departamento{Departamento de Ciencias de la Computaci\'on e Inteligencia Artificial}

\def\saila#1{\gdef\@saila{#1}}
\def\@saila{Konputazio Zientziak eta Adimen Artifizialaren Saila}

\def\adviser#1{\gdef\@adviser{#1}}
\def\@adviser{}

\def\area#1{\gdef\@area{#1}}
\def\@area{Computer Science}

\def\place#1{\gdef\@place{#1}}
\def\@place{Donostia - San Sebasti\'an}

\setcounter{secnumdepth}{10}

\renewcommand{\theparagraph}{\Alph{paragraph}.}


% \caption command does not include the caption line in the 
% lof (list of figure file) nor in the lot (list of tables file)
% in addition to the \caption command use the following commands
\newcommand{\addtolof}[1]{\addcontentsline{lof}{figure}{\protect\numberline{\thefigure}#1}} 
\newcommand{\addtolot}[1]{\addcontentsline{lot}{table}{\protect\numberline{\thetable}#1}} 

%Definition of the title page

\def\maketitle{\par
 \begingroup
   \def\thefootnote{\fnsymbol{footnote}}%
   \def\@makefnmark{\hbox
       to\z@{$\m@th^{\@thefnmark}$\hss}}%
   \if@twocolumn
     \twocolumn[\@maketitle]%
     \else \newpage
     \global\@topnum\z@   % Prevents figures from going at top of page.
     \@maketitle \fi\thispagestyle{empty}\@thanks
     \par\penalty -\@M
 \endgroup
 \setcounter{footnote}{0}%
 \let\maketitle\relax
 \let\@maketitle\relax
 \gdef\@thanks{}\gdef\@author{}\gdef\@title{}\let\thanks\relax}

\def\@maketitle{\newpage
 \null
 %\vskip 2em                 % Vertical space above title.
\begingroup
  %\def\and{\unskip, }
  %\parindent=\z@
  %\pretolerance=10000
  %\rightskip=\z@ \@plus 3cm
  \vskip 1cm
\hspace{-1.5cm}
\begin{minipage}{1.12\textwidth}
\hrule
\vskip 2mm
\raisebox{-0.5\height}{\includegraphics[height=12mm,width=30mm,keepaspectratio=true]{ehu}}
\hfill
\raisebox{-0.5\height}{\includegraphics[height=12mm,width=30mm,keepaspectratio=true]{isg}}
\hfill
\raisebox{-0.5\height}{\includegraphics[height=12mm,width=30mm,keepaspectratio=true]{informatika}}
\vskip 2mm
\hrule
\end{minipage}

  \vskip 4em
  {\centering \normalsize \@saila \par}
  \vskip 0.5em
  {\centering \normalsize \@departamento \par}
  
  \vskip 3cm                % Vertical space after author.
  {\LARGE \centering \@title \par}%     % Title set in \Huge size.
  \vskip 1cm                % Vertical space after title.
  %\if!\@subtitle!\else
  % {\LARGE\ignorespaces\centering\@subtitle \par \vskip 1cm}
  %                 % Vertical space after subtitle.
  %\fi
  {\centering by \par}
  \vskip 1cm
  {\large  \centering                 % each author set in \LARGE   
   \@author
  \par}%
  \vskip 0.5cm
  {\small  \centering                 % each adviser set in \small   
   Supervised by \@adviser
  \par}
  
\vskip 3\p@          % Vertical space 
\vfill
{\small \centering Dissertation submitted to the \@department of the University of the Basque Country as partial fulfilment of the requirements for the PhD degree in \@area \par}
\vskip 1cm
 
\if!\@date!\else
    {\small \centering \@place, \@date \par}%          % Date set in \large size.
   
  %  .
  %\fi

\endgroup}

\def\ackname{Acknowledgement}%

\renewenvironment{acknowledgement}{
\chapter*{\ackname}
}

\def\abstractname{Summary}%

\renewenvironment{abstract}{
\chapter*{\abstractname}
}

\def\resumenname{Resumen}%

\newenvironment{resumen}{
\chapter*{\resumenname}
}

\def\laburpenaname{Laburpena}%

\newenvironment{laburpena}{
\chapter*{\laburpenaname}
}

%end of file isgthesis.cls
