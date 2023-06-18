\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CurriculumVitae}[2022/05/20 Curriculum Vitae Class]
\LoadClass[11pt]{article}

\renewcommand\thesection{}

%==============================================================================
% Packages
%==============================================================================

\usepackage{fontawesome5}
\usepackage{polyglossia}
\usepackage{blindtext}
\usepackage{fontspec}
\usepackage{hyperref}
\usepackage{enumitem}
\usepackage{parskip}
\usepackage{xcolor}
\usepackage{ifthen}
\usepackage{xparse}
\usepackage{titlesec}

%==============================================================================
% Configure polyglossia
%==============================================================================

\setdefaultlanguage{english}
\setmainlanguage{english}
\setotherlanguages{greek}

%==============================================================================
% Configure fontspec
%==============================================================================

\defaultfontfeatures{Ligatures=TeX}
\setmainfont{Roboto}
\setsansfont{Roboto}
\setmonofont{Roboto Mono}

%==============================================================================
% Configure xcolor
%==============================================================================

\colorlet{cvprimarycolor}{black}
\colorlet{cvsecondarycolor}{white}
\colorlet{cvaccentcolor}{brown}

\colorlet{cvcolor}{cvprimarycolor}
\colorlet{cvpagecolor}{cvsecondarycolor}

\colorlet{cvlinkcolor}{cvprimarycolor}
\colorlet{cvfilecolor}{cvprimarycolor}
\colorlet{cvurlcolor}{cvprimarycolor}

\colorlet{cvnamecolor}{cvaccentcolor}
\colorlet{cvtitlecolor}{cvprimarycolor}
\colorlet{cvsectioncolor}{cvaccentcolor}
\colorlet{cvaddresscolor}{cvprimarycolor}

\color{cvcolor}
\pagecolor{cvpagecolor}

%==============================================================================
% Configure hyperref
%==============================================================================

\hypersetup{
    colorlinks=true,
    linkcolor=cvlinkcolor,
    filecolor=cvfilecolor,
    urlcolor=cvurlcolor
}

%==============================================================================
% Configure titlesec
%==============================================================================

\titlespacing{\section}{0cm}{0.25cm}{0.25cm}
\titleformat{\section}{\Large\bfseries\color{cvsectioncolor}}{\thesection}{0cm}{}

%==============================================================================
% Configure enumitem
%==============================================================================

\setlist{topsep=0em, leftmargin=0em}
\setitemize{noitemsep,topsep=0.25em, parsep=0.25em, partopsep=0em}

%==============================================================================
% Commands 1
%==============================================================================

\newcommand*{\namestyle}[1]{{\Huge\bfseries\color{cvnamecolor}#1}\vspace{0.25em}\\}
\newcommand*{\titlestyle}[1]{{\large\color{cvtitlecolor}#1}\vspace{0.25em}\\}
\newcommand*{\addressstyle}[1]{{\small\color{cvaddresscolor}#1}\vspace{0.25em}\\}

\newcommand*{\mobilestyle}[1]{{\href{tel:#1}{\faMobile\space#1}}}
\newcommand*{\emailstyle}[1]{{\href{mailto:#1}{\faEnvelope\space#1}}}
\newcommand*{\linkedinstyle}[1]{{\href{https://linkedin.com/in/#1}{\faLinkedin\space#1}}}
\newcommand*{\githubstyle}[1]{{\href{https://github.com/#1}{\faGithub\space#1}}}

\newcommand*{\cvsocialsstyle}[1]{{\small#1}}

\newcommand*{\cvitemstyle}[1]{{#1}}
\newcommand*{\cvdoubleitemstyle}[2]{{#1}\hfill{\large\bfseries#2}}
\newcommand*{\cventrystyle}[4]{{\large\bfseries#1}\hfill{\large\bfseries#2}\\{#3}\hfill{#4}}

%==============================================================================
% Commands 2
%==============================================================================

\newcommand*{\name}[1]{\def\@name{#1}}
\newcommand*{\position}[1]{\def\@position{#1}}
\newcommand*{\address}[1]{\def\@address{#1}}

\newcommand*{\mobile}[1]{\def\@mobile{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}
\newcommand*{\github}[1]{\def\@github{#1}}

\newcommand{\cvsocials}{
    \ifthenelse{\isundefined{\@mobile}}{}{\mobilestyle{\@mobile}}
    \ifthenelse{\isundefined{\@email}}{}{\emailstyle{\@email}}
    \ifthenelse{\isundefined{\@linkedin}}{}{\linkedinstyle{\@linkedin}}
    \ifthenelse{\isundefined{\@github}}{}{\githubstyle{\@github}}
}

\newcommand{\makecvtitle}{
    \begin{center}
        \ifthenelse{\isundefined{\@name}}{}{\namestyle{\@name}}
        \ifthenelse{\isundefined{\@title}}{}{\titlestyle{\@title}}
        \ifthenelse{\isundefined{\@address}}{}{\addressstyle{\@address}}
        \cvsocialsstyle{\cvsocials}
    \end{center}
}

\newcommand{\cvitem}[1]{\item[]{\cvitemstyle{#1}}}
\newcommand{\cvdoubleitem}[2]{\item[]{\cvdoubleitemstyle{#1}{#2}}}
\newcommand{\cventry}[4]{\item[]{\cventrystyle{#1}{#2}{#3}{#4}}}
