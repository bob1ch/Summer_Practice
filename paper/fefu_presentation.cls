%%
%% This is file `fefu_presentation.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% fefu_presentation.dtx  (with options: `class')
%% 
%% IMPORTANT NOTICE:
%% 
%% For the copyright see the source file.
%% 
%% Any modified versions of this file must be renamed
%% with new filenames distinct from fefu_presentation.cls.
%% 
%% For distribution of the original source see the terms
%% for copying and modification in the file fefu_presentation.dtx.
%% 
%% This generated file may be distributed as long as the
%% original source files, as listed above, are part of the
%% same distribution. (The sources need not necessarily be
%% in the same archive or directory.)
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fefu_presentation}
    [2022/01/26 LaTeX presentation class for FEFU bachelor's thesis]
\newif\if@FEFUseenfontsize
\newif\if@FEFUnodefaultfont
\newif\if@FEFUdefaulttitlepage
\DeclareOption{8pt}{\@FEFUseenfontsizetrue\PassOptionsToClass{8pt}{beamer}}
\DeclareOption{9pt}{\@FEFUseenfontsizetrue\PassOptionsToClass{9pt}{beamer}}
\DeclareOption{10pt}{\@FEFUseenfontsizetrue\PassOptionsToClass{10pt}{beamer}}
\DeclareOption{11pt}{\@FEFUseenfontsizetrue\PassOptionsToClass{11pt}{beamer}}
\DeclareOption{12pt}{\@FEFUseenfontsizetrue\PassOptionsToClass{12pt}{beamer}}
\DeclareOption{14pt}{\@FEFUseenfontsizetrue\PassOptionsToClass{14pt}{beamer}}
\DeclareOption{17pt}{\@FEFUseenfontsizetrue\PassOptionsToClass{17pt}{beamer}}
\DeclareOption{20pt}{\@FEFUseenfontsizetrue\PassOptionsToClass{20pt}{beamer}}
\DeclareOption{nodefaultfont}{\@FEFUnodefaultfonttrue}
\DeclareOption{defaulttitlepage}{\@FEFUdefaulttitlepagetrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\if@FEFUseenfontsize\else\PassOptionsToClass{10pt, unicode}{beamer}\fi
\LoadClass{beamer}
\RequirePackage{fefu_base}
\setdefaultlanguage{russian}
\setotherlanguage{english}

\if@FEFUnodefaultfont
\else
\setsansfont{Fira Sans}
\newfontfamily\cyrillicfont{Fira Mono}
\renewcommand\UrlFont{\ttfamilylatin}
\fi
\usetheme[progressbar=frametitle,numbering=fraction]{metropolis}
\setlength{\metropolis@progressinheadfoot@linewidth}{2pt}
\newcommand{\enablenotes}[1][right]{
    \setbeamertemplate{note page}[plain]
    \setbeameroption{show notes on second screen=#1}
}
\if@FEFUdefaulttitlepage\else
\setbeamertemplate{subtitle}{
  \raggedright%
  \insertsubtitle%
  \par%
}
\fi
\if@FEFUdefaulttitlepage\else
\setbeamertemplate{author}{
  \vfill
  \@FEFUgendered{Судентка}{Студент}\ группы \@FEFUgroup\\
  \@FEFUschoolreferencetitle\ \@FEFUschool\ ДВФУ\\
  \insertauthor%
  \par%
  \vspace*{1em}
  Руководитель:\\
  \@FEFUsupervisortitle\\
  \@FEFUsupervisor%
  \par%
  \vspace*{1em}
}
\fi
\if@FEFUdefaulttitlepage\else
\subtitle{Магистерская диссертация}
\fi
\newcommand{\presentationtitlepage}{
    \frame{\thispagestyle{empty}\titlepage}
}
\setbeamersize{text margin left=3.5mm,text margin right=3.5mm}
\newcounter{@FEFUnfeatures}
\newcounter{@FEFUncomparates}
\newcounter{i@FEFUcomparisontable}
\newcounter{j@FEFUcomparisontable}

\newcommand{\feature}[3][2cm]{%
    \stepcounter{@FEFUnfeatures}%
    \edef\@FEFUfeaturen{\the@FEFUnfeatures}%

    \expandafter\def\csname @FEFUfeature@column@width\the@FEFUnfeatures\endcsname{#1}%
    \expandafter\def\csname @FEFUfeature@column@spec\the@FEFUnfeatures\endcsname{C}%
    \expandafter\edef\csname @FEFUfeature@#2\endcsname{\the@FEFUnfeatures}%
    \expandafter\def\csname @FEFUfeature@title@\the@FEFUnfeatures\endcsname{#3}%
    \expandafter\edef\csname @FEFUfeature@place@\the@FEFUnfeatures\endcsname{\csname @FEFUfeature@title@\the@FEFUnfeatures\endcsname}%
    \expandafter\def\csname @FEFUfeature@rotated@\the@FEFUnfeatures\endcsname{0}%

    \expandafter\providecommand\csname #2\endcsname{}%
    \expandafter\renewcommand\csname #2\endcsname[1][$+$]{%
        \expandafter\def\csname @FEFUcomparate@\the@FEFUncomparates @feature@\csname @FEFUfeature@#2\endcsname\endcsname{##1}%
    }
}

\newcommand{\featurecolumntype}[2]{%
    \expandafter\def\csname @FEFUfeature@column@spec\csname @FEFUfeature@#1\endcsname\endcsname{#2}%
}

\newcommand{\rotatefeature}[2][90]{%
    \expandafter\def\csname @FEFUfeature@rotated@\csname @FEFUfeature@#2\endcsname\endcsname{1}%
    \expandafter\protected\expandafter\def\csname @FEFUfeature@place@\csname @FEFUfeature@#2\endcsname\endcsname{%
        \rotatebox[origin=c]{#1}{\pbox{\csname @FEFUfeature@column@width\csname @FEFUfeature@#2\endcsname\endcsname}{\centering \csname @FEFUfeature@title@\csname @FEFUfeature@#2\endcsname\endcsname}}%
    }%
}

\newcommand{\comparate}[1]{
    \stepcounter{@FEFUncomparates}%

    \expandafter\def\csname @FEFUcomparate@title@\the@FEFUncomparates\endcsname{#1}%

    \setcounter{i@FEFUcomparisontable}{0}%
    \loop%
        \stepcounter{i@FEFUcomparisontable}%
        \expandafter\def\csname @FEFUcomparate@\the@FEFUncomparates @feature@\thei@FEFUcomparisontable\endcsname{$-$}%
    \ifnum\thei@FEFUcomparisontable<\the@FEFUnfeatures\repeat%
}

\def\@FEFUcomparisontable{0}
\newenvironment{fefucomparisontable}[1][C{2cm}]{%
    \ifnum\@FEFUcomparisontable=1%
        \ClassError{fefu_presentation}{fefucomparisontable cannot be nested}{fefucomparisontable cannot be nested}%
    \fi
    \def\@FEFUcomparisontable{1}
    \setcounter{@FEFUnfeatures}{0}
    \setcounter{@FEFUncomparates}{0}
    \def\@FEFUcolumnspec{|#1|}%
    }{%
    \def\@FEFUcomparisontableheader{}%
    \setcounter{i@FEFUcomparisontable}{0}%
    \loop%
        \stepcounter{i@FEFUcomparisontable}%
        \edef\@FEFUcolumnspec{\@FEFUcolumnspec%
            \expandafter\ifnum\csname @FEFUfeature@rotated@\thei@FEFUcomparisontable\endcsname=1 c\else%
            \csname @FEFUfeature@column@spec\thei@FEFUcomparisontable\endcsname{\csname @FEFUfeature@column@width\thei@FEFUcomparisontable\endcsname}\fi|}%
        \edef\@FEFUcomparisontableheader{\@FEFUcomparisontableheader&\csname @FEFUfeature@place@\thei@FEFUcomparisontable\endcsname}%
    \ifnum\thei@FEFUcomparisontable<\the@FEFUnfeatures\repeat%

    \setcounter{i@FEFUcomparisontable}{0}%
    \setcounter{j@FEFUcomparisontable}{\the@FEFUnfeatures}%
    \edef\@FEFUtrueindex{\the\numexpr\value{i@FEFUcomparisontable}+1\relax}%
    \let\@FEFUcomparisontablerow\undefined%
    \loop%
        \ifnum\thej@FEFUcomparisontable=\the@FEFUnfeatures%
            \ifdefined\@FEFUcomparisontablerow%
                \expandafter\edef\csname @FEFUcomparisontablerow@\@FEFUtrueindex\endcsname{\@FEFUcomparisontablerow}%
                \stepcounter{i@FEFUcomparisontable}%
                \edef\@FEFUtrueindex{\the\numexpr\value{i@FEFUcomparisontable}+1\relax}%
            \fi

            \ifnum\thei@FEFUcomparisontable<\the@FEFUncomparates
                \edef\@FEFUcomparisontablerow{\csname @FEFUcomparate@title@\@FEFUtrueindex\endcsname}%
            \fi
            \setcounter{j@FEFUcomparisontable}{0}%
        \else%
            \stepcounter{j@FEFUcomparisontable}%
            \edef\@FEFUcomparisontablerow{\@FEFUcomparisontablerow&\csname @FEFUcomparate@\@FEFUtrueindex @feature@\thej@FEFUcomparisontable\endcsname}%
        \fi%
    \ifnum\thei@FEFUcomparisontable<\the@FEFUncomparates\repeat%

    \setcounter{i@FEFUcomparisontable}{0}%
    \def\@FEFUcomparisontablerows{%
        \ifnumequal{\thei@FEFUcomparisontable}{\the@FEFUncomparates}{}{%
            \stepcounter{i@FEFUcomparisontable}%
            \csname @FEFUcomparisontablerow@\thei@FEFUcomparisontable\endcsname\\\hline%
            \@FEFUcomparisontablerows%
        }%
    }

    \begin{table}[h]
        \centering
        \begingroup\edef\@FEFUcomparisontablebegin{\endgroup\noexpand\begin{tabular}{\@FEFUcolumnspec}}\@FEFUcomparisontablebegin
            \hline
            \@FEFUcomparisontableheader\\
            \hline
            \@FEFUcomparisontablerows
        \end{tabular}
    \end{table}
    \def\@FEFUcomparisontable{0}
}
\endinput
%%
%% End of file `fefu_presentation.cls'.
