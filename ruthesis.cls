%%% =========================================================================
%%% File Name: ruthesis.cls
%%% Last Modification Date: %G%     %U%
%%% Current Version: %M%    %I%
%%% File Creation Date: Tue Nov 21 11:09:28 1995
%%% Authors: Jan Erik Odegard  <odegard@ece.rice.edu>
%%%          Nick Vrvilo       <nick.vrvilo@alumni.rice.edu>
%%%
%%% Copyright: All software, documentation, and related files in this
%%%            distribution are Copyright (c) 1995-2017 Rice University
%%%
%%% =========================================================================
%%% This is a significant refactoring of Dr. Odegard's 1995 port
%%% of this thesis template to LaTeX2e. This new version uses more
%%% modern LaTeX features and packages. Dr. Odegard, who currently works
%%% in the Ken Kennedy Institute at Rice, has given explicit permission
%%% to redistribute these changes to his version of the template,
%%% We hope this updated template will be useful to future Rice students!
%%%
%%% =========================================================================
%%%
%%% This is a port of the original Rice thesis style for LaTeX to
%%% LaTeX2e. The port is still not complete but it does work with a
%%% few minor hacks in your actual documant (e.g., the linespacing for
%%% tables is not right but can be fixed by inserting the command
%%% '\linespacing{1}' inside the 'table' environemnt as nedded for
%%% tabular data).
%%%
%%% This is not a clean and optimal LaTeX2e class port yet. I am working
%%% on that but this class file has been used for a PhD thesis that did
%%% pass a preliminary inspection by the graduate office.
%%%
%%% I would appreciate any help/comments and improvements. The goal is
%%% to make this an official Rice thesis style for LaTeX2e that can
%%% exist in parallel with the old LaTeX thesis style.
%%%
%%\NeedsTeXFormat{LaTeX2e}[1994/12/01]
\ProvidesClass{ruthesis}[2017/05/15 Thesis Class, Computer Science, Rice University, nv4]

\newif\if@ruthesis
\@ruthesistrue

%\DeclareOption{12pt}{\typeout{12pt mode selected but not implemented}}

\DeclareOption{draft}{
  \typeout{DRAFT MODE}
  \PassOptionsToClass{\CurrentOption}{report}
}

\newif\ifruthesis@proposal \ruthesis@proposalfalse
\DeclareOption{proposal}{\ruthesis@proposaltrue}

\newif\ifruthesis@masters \ruthesis@mastersfalse
\DeclareOption{masters}{\ruthesis@masterstrue}

\DeclareOption{twoside}{
  \PassOptionsToClass{\CurrentOption}{report}
}
\DeclareOption{openright}{
  \PassOptionsToClass{\CurrentOption}{report}
}

\ProcessOptions

\LoadClass[12pt]{report}
\RequirePackage{graphicx}

%%% \def\ds@draft{\@drafttrue\overfullrule5pt}
%%% \def\ps@hightop{\let\@mkboth\@gobbletwo
%%%   \def\@oddhead{\hfill\vbox to0pt{\vskip-.4in\hbox{\thepage}\vss}\hfill}
%%%   \def\@oddfoot{}}
%%% \def\now{%
%%%   {\count255=\time\divide\count255 by60
%%%     \ifnum\count255<10 0\fi\number\count255:\multiply\count255 by60
%%%     \advance\count255 by-\time\ifnum\count255>-10 0\fi\number -\count255}}
%%% \def\ps@draft{%
%%%   \ps@hightop\def\@oddhead{{\normalsize\today,\
%%%       {\small\bf DRAFT},\ \now\hfil\thepage}}}
%%% \if@draft\ps@draft\raggedbottom\typeout{DRAFT MODE}\else\ps@empty\fi


%%% Do we need this?
%\renewcommand{\normalsize}{\fontsize{12}{15}\selectfont}

%\lineskip 1pt
%\normallineskip 1pt
% TODO - use setspace instead?
\def\baselinestretch{1.5}

\if@twoside
 \oddsidemargin 21pt
 \evensidemargin 59pt
 \marginparwidth 85pt
\else
 \oddsidemargin .5in
 \evensidemargin 0in
 \marginparwidth .8in
\fi
\marginparsep .1in

%\advance\oddsidemargin -.0625in \advance\evensidemargin -.0625in

\topmargin 0in

\headheight \baselineskip
\headsep 1.5\baselineskip

%%My fix for the bottom-center page numbering - Psycho.

%\footheight \baselineskip
%\footskip 2.5\baselineskip

\textheight 9in
\advance\textheight -\headheight
\advance\textheight -\headsep
\textwidth 6in

\columnsep 10pt
\columnseprule 0pt

\footnotesep 11.4pt

\skip\footins 18pt plus 12pt minus 6pt

\floatsep 24pt plus 6pt minus 6pt

\textfloatsep 36pt plus 10pt minus 10pt

\intextsep 24pt plus 6pt minus 6pt

\def\@pnumwidth{1.55em}
\def\@tocrmarg {2.55em plus 1fil}
\def\@dotsep{4.5}
\setcounter{tocdepth}{2}

\def\tableofcontents{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \fi%
 \providecommand\pdfbookmark[2]{}% if hyperref is not loaded
 \pdfbookmark{\contentsname}{toc}%
 \chapter*{Contents\@mkboth{CONTENTS}{CONTENTS}} \thispagestyle{empty}
 \@starttoc{toc}\if@restonecol\twocolumn\fi}

\def\l@part#1#2{\addpenalty{-\@highpenalty}
 \addvspace{2.25em plus 1pt}
 \begingroup
 \@tempdima 3em
 \parindent \z@ \rightskip \@pnumwidth
 \parfillskip -\@pnumwidth
 {\large \bf
 \leavevmode
 #1\hfil \hbox to\@pnumwidth{\hss #2}}\par
 \nobreak
 \endgroup}

\def\l@chapter#1#2{\pagebreak[3]
 \vskip 1.0em plus 1pt
 \@tempdima 1.5em
 \begingroup
 \parindent \z@ \rightskip \@pnumwidth
 \parfillskip -\@pnumwidth
 \parskip \z@
 \large \bf
 \leavevmode
 \advance\leftskip\@tempdima
 \hskip -\leftskip
 #1\nobreak\hfil \nobreak\hbox to\@pnumwidth{\hss #2}\par
 \endgroup}

% provide list of code listings based on report.cls definition of listoffigures
\newcommand{\listcodename}{List of Code Listings}
\newcommand{\listofcode}{%
  \begingroup%
  \let\old@starttoc\@starttoc%
  \renewcommand{\@starttoc}[1]{\old@starttoc{lol}}%
  \renewcommand{\listfigurename}{\listcodename}%
  \listoffigures%
  \endgroup%
}

\def\l@frontmatter#1#2{\pagebreak[3]
 \@tempdima 1.5em \begingroup
 \parindent \z@ \rightskip \@pnumwidth
 \parfillskip -\@pnumwidth
 \leavevmode #1\hfil \hbox to\@pnumwidth{\hss #2}\par
 \endgroup}

\def\titlepage{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \else \newpage \fi \thispagestyle{empty}\c@page\z@}

\def\endtitlepage{\if@restonecol\twocolumn \else \newpage \fi}

\def\makecover{%
\pagenumbering{gobble}%
\begin{titlepage}
  \null\linespacing{1}\setcounter{page}{1}\vfill
  \vbox to 0pt{\vss\vbox to 8.75in{\parskip 0pt \parindent 0pt
      \begin{center}
      {\includegraphics[height=1.6in]{logos/rice-owl.png} \par}
      \vskip 8pt
      {\includegraphics[width=4.4in]{logos/rice-university.png} \par}
      \vskip 16pt
      \rule{\textwidth}{2mm}
      \vskip 3pt
      {\Huge \textsc{\textbf{\@ctitle}} \par}
      \vskip 6pt
      \rule{\textwidth}{2mm}
      \vskip 12pt
      {\large Thesis by \par}
      {\Large \bf \@author \par}
      \vfill
      \end{center}
      \begin{minipage}{\textwidth}
        \begin{minipage}{0.3\textwidth}
          \centering
          \includegraphics[width=1.5in]{logos/rice-logo-small.jpg}
        \end{minipage}%
        \begin{minipage}{0.7\textwidth}
        {Thesis for the Degree of \@degree \par}
        {Department of \@department \par}
        {\@school\ (\@address)\: \@month, \@year \par}
        \end{minipage}
    \end{minipage}}}
    \cleardoublepage
\end{titlepage}}

\def\maketitle{%
\pagenumbering{roman}%
\def\sigline{%
\ifruthesis@proposal
  % no signature lines for proposal
\else
  \moveright\leftskip \vbox{\hrule width \leftskip}%
\fi}%
\begin{titlepage}
  \null\linespacing{1}\setcounter{page}{1}\vfill
  \vbox to 0pt{\vss\vbox to 8.75in{\parskip 0pt \parindent 0pt\centering
      {\large \uppercase\expandafter{\@school} \par} \vskip 0pt plus 3fil
      {\Large \bf \@title \par} \vskip 0pt plus 1.3fil
      {\large by \par} \vskip 0pt plus 1fil
      {\large \bf \@author \par}
      \ifruthesis@proposal
        \vskip 0pt plus 1.3fil
        {\large A {\@degreeabbr} Thesis Proposal \par}
        \vskip 0pt plus 4.5fil
      \else
        \vskip 0pt plus 3fil
        {\large \sc A Thesis Submitted \\
          in Partial Fulfillment of the \\
          Requirements for the Degree \par}
        \vskip 0pt plus 1.1fil
        {\large \bf \@degree \par} \vskip 0pt plus 4.5fil
      \fi
      \begingroup
      \leftskip .5\textwidth \rightskip 0pt plus 1fil
      {\sc \ifruthesis@proposal{}\else{Approved, }\fi Thesis Committee: \par}
      \vskip 2.5em
      \sigline
      \def\and{\par \vskip 2.25em minus 1em\sigline}
      \@committee \par
      \endgroup \vskip 0pt plus 2fil
      {\large \@address \par} \vskip 0pt plus .8fil
      {\large \@month, \@year \par}}}\cleardoublepage
\end{titlepage}}

\newif\if@bigcommittee \@bigcommitteefalse

\def\school#1{\gdef\@school{#1}}
\def\ctitle#1{\gdef\@ctitle{#1}}
\def\department#1{\gdef\@department{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\committee#1{\gdef\@committee{#1}}
\def\bigcommittee#1{\@bigcommitteetrue\gdef\@committee{#1}}
\def\address#1{\gdef\@address{#1}}
\def\donemonth#1{\gdef\@month{#1}}
\def\doneyear#1{\gdef\@year{#1}}

\def\@school{Rice University}
\def\@ctitle#1{\@title}
\def\@department{Computer Science}
\def\@degree{\ifruthesis@masters{Master of Science}\else{Doctor of Philosophy}\fi}
\def\@degreeabbr{\ifruthesis@masters{Master's}\else{PhD}\fi}
\def\@committee{member 1, Chair \\ prof \and
 member 2 \\ prof \and member 3 \\ prof}
\def\@address{Houston, Texas}
\def\@month{\ifcase\month ?\or January\or February\or March\or April\or
 May\or June\or July\or August\or September\or October\or
 November\or December\fi}
\def\@year{\number\year}

\def\dedication{\cleardoublepage \thispagestyle{empty}%
\vspace*{12em}\begin{center}\begin{minipage}{0.33\textwidth}\centering\itshape }

\def\enddedication{\end{minipage}\end{center} \clearpage }

\def\abstract{\cleardoublepage \pagestyle{empty} \global\@topnum\z@
 \@afterindentfalse \begingroup
 \def \baselinestretch{1.7} \parskip \z@ \parindent \z@ \par
 \providecommand\pdfbookmark[2]{}% if hyperref is not loaded
 \pdfbookmark{Abstract}{abstract}%
 \providecommand\phantomsection{}% if hyperref is not loaded
 \phantomsection
 \null \centering {{\center{ABSTRACT}}} \vskip .4in
 \@title \vskip .4in  by \vskip .4in \@author \vskip .4in \par
 \endgroup
 \setcounter{footnote}{0}\def\thefootnote{\arabic{footnote}}}

\def\endabstract{\setcounter{footnote}{0}
  \pagestyle{plain}\thispagestyle{empty}}

\def\acknowledge{%
 \providecommand\pdfbookmark[2]{}% if hyperref is not loaded
 \pdfbookmark{Acknowledgments}{acknowledgments}%
 \chapter*{Acknowledgments}\thispagestyle{empty}
 \setcounter{footnote}{0}}

\def\endacknowledge{\setcounter{footnote}{0}}

\def\preface{\chapter*{Preface} \thispagestyle{empty}
 \setcounter{footnote}{0}}

\def\endpreface{\setcounter{footnote}{0}}

\def\frontmatter{\relax}
\def\endfrontmatter{\cleardoublepage
  \pagenumbering{arabic}%
  \def\thefootnote{\arabic{footnote}}}
\def\toclevel@frontmatter{0}

\def\linespacing#1{\def\baselinestretch{#1} \let\@tempa\@currsize
 \let\@currsize\relax \@tempa}

\def\@makechapterhead#1{\begingroup
 \def \baselinestretch{1} \parskip \z@ \parindent \z@ \par
 \Large\bf \null \vskip 1.5ex \centering
 \ifnum \c@secnumdepth >\m@ne \@chapapp~\thechapter \vskip 3.5ex \fi
 #1 \vskip 3ex plus .2ex\endgroup}

\def\@makeschapterhead#1{\begingroup
 \def \baselinestretch{1} \parskip \z@ \parindent \z@ \par
 \null \vskip .3in \centering
 \Large \bf #1\par \endgroup \nobreak \vskip .6in\relax}

\def\chapter{\cleardoublepage
 \thispagestyle{plain}
 \global\@topnum\z@
 \@afterindentfalse
 \secdef\@chapter\@schapter}

\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
 \refstepcounter{chapter}
 \typeout{\@chapapp\space\thechapter.}
 \addcontentsline{toc}{chapter}{\protect
 \numberline{\thechapter}#1}\else
 \addcontentsline{toc}{chapter}{#1}\fi
 \chaptermark{#1}
 \addtocontents{lof}{\protect\addvspace{\baselineskip}}
 \addtocontents{lot}{\protect\addvspace{\baselineskip}}
 \if@twocolumn
 \@topnewpage[\@makechapterhead{#2}]
 \else \@makechapterhead{#2}
 \@afterheading
 \fi}

\def\@schapter#1{\if@twocolumn \@topnewpage[\@makeschapterhead{#1}]
 \else \@makeschapterhead{#1}
 \@afterheading\fi}

\def\section{\@startsection{section}{1}{\z@}{-3.25ex plus -1ex minus
 -.2ex}{1.5ex plus .2ex}{\large\bf}}
\def\subsection{\@startsection{subsection}{2}{\z@}{-3.25ex plus -1ex minus
 -.2ex}{1.5ex plus .2ex}{\normalsize\bf}}
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{-3.25ex plus
 -1ex minus -.2ex}{1.5ex plus .2ex}{\normalsize\bf}}
\def\paragraph{\@startsection
 {paragraph}{4}{\z@}{3.25ex plus 1ex minus .2ex}{-1em}{\normalsize\bf}}
\def\subparagraph{\@startsection
 {subparagraph}{4}{\parindent}{3.25ex plus 1ex minus
 .2ex}{-1em}{\normalsize\bf}}

\def\chaptermark#1{}

\setcounter{secnumdepth}{2}

\def\appendix{\par
 \setcounter{chapter}{0}
 \setcounter{section}{0}
 \def\@chapapp{Appendix}
 \def\thechapter{\Alph{chapter}}}

\if@twoside
\def\ps@headings{%
  \let\@mkboth\markboth
  \def\@oddfoot{}
  \def\@evenfoot{}
  \def\@evenhead{\rm \thepage\hfil \sl \leftmark}
  \def\@oddhead{\hbox{}\sl \rightmark \hfil \rm\thepage}
  \def\chaptermark##1{\markboth {\uppercase{\ifnum \c@secnumdepth >\m@ne
        \@chapapp\ \thechapter. \ \fi ##1}}{}}
  \def\sectionmark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\z@
        \thesection. \ \fi ##1}}}}
\else
\def\ps@headings{%
  \let\@mkboth\markboth
  \def\@oddfoot{}\def\@evenfoot{}
  \def\@oddhead{\hbox {}\hfil \rm\thepage}
  \def\chaptermark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\m@ne
        \@chapapp\ \thechapter. \ \fi ##1}}}}
\fi

\def\ps@myheadings{\let\@mkboth\@gobbletwo
\def\@oddhead{\hbox{}\sl\rightmark \hfil \rm\thepage}
\def\@oddfoot{}\def\@evenhead{\rm \thepage\hfil\sl\leftmark\hbox {}}
\def\@evenfoot{}\def\chaptermark##1{}\def\sectionmark##1{}
\def\subsectionmark##1{}}

\ps@headings
\onecolumn
\if@twoside\else\raggedbottom\fi

\pagenumbering{roman}
\def\thefootnote{\arabic{footnote}}

%
% Put all page numbers in the upper-right.
% Graduate Studies thinks that the page number at the bottom-center
% is too close to the bottom of the page.
%
\let\ps@plain\ps@headings

