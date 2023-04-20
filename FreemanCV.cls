%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Freeman Curriculum Vitae
% Class File
% Version 3.0 (September 3, 2021)
%
% This class originates from:
% https://www.LaTeXTemplates.com
%
% Authors:
% Vel (vel@LaTeXTemplates.com)
% Alessandro Plasmati
%
% License:
% CC BY-NC-SA 4.0 (https://creativecommons.org/licenses/by-nc-sa/4.0/)
%
%!TEX root = resume.tex
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{FreemanCV}[2021/09/03 Freeman CV Class v3.0]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}} % Pass through any extra options specified to the base class
\ProcessOptions\relax % Process class options

\LoadClass{extarticle} % Load the base class

%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES AND MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

\usepackage{etoolbox} % Required for conditional logic and changing commands
\usepackage{scrextend}

\setlength{\parindent}{0pt} % Paragraph indentation

%----------------------------------------------------------------------------------------
%	MARGINS
%----------------------------------------------------------------------------------------

\usepackage[
  letterpaper, % Paper size
  top=0.5in, % Top margin
  bottom=0.5in, % Bottom margin
  left=0.5in, % Left margin
  right=0.5in, % Right margin
  footskip=0.25in, % Space from the bottom margin to the baseline of the footer
  nomarginpar,
  nohead,
  %showframe % Uncomment to show frames around the margins for debugging purposes
]{geometry}

%----------------------------------------------------------------------------------------
%	COLUMN LAYOUT
%----------------------------------------------------------------------------------------

\usepackage{paracol} % Required for creating multi-column layouts that can span pages automatically
\footnotelayout{m}

\AtBeginEnvironment{paracol}{\setlength{\parindent}{0pt}} % Paracols have default paragraph indentation and this overrides it to the template default of no indentation

\setlength\columnsep{0.05\textwidth} % Amount of horizontal space between the columns

%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------
\usepackage{xltxtra}

\defaultfontfeatures{Ligatures=TeX} % To support LaTeX ligatures (e.g. `` and --)

% The sans serif font used explicitly with \textsf{}\sffamily
\usepackage{libertinus-otf}

% The serif font used by default or explicitly with \textrm{}/\rmfamily
\setmainfont{Adobe Caslon Pro}
\setmonofont[
  Contextuals={Alternate}
]{Fira Code Medium}

\usepackage{fontawesome5}

%----------------------------------------------------------------------------------------
%	HEADERS & FOOTERS
%----------------------------------------------------------------------------------------

\usepackage{fancyhdr} % Required for customizing headers and footers
\pagestyle{fancy} % Enable custom headers and footers

\renewcommand{\headrulewidth}{0pt} % Remove the default rule under the header

\fancyhf{} % Clear default headers/footers by default, add headers and footers in the template file as per the example

%----------------------------------------------------------------------------------------
%	SECTIONS
%----------------------------------------------------------------------------------------

\usepackage[nobottomtitles*]{titlesec} % Required for modifying sections, the nobottomtitles* pushes section titles to the next page when they are close to the bottom of the page

\renewcommand{\bottomtitlespace}{0.05\textheight} % The minimal space required from the bottom margin so a section title isn't moved to the next page

\titleformat
  {\section} % Section type being modified
  [block] % Section layout type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
  {\color{headings}\scshape\LARGE\raggedright} % Text formatting of the whole section, i.e. label and title
  {} % Section label (e.g. number) and its formatting
  {0pt} % Horizontal space between the section label and title
  {} % Code before the section title
  [\color{black}\titlerule] % Code after the section title

\titlespacing*{\section}{0pt}{0pt}{8pt} % Spacing around section titles, the order is: left, before and after

%------------------------------------------------

\titleformat
  {\subsection} % Section type being modified
  [block] % Section layout type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
  {\itshape} % Text formatting of the whole section, i.e. label and title
  {} % Section label (e.g. number) and its formatting
  {0pt} % Horizontal space between the section label and title
  {} % Code before the section title
  [] % Code after the section title

\titlespacing*{\subsection}{0pt}{8pt}{3pt} % Spacing around section titles, the order is: left, before and after

%----------------------------------------------------------------------------------------
%	COLORS
%----------------------------------------------------------------------------------------

\usepackage[usenames, svgnames]{xcolor} % Required for defining and using custom colors

\definecolor{text}{HTML}{313131} % Main document text color, off-black
\definecolor{headings}{HTML}{701112} % Dark red color for headings
\definecolor{linkcolor}{HTML}{641c1d} % 25% desaturated headings color for links
\definecolor{lang}{HTML}{616161}
\definecolor{footers}{HTML}{919191}
\definecolor{lang2}{HTML}{7A6552}

\color{text} % Set the default text color

%----------------------------------------------------------------------------------------
%	LINKS
%----------------------------------------------------------------------------------------

\usepackage{hyperref} % Required for links

\hypersetup{
  colorlinks=true, % Whether to color the text of links
  urlcolor=linkcolor, % Color for \url and \href links
  linkcolor=linkcolor, % Color for \nameref links
}

%----------------------------------------------------------------------------------------
%	CUSTOM COMMANDS
%----------------------------------------------------------------------------------------

\newif\if@inemployer
\@inemployerfalse

% Command for adding a new employer entry (work experience)
\newenvironment{employer}[2]{
  \@inemployertrue % Cancelled by the end of the environment.
  \expandafter\ifstrequal\expandafter{#1}{}{}{\noindent{\raggedright\large\textbf{#1}}\ifstrequal\expandafter{#2}{}{}{\hfill{\raggedleft\textbf{\textsc{#2}}}}\par}
  \vspace{0.5ex}
}{
  \vspace{2ex}
}

% Command for adding a new job entry (work experience)
\newenvironment{jobentry}[1]{
  #1\\[-2ex]
}{
  \vspace{2ex}
}

\newcommand{\jobtitle}[2]{
  \expandafter\ifstrequal\expandafter{#1}{}{}{\noindent{\raggedright\large{\if@inemployer{#1}\else\textbf{#1}\fi}}\expandafter\ifstrequal\expandafter{#2}{}{}{\hfill{\raggedleft\textsc{#2}}}\\}
}

% Command for entering a new qualification (education)
\newcommand{\qualificationentry}[5]{
  \textsc{#1} & \textbf{#2}\\ % Duration and degree
  \expandafter\ifstrequal\expandafter{#3}{}{}{& {\small\textsc{#3}}\\} % Honors, achievements or distinctions (e.g. first class honors)
  \expandafter\ifstrequal\expandafter{#4}{}{}{& #4\\} % Department
  \expandafter\ifstrequal\expandafter{#5}{}{}{& \textit{#5}\\[1ex]} % Institution
}

\newenvironment{project*}[3]{{
    \noindent\raggedright\normalsize\textbf{#1}
     %\expandafter\ifstrequal\expandafter{#3}{}{}{\footnote{\url{#3}}}
    \hfill
    {\raggedleft\color{lang}\textbf{#2}}
  }
  \begin{itemize}[
    noitemsep,
    topsep=3pt,
    labelindent=1em,
    leftmargin=*,
    font=\normalsize
  ]
  \small
}{
  \end{itemize}
}

\newenvironment{project}[3]{
  \begin{project*}{#1}{#2}{#3}
}{
  \end{project*}
  \vspace{2ex}
}

\newcommand{\paper}[2]{
  \noindent{\raggedright\normalsize\textbf{#1}}\\[3pt]
  \expandafter\ifstrequal\expandafter{#2}{}{}{\small{#2}} % Description
  \vspace{3ex} % Vertical whitespace
}

% Command for entering a separate table row -- used for any section that uses a two column table for alignment
%\renewcommand{\arraystretch}{1.125}
\newcommand{\tableentry}[3]{
  \textsc{#1} & #2\expandafter\ifstrequal\expandafter{#3}{}{\\[0.5ex]}{\\[1ex]} % First the heading, then content, then a conditional insertion of whitespace if the third parameter has any content in it
}
