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

\definecolor{dark0_hard}{HTML}{1D2021}
\definecolor{dark0}{HTML}{282828}
\definecolor{dark0_soft}{HTML}{32302F}
\definecolor{dark1}{HTML}{3c3836}
\definecolor{dark2}{HTML}{504945}
\definecolor{dark3}{HTML}{665C54}
\definecolor{dark4}{HTML}{7C6F64}

\definecolor{gray_245}{HTML}{928374}
\definecolor{gray_244}{HTML}{928374}

\definecolor{light0_hard}{HTML}{F9F5D7}
\definecolor{light0}{HTML}{FBF1C7}
\definecolor{light0_soft}{HTML}{F2E5BC}
\definecolor{light1}{HTML}{EBDBB2}
\definecolor{light2}{HTML}{D5C4A1}
\definecolor{light3}{HTML}{BDAE93}
\definecolor{light4}{HTML}{A89984}

\definecolor{bright_red}{HTML}{FB4934}
\definecolor{bright_green}{HTML}{B8BB26}
\definecolor{bright_yellow}{HTML}{FABD2F}
\definecolor{bright_blue}{HTML}{83A598}
\definecolor{bright_purple}{HTML}{D3869B}
\definecolor{bright_aqua}{HTML}{8EC07C}
\definecolor{bright_orange}{HTML}{FE8019}

\definecolor{neutral_red}{HTML}{CC241D}
\definecolor{neutral_green}{HTML}{98971A}
\definecolor{neutral_yellow}{HTML}{D79921}
\definecolor{neutral_blue}{HTML}{458588}
\definecolor{neutral_purple}{HTML}{B16286}
\definecolor{neutral_aqua}{HTML}{689D6A}
\definecolor{neutral_orange}{HTML}{D65D0E}

\definecolor{faded_red}{HTML}{9D0006}
\definecolor{faded_green}{HTML}{79740E}
\definecolor{faded_yellow}{HTML}{B57614}
\definecolor{faded_blue}{HTML}{076678}
\definecolor{faded_purple}{HTML}{8F3F71}
\definecolor{faded_aqua}{HTML}{427B58}
\definecolor{faded_orange}{HTML}{AF3A03}

\color{light0}
\pagecolor{dark0}

%==============================================================================
% Configure hyperref
%==============================================================================

\hypersetup{
    colorlinks=true,
    linkcolor=gray_245,
    filecolor=gray_245,
    urlcolor=gray_245
}

%==============================================================================
% Configure titlesec
%==============================================================================

\titlespacing{\section}{0cm}{0cm}{0cm}
\titleformat{\section}{\Large\bfseries\color{bright_yellow}}{\thesection}{0cm}{}

%==============================================================================
% Configure titlesec
%==============================================================================

\titlespacing{\section}{0em}{0em}{0em}
\titleformat{\section}{\Large\bfseries\color{bright_yellow}}{\thesection}{0em}{}

%==============================================================================
% Commands
%==============================================================================

\newcommand*{\name}[1]{\def\@name{#1}}
\newcommand*{\position}[1]{\def\@position{#1}}
\newcommand*{\address}[1]{\def\@address{#1}}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}
\newcommand*{\github}[1]{\def\@github{#1}}
\newcommand{\cvsocials}{
    \ifthenelse
        {\isundefined{\@mobile}}
        {}
        {\href{tel:\@mobile}{\faMobile\space\@mobile}}
    \ifthenelse
        {\isundefined{\@email}}
        {}
        {\href{mailto:\@email}{\faEnvelope\space\@email}}
    \ifthenelse
        {\isundefined{\@github}}
        {}
        {\href{https://github.com/\@github}{\faGithub\space\@github}}
    \ifthenelse
        {\isundefined{\@linkedin}}
        {}
        {\href{https://linkedin.com/in/\@linkedin}{\faLinkedin\space\@linkedin}}
}
\newcommand{\makecvtitle}{
    \begin{center}
        {\Huge\bfseries\color{bright_yellow}\@name}\vspace{0.25em}\\
        {\large\color{light4}\@position}\vspace{0.25em}\\
        {\small\color{gray_245}\@address}\vspace{0.25em}\\
        {\small\cvsocials}
    \end{center}
}
\newcommand{\cventryi}[1]{
    \item[]
        {\color{gray_245}#1}
}
\newcommand{\cventryii}[2]{
    \item[]
        {\color{gray_245}#1}\hfill{\large\bfseries\color{gray_245}#2}
}
\newcommand{\cventryiv}[4]{
    \item[]
        {\large\bfseries\color{light4}#1}\hfill{\large\bfseries\color{gray_245}#2}\\
        {\color{gray_245}#3}\hfill{\color{gray_245}#4}
}
