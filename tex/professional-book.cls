%% professional-book.cls
%% Zine-style technical book class: O'Reilly trim and hierarchy, pared down.
%%   - Source Serif 4 body, Source Sans 3 headings, Source Code Pro code
%%   - ragged right, no paragraph indent, space between paragraphs
%%   - one accent color; tinted code panels and left-bar callouts
%% All fonts and packages ship with TeX Live.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{professional-book}[2026/10/16 Zine-style technical book class]

\LoadClass[11pt,openany]{book}

\RequirePackage{fontspec}
\RequirePackage[paperwidth=7in,paperheight=9.25in,
    top=0.85in,bottom=0.9in,inner=0.9in,outer=0.8in,
    headheight=14pt,headsep=0.3in,footskip=0.45in]{geometry}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{fancyvrb}
\RequirePackage{caption}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{tikz}
\RequirePackage{eso-pic}
\RequirePackage{enumitem}
\RequirePackage{titlesec}
\RequirePackage{ragged2e}
\RequirePackage{microtype}
\RequirePackage{hyperref}

\makeatletter
\def\input@path{{./}}
\makeatother
\RequirePackage{isof-colors}
\RequirePackage{isof-code}
\RequirePackage{isof-boxes}

% ============================================
% Fonts
% ============================================
\setmainfont{SourceSerif4}[
    Extension=.otf, UprightFont=*-Regular, ItalicFont=*-RegularIt,
    BoldFont=*-Semibold, BoldItalicFont=*-SemiboldIt, Ligatures=TeX]
\setsansfont{SourceSans3}[
    Extension=.otf, UprightFont=*-Regular, ItalicFont=*-RegularIt,
    BoldFont=*-Bold, BoldItalicFont=*-BoldIt, Ligatures=TeX]
\setmonofont{SourceCodePro}[
    Extension=.otf, UprightFont=*-Regular, ItalicFont=*-RegularIt,
    BoldFont=*-Semibold, BoldItalicFont=*-SemiboldIt, Scale=0.88]
\newfontfamily\displayfont{SourceSans3}[
    Extension=.otf, UprightFont=*-Black, BoldFont=*-Black]

% ============================================
% Body text
% ============================================
\linespread{1.18}
\color{ink}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0.65\baselineskip plus 2pt minus 1pt}
% Ragged right with light hyphenation: even word spacing reads easier
\setlength{\RaggedRightParindent}{0pt}
\setlength{\RaggedRightRightskip}{0pt plus 4em}
\AtBeginDocument{\RaggedRight}
\setlength{\emergencystretch}{2em}
\hyphenpenalty=5000
\exhyphenpenalty=50
\clubpenalty=10000
\widowpenalty=10000

% Lists: tighter than the parskip, accent bullets
\setlist{itemsep=3pt, parsep=0pt, topsep=4pt, partopsep=0pt}
\setlist[itemize,1]{label={\color{accent}\textbullet}, leftmargin=1.4em}
\setlist[itemize,2]{label={\color{medgray}--}}
\setlist[enumerate,1]{label={\sffamily\bfseries\color{accent}\arabic*.}, leftmargin=1.6em}
\setlist[description]{font={\sffamily\bfseries}, leftmargin=1.2em, style=nextline, itemsep=5pt}

% Links
\hypersetup{
    colorlinks=true,
    linkcolor=ink,
    urlcolor=accentdark,
    citecolor=medgray,
    bookmarksnumbered=true,
    bookmarksopen=true,
    pdfstartview=FitH
}
\urlstyle{same}

% ============================================
% Headings
% ============================================
\titleformat{\chapter}[display]
    {\normalfont\sffamily\RaggedRight}
    {\displayfont\fontsize{64}{64}\selectfont\color{accent}\thechapter}
    {6pt}
    {\color{ink}\bfseries\fontsize{30}{34}\selectfont}
    [\vspace{8pt}{\color{ink}\titlerule[2.5pt]}]
\titleformat{name=\chapter,numberless}[display]
    {\normalfont\sffamily\RaggedRight}
    {}
    {0pt}
    {\color{ink}\bfseries\fontsize{30}{34}\selectfont}
    [\vspace{8pt}{\color{ink}\titlerule[2.5pt]}]
\titlespacing*{\chapter}{0pt}{0pt}{28pt}

\titleformat{\section}
    {\normalfont\sffamily\bfseries\Large\color{ink}\RaggedRight}
    {\color{accent}\thesection}{0.6em}{}
\titlespacing*{\section}{0pt}{20pt plus 4pt minus 2pt}{6pt}

\titleformat{\subsection}
    {\normalfont\sffamily\bfseries\large\color{ink}\RaggedRight}
    {\color{medgray}\thesubsection}{0.6em}{}
\titlespacing*{\subsection}{0pt}{14pt plus 3pt minus 2pt}{4pt}

\titleformat{\subsubsection}
    {\normalfont\sffamily\bfseries\normalsize\color{ink}}
    {}{0pt}{}
\titlespacing*{\subsubsection}{0pt}{10pt plus 2pt}{2pt}

% Part pages: full-bleed accent page, big white type
\titleformat{\part}[display]
    {\normalfont\sffamily\color{white}\RaggedRight}
    {\large\bfseries\MakeUppercase{\partname}\ \thepart}
    {10pt}
    {\displayfont\fontsize{40}{44}\selectfont}
\makeatletter
\renewcommand{\part}{%
    \clearpage
    \AddToShipoutPictureBG*{\AtPageLowerLeft{%
        \textcolor{accent}{\rule{\paperwidth}{\paperheight}}}}%
    \thispagestyle{empty}%
    \null\vfil
    \secdef\@part\@spart}
\def\@endpart{\vfil\newpage}
\makeatother

% ============================================
% Running heads: small sans, a hairline under them
% ============================================
\pagestyle{fancy}
\fancyhf{}
\fancyhead[LE]{\sffamily\small\bfseries\color{accent}\thepage\quad\color{medgray}\nouppercase{\leftmark}}
\fancyhead[RO]{\sffamily\small\color{medgray}\nouppercase{\rightmark}\quad\bfseries\color{accent}\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\headrule}{{\color{rulegray}\hrule width\headwidth height\headrulewidth}}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markright{#1}}
\fancypagestyle{plain}{%
    \fancyhf{}
    \fancyfoot[C]{\sffamily\small\color{medgray}\thepage}
    \renewcommand{\headrulewidth}{0pt}
}

% ============================================
% Tables and captions
% ============================================
\renewcommand{\arraystretch}{1.3}
\setlength{\heavyrulewidth}{1.2pt}
\setlength{\lightrulewidth}{0.4pt}
\AtBeginEnvironment{tabular}{\sffamily\small}
% Shrink any table wider than the text block to fit it
\RequirePackage{adjustbox}
\BeforeBeginEnvironment{tabular}{\begin{adjustbox}{max width=\linewidth}}
\AfterEndEnvironment{tabular}{\end{adjustbox}}
\captionsetup{
    font={small,sf},
    labelfont={bf,sf,color=accent},
    labelsep=period,
    justification=raggedright,
    singlelinecheck=false
}

% ============================================
% Title page: full accent cover, black type block
% ============================================
\makeatletter
\renewcommand{\maketitle}{%
    \AddToShipoutPictureBG*{\AtPageLowerLeft{%
        \textcolor{accent}{\rule{\paperwidth}{\paperheight}}}}%
    \thispagestyle{empty}%
    \begingroup
    \RaggedRight
    \vspace*{0.4in}
    {\displayfont\fontsize{50}{50}\selectfont\color{ink}\@title\par}
    \vspace{14pt}
    {\sffamily\bfseries\fontsize{20}{24}\selectfont\color{white}\@subtitle\par}
    \vfill
    {\color{ink}\rule{\linewidth}{3pt}\par}
    \vspace{8pt}
    {\sffamily\bfseries\Large\color{ink}\@author\par}
    \vspace{2pt}
    {\sffamily\large\color{white}Version \bookversion\quad\textbullet\quad\@date\par}
    \endgroup
    \clearpage
}
\makeatother

\makeatletter
\newcommand{\@subtitle}{}
\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}
\makeatother

% Table of contents: sans chapter lines, quiet section lines
\makeatletter
\RequirePackage{titletoc}
\renewcommand{\contentsname}{Contents}
\titlecontents{part}[0pt]
    {\addvspace{14pt}\sffamily\bfseries\small\color{accent}}
    {\MakeUppercase{\partname}~\thecontentslabel\quad}{}{}[\addvspace{2pt}]
\titlecontents{chapter}[1.8em]
    {\addvspace{6pt}\sffamily\bfseries}
    {\contentslabel{1.8em}}{\hspace*{-1.8em}}
    {\hfill\contentspage}[\addvspace{1pt}]
\titlecontents{section}[4.2em]
    {\small}
    {\contentslabel{2.4em}}{}
    {\titlerule*[0.8em]{\color{rulegray}.}\contentspage}
\setcounter{tocdepth}{1}
\let\isof@tableofcontents\tableofcontents
\renewcommand{\tableofcontents}{\begingroup\setlength{\parskip}{0pt}\isof@tableofcontents\endgroup}
\makeatother

\endinput
