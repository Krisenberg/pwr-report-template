\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pwrReport}[2025/03/27 Customizable LaTeX Class for academic reports at PWR (WUST)]

% Option processing
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}

% Default option values
\SetupKeyvalOptions{family=report, prefix=report@}

% Customizable options
\DeclareStringOption[article]{basedocument}

% Pass remaining options to base class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\report@basedocument}}
\ProcessOptions\relax

% Load base document class
\LoadClass[a4paper]{\report@basedocument}

% Geometry and page setup
\RequirePackage[
    a4paper,
    top=4cm,
    left=2.5cm,
    right=2.5cm,
    bottom=2.5cm,
    headheight=3cm,
    headsep=1cm
]{geometry}

% Required packages
\RequirePackage[T1]{fontenc}
\RequirePackage[polish]{babel}
\RequirePackage{graphicx}
\RequirePackage[utf8]{inputenc}
\RequirePackage{hyperref}
\RequirePackage{multicol}
\RequirePackage{float}
\RequirePackage{pdfpages}
\RequirePackage{titlesec}
\RequirePackage{amsmath}
\RequirePackage{selinput}
\RequirePackage{ulem}
\RequirePackage{listings}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{enumitem}
\RequirePackage{makecell}
\RequirePackage{subfig}
\RequirePackage{diagbox}
\RequirePackage{needspace}
\RequirePackage{pgffor}
\RequirePackage{cite}
\RequirePackage{fancyhdr}
\RequirePackage{afterpage}
\RequirePackage{tabularx}
\RequirePackage{mathpazo}  % Used for a modern font look
\RequirePackage{lipsum}  % Used for inserting text placeholders

% Indent setup
\setlength\parindent{0.5cm}

% Control the line spacing in the document
\renewcommand{\baselinestretch}{1.1}

% Keywoards to specify the article: title, author, date, logo etc.
\def\titlePageLogoLeft#1{\gdef\@titlePageLogoLeft{#1}}
\def\@titlePageLogoLeft{\@latex@error{No \noexpand\titlePageLogoLeft given}\@ehc}

\def\titlePageLogoRight#1{\gdef\@titlePageLogoRight{#1}}
\def\@titlePageLogoRight{\@latex@error{No \noexpand\titlePageLogoRight given}\@ehc}

\def\courseName#1{\gdef\@courseName{#1}}
\def\@courseName{\@latex@error{No \noexpand\courseName given}\@ehc}

\def\title#1{\gdef\@title{#1}}
\def\@title{\@latex@error{No \noexpand\title given}\@ehc}

\def\courseNameAbbrev#1{\gdef\@courseNameAbbrev{#1}}

\def\titleAbbrev#1{\gdef\@titleAbbrev{#1}}

\def\author#1{\gdef\@author{#1}}
\def\@author{\@latex@error{No \noexpand\author given}\@ehc}

\def\tableOfContentsName#1{\gdef\@tableOfContentsName{#1}}
\def\@tableOfContentsName{\@latex@error{No \noexpand\tableOfContentsName given}\@ehc}

\def\referencesName#1{\gdef\@referencesName{#1}}
\def\@referencesName{\@latex@error{No \noexpand\referencesName given}\@ehc}

\def\figureName#1{\gdef\@figureName{#1}}
\def\@figureName{\@latex@error{No \noexpand\figureName given}\@ehc}

\def\tableName#1{\gdef\@tableName{#1}}
\def\@tableName{\@latex@error{No \noexpand\tableName given}\@ehc}

\addto\captionspolish{%
    \renewcommand{\contentsname}{\@tableOfContentsName}
    \renewcommand{\refname}{\@referencesName}
    \renewcommand{\figurename}{\@figureName}
    \renewcommand{\tablename}{\@tableName}
}

% Font setup (for writing in Polish)
\SelectInputMappings{
    cacute={ć},
    lslash={ł}
}

% Create commands that will return the appropriate title / course name version for the header (full or abbreviated)
\newcommand{\getTitleHeader}{%
  \@ifundefined{@titleAbbrev}{\@title}{\@titleAbbrev}%
}

\newcommand{\getCourseNameHeader}{%
  \@ifundefined{@courseNameAbbrev}{\@courseName}{\@courseNameAbbrev}%
}

\fancypagestyle{fancy}{
    \fancyhf{} % Clear everything
    \renewcommand{\headrule}{\vspace*{1mm}\hrule height 0.75pt} % Header line
    \fancyhead[L]{\getTitleHeader} % Title in header (on the left)
    \fancyhead[R]{\getCourseNameHeader} % Title in header (on the rigth)
    \fancyfoot[C]{\thepage} % Page number in footer (centered)
}
\pagestyle{fancy}


% Custom title page
\makeatletter
\renewcommand{\maketitle}{%
    \thispagestyle{empty}  % Do not use any page style on the title page

    % Insert logo images
    \begin{center}
        \makebox[\textwidth][s]{%
          \includegraphics[height=1.5cm]{\@titlePageLogoLeft}%
          \hfill%
          \includegraphics[height=1.5cm]{\@titlePageLogoRight}%
        }
    \end{center}

    \vspace{10ex}
    \begin{center}
        {\Huge \@title }\\[3ex]
        {\Large \@courseName }\\[12ex]
        {\Large  \@date}\\[12ex]
        {\Large  \@author}\\[25ex]
    \end{center}
}

% Custom colors
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}


\lstdefinelanguage{Kotlin}{
    comment=[l]{//},
    commentstyle={\color{gray}\ttfamily},
    emph={filter, first, firstOrNull, forEach, lazy, map, mapNotNull, println},
    emphstyle={\color{OrangeRed}},
    identifierstyle=\color{black},
    keywords={!in, !is, abstract, actual, annotation, as, as?, break, by, catch, class, companion, const, constructor, continue, crossinline, data, delegate, do, dynamic, else, enum, expect, external, false, field, file, final, finally, for, fun, get, if, import, in, infix, init, inline, inner, interface, internal, is, lateinit, noinline, null, object, open, operator, out, override, package, param, private, property, protected, public, receiveris, reified, return, return@, sealed, set, setparam, super, suspend, tailrec, this, throw, true, try, typealias, typeof, val, var, vararg, when, where, while},
    keywordstyle={\color{NavyBlue}\bfseries},
    morecomment=[s]{/*}{*/},
    morestring=[b]",
    morestring=[s]{"""*}{*"""},
    ndkeywords={@Deprecated, @JvmField, @JvmName, @JvmOverloads, @JvmStatic, @JvmSynthetic, Array, Byte, Double, Float, Int, Integer, Iterable, Long, Runnable, Short, String, Any, Unit, Nothing},
    ndkeywordstyle={\color{BurntOrange}\bfseries},
    sensitive=true,
    stringstyle={\color{ForestGreen}\ttfamily},
}

\newcommand{\code}[1]{
    \lstset{
        frame=tb,
        aboveskip=3mm,
        belowskip=3mm,
        showstringspaces=false,
        columns=flexible,
        basicstyle={\small\ttfamily},
        numbers=none,
        numberstyle=\tiny\color{gray},
        keywordstyle=\color{blue},
        commentstyle=\color{dkgreen},
        stringstyle=\color{mauve},
        breaklines=true,
        breakatwhitespace=true,
        tabsize=3,
        language=#1
    }
}

\endinput
