%--------------------------------------
%% Document class vivid_layout_pdf.cls designed by Nadia Barnard
%% for Baron Schwartz of VividCortex
%--------------------------------------
%% Preliminaries

% Set oldest version of LaTeX needed
\NeedsTeXFormat{LaTeX2e}
% Name and label class
\ProvidesClass{vivid_layout_pdf}%
	[2015/10/24 Custom document layout for VividCortex]

%--------------------------------------
%% Initial Document Setup

% Load article class as basis
\LoadClass[letterpaper, 12pt]{article}
% Customise footnotes (must be before fancyhdr)
\RequirePackage[perpage,hang,bottom]{footmisc}
% Set margins
\RequirePackage{fancyhdr}
\pagestyle{fancy}
	\oddsidemargin=0.2in
	\topmargin=-0.75in
	\headheight=0.21in
	\headsep=0.24in
	\textheight=9.25in
	\textwidth=6.1in
	\footskip=0.8in
	\paperwidth=8.5in
	\paperheight=11in

%---------------------------------------
%% Load Required Packages

\RequirePackage{fontspec}	% Set new default font
\RequirePackage[strict]{changepage}	%Format section headings
\RequirePackage{xcolor}     % Change font colour
\RequirePackage{graphicx}   % Insert images
\RequirePackage{eso-pic}	% Insert background images
\RequirePackage{tikz}		% Insert background images
\usetikzlibrary{calc}
\RequirePackage{tabu}		% Create tables
\RequirePackage{colortbl}	% Shade tables
\RequirePackage{array}		% Align tabular cells
\RequirePackage{amsmath}	% Refine equation environment
\RequirePackage[hyperfootnotes=false, colorlinks=true, urlcolor=vividblue, linkcolor=vividgray]{hyperref}	% Add hyperlinks
\RequirePackage[framemethod=TikZ]{mdframed}		% Frame text
\RequirePackage{titletoc}	% Cutomise table of contents
\RequirePackage{float}		% Define section float type

%----------------------------------------
%% Defined Colours

\definecolor{vividgray}{rgb}{0.337,0.325,0.325}		% default text
\definecolor{vividblue}{rgb}{0.294, 0.737, 0.82}	% sections
\definecolor{vividlight}{rgb}{0.667, 0.631, 0.635}
\definecolor{vividbox}{rgb}{0.941, 0.937, 0.937}
\definecolor{vividlblue}{rgb}{0.843, 0.925, 0.945}

%----------------------------------------
%% Global Document Settings

% Set main font to Roboto Light, 14pt
\setmainfont{Roboto-Light}[Scale=1.15,%
	BoldFont = Roboto-Bold,%
	ItalicFont = Roboto-LightItalic,%
	BoldItalicFont = Roboto-BoldItalic]

\DeclareMathSizes{12}{14}{8}{14}

% Redefine default text colour as vividgray
\newcommand{\globalcolor}[1]{%
  \color{#1}\global\let\default@color\current@color}
\AtBeginDocument{\globalcolor{vividgray}}

% Paragraph Settings
\renewcommand{\baselinestretch}{1.4}	% 1.4 line spacing
\setlength{\parindent}{0pt}				% no line indents
\setlength{\parskip}{14pt}				% block paragraphs
\newcommand{\vmiddle}[1]{%
	\begin{tabular}{@{}c@{}}%
		{#1}%
	\end{tabular}%
}

%-------------------------------------
%% Arguments

% Title of publication
\renewcommand{\title}[2]{%
	\gdef\@titleone{#1}%
	\gdef\@titletwo{#2}%
}

% Date
\renewcommand{\date}[1]{%
	\gdef\@date{#1}%
}

% Cover image
\newcommand{\cover}[1]{%
	\gdef\@cover{#1}%
}

% Author name and picture
\renewcommand{\author}[2]{%
	\gdef\@author{#1}%
	\gdef\@authorpic{#2}%
}

% About picture
\newcommand{\aboutvc}[1]{%
	\gdef\@aboutpic{#1}%
}

% First resource
\newcommand{\resourceleft}[4]{%
	\gdef\@resourcehl{#1}%
	\gdef\@resourcebodyl{#2}%
	\gdef\@resourcepicl{#3}%
	\gdef\@resourcelinkl{#4}%
}

% Second resource
\newcommand{\resourceright}[4]{%
	\gdef\@resourcehr{#1}%
	\gdef\@resourcebodyr{#2}%
	\gdef\@resourcepicr{#3}%
	\gdef\@resourcelinkr{#4}%
}

%-------------------------------------
%% Set font sizes

% Headers & Footers
\newcommand{\fntheadfoot}{%
	\color{vividlight}%
	\fontsize{8pt}{0pt}%
	\selectfont}

% Front Cover
\newcommand{\fnttitlea}{%
	\color{white}%
	\fontspec{%
		Roboto-Regular}%
	\fontsize{25pt}{0pt}%
	\selectfont}
\newcommand{\fnttitleb}{%
	\fontspec{%
		Roboto-Black}%
	\color{white}%
	\fontsize{50pt}{15pt}%
	\selectfont}
\newcommand{\fntdate}{%
	\color{vividblue}%
	\fontsize{12pt}{0pt}%
	\selectfont}

% Meet the Author
\newcommand{\fntbiohead}{%
	\color{white}%
	\raggedright%
	\fontspec{%
		Roboto-Regular}
	\fontsize{14pt}{12pt}%
	\selectfont}
\newcommand{\fntbiobody}{%
	\color{white}%
	\raggedright%
	\fontsize{10pt}{12pt}%
	\selectfont}
	
% TOC
\newcommand{\fnttochead}{%
	\color{vividgray}%
	\bfseries%
	\fontsize{11pt}{12pt}%
	\selectfont}
\newcommand{\fnttoc}{%
	\color{vividgray}%
	\fontsize{11pt}{11pt}%
	\selectfont}
	
% Section Head
\newcommand{\fntsection}{%
	\color{vividblue}%
	\raggedright%
	\fontsize{24.88pt}{24.88pt}%
	\selectfont}

% Footnotes
\newcommand{\fntfootnote}{%
	\fontsize{8pt}{8pt}%
	\selectfont}

% Tables
\newcommand{\fnttable}{%
	\fontsize{10pt}{10pt}%
	\selectfont}

% Quotes
\newcommand{\fntquote}{%
	\color{vividgray}%
	\bfseries%
	\itshape}

% About VividCortex
\newcommand{\fntabouthead}{%
	\color{white}%
	\fontsize{20.74pt}{20pt}%
	\selectfont}
\newcommand{\fntaboutbody}{%
	\color{white}%
	\raggedright%
	\itshape%
	\fontsize{10pt}{11pt}%
	\selectfont}

% Related Resources
\newcommand{\fntresourcehead}{%
	\centering%
	\fontsize{22pt}{22pt}%
	\selectfont}
\newcommand{\fntresource}{%
	\fontsize{14pt}{14pt}%
	\selectfont}
\newcommand{\fntresourceinfo}{%
	\fontsize{10pt}{10pt}%
	\selectfont}

%-------------------------------------
%% Headers & Footers

\fancyhf{}
\fancyhfoffset[RO]{0in}
\rhead{%
	\fntheadfoot%
	Page \thepage%
}
\lfoot{%
	\vmiddle{\includegraphics[height=0.35in]{vividcortex_logo}}%
}
\cfoot{%
	\vmiddle{\fntheadfoot%
	Copyright \textcopyright\,2015 VividCortex}%
}
\rfoot{%
	\vmiddle{\includegraphics[height=0.15in]{img/by-nc-nd}}%
}
\renewcommand{\headrulewidth}{0pt}
\let\oldfoot\footrule
\renewcommand{\footrule}{\color{vividbox}\oldfoot}
\renewcommand{\footrulewidth}{1pt}
\renewcommand{\footruleskip}{0.1in}

%-------------------------------------
%% Front Cover

\fancypagestyle{plain}{%
	\fancyhf{}%
	\renewcommand{\footrulewidth}{0pt}%
	\textheight=11in%
	\footskip=0in%
}

\renewcommand{\maketitle}{%
	\thispagestyle{plain}%
  	\AddToShipoutPictureBG*{%
  		\tikz[remember picture,overlay]%
  		\node at (current page.center)%
  		{\includegraphics[keepaspectratio, scale=1]{\@cover}};
  	}
  	
	\centering
	\vspace*{1in}
	{\fnttitlea%
		\@titleone%
		\par}
	{\fnttitleb%
		\@titletwo%
		\par}
	\vspace*{\fill}
	{\fntdate%
		\@date%
		\par}
	\includegraphics[width=2.5in]{vividcortex_logo_white}
	\vspace*{-0.5in}

\clearpage
\raggedright
}

%-------------------------------------
%% Define {bio} environment
\RequirePackage{wrapfig}
\mdfdefinestyle{mdfbio}{%
	leftmargin=-0.35in,%
	innerleftmargin=0.35in,%
	rightmargin=-0.35in,%
	innerrightmargin=0.35in,%
	innertopmargin=0.35in,%
	innerbottommargin=0.4in,%
	skipabove=14pt,%
	skipbelow=14pt,%
	backgroundcolor=vividblue,%
	linewidth=0pt,%
}

\newenvironment{bio}{%
	\thispagestyle{toc}%
	{\fnttochead Meet the Author}
	\begin{mdframed}[style=mdfbio]%
		\setlength{\intextsep}{-0.2in}%
		\begin{wrapfigure}[8]{R}[-1.3in]{0.75in}%
			\tikz\node[%
				draw=vividlblue,%
				circle,%
				line width=0.17in,%
				inner sep=-0.08in%
			]{\includegraphics{\@authorpic}};
		\end{wrapfigure}		
	\fntbiohead%
		\@author\par%
	\fntbiobody%
	}{%
	\end{mdframed}%
}

%-------------------------------------
%% TOC

\fancypagestyle{toc}{%
	\rhead{}%
}

\titlecontents{section}%
	[0.15in]%
	{}{}{%
		\color{vividblue}%
		\large$\bullet$%
		\hspace{0.15in}%
		\fnttoc%
	}{%
		\hspace{0.15in}%
		\fnttoc%
		\hrulefill%
		\hspace{0.15in}%
		\contentspage%
	}[\vspace{-10pt}]

\renewcommand{\tableofcontents}{%
	{\fnttochead%
	Table of Contents\par}%
	\@starttoc{toc}%
	\clearpage%
}

%-------------------------------------
%% Section Head

\newfloat{secfloat}{H}{sfl}
	\setlength{\intextsep}{0.3in}

\renewcommand{\section}[1]{%
	\phantomsection
	\addcontentsline{toc}{section}{#1}%
	\begin{secfloat}{}%
		\begin{adjustwidth}{-1.4in}{0in}%
		\begin{tabular}{@{}p{1.2in}@{} @{}p{0.2in}@{} @{}>{\raggedright\setlength{\baselineskip}{1.8\baselineskip}}p{\textwidth}@{}}
			\smash{\raisebox{-\height}{\includegraphics[width=1.2in,height=0.4in]{section}}} && {\fntsection #1} \\
		\end{tabular}
		\end{adjustwidth}%
	\end{secfloat}%
	\vspace{-1in}%
}

%-------------------------------------
%% Redefine list environments

% Itemize - list with blue bullets
\renewenvironment{itemize}{%
	\begin{list}{%
		\color{vividblue}\large$\bullet$}%
		{\setlength{\topsep}{0pt}%
			\setlength{\leftmargin}{0.3in}}%
		\setlength{\labelsep}{0.15in}%
		}{%
	\end{list}%
}

% Enumerate - list with bold numbers
\newcounter{endcount}
\newcounter{enumcount}[endcount]

\renewenvironment{enumerate}{%
	\begin{list}{%
		\refstepcounter{enumcount}%
		{\bfseries \theenumcount .}}%
		{\setlength{\topsep}{0pt}%
			\setlength{\leftmargin}{0.3in}}%
		\setlength{\labelsep}{0.15in}%
	}{%
	\end{list}%
	\refstepcounter{endcount}%
}

%-------------------------------------
%% Redefine \footnote

\renewcommand{\footnoterule}{%
	\kern -3pt
	\begin{tikzpicture}
		\draw[%
			vividlight,%
			dotted,%
			line width=1pt,%
			inner sep=0pt,%
		] (0,0) -- (\textwidth,0);
	\end{tikzpicture}
	\vspace*{-10pt}
	\kern 2pt
}

\renewcommand{\footnotesize}{\fntfootnote}

%-------------------------------------
%% Redefine table layout

\taburulecolor{vividlight}
\arrayrulewidth=1pt
\taburowcolors 2{white .. vividbox}
\tabulinesep = 5pt

\renewenvironment{table}[1]{%
\begin{adjustwidth}{-0.45in}{-0.45in}%
\fnttable%
\begin{tabu}to \linewidth{|#1|}%
\hline\everyrow{\hline}%
}{\end{tabu}\end{adjustwidth}}

%-------------------------------------
%% Redefine {quote} environment

\mdfdefinestyle{mdfquote}{%
	innerleftmargin=0.3in,%
	innerrightmargin=0.3in,%
	innertopmargin=0.25in,%
	innerbottommargin=0.25in,%
	skipabove=14pt,%
	skipbelow=14pt,%
	backgroundcolor=vividbox,%
	linewidth=0pt,%
}

\renewenvironment{quote}{%
	\begin{mdframed}[style=mdfquote]%
		\fntquote%
		\tolerance=1%
		\emergencystretch=\maxdimen%
		\hyphenpenalty=10000%
		\hbadness=10000%
	}{%
	\end{mdframed}%
}

%-------------------------------------
%% Define {about} Environment

\mdfdefinestyle{mdfabout}{%
	leftmargin=-0.15in,%
	innerleftmargin=1.8in,%
	rightmargin=-0.15in,%
	innerrightmargin=0.35in,%
	innertopmargin=0.35in,%
	innerbottommargin=0.4in,%
	skipabove=14pt,%
	skipbelow=14pt,%
	backgroundcolor=vividblue,%
	linewidth=0pt,%
	singleextra={
		\path let \p1 = ($(O)!0.5!(P)$) in%
			(\the\dimexpr0.5\mdflength{innerleftmargin}\relax,\y1)%
    		coordinate (Q);
		\node at (Q)%
			{\includegraphics[width=\the\dimexpr0.9\mdflength{innerleftmargin}\relax]{\@aboutpic}};
		}
}

\newenvironment{about}{%
	\begin{mdframed}[style=mdfabout]{%
		\centering%
		\fntabouthead%
		About \vmiddle{\includegraphics[height=30pt]{img/vividcortex-v}} VividCortex\par}%
		\fntaboutbody%
	}{%
	\end{mdframed}%
}

%-------------------------------------
%% Define {resource} Environment

\newcommand{\makeresources}{%
	{\fntresourcehead%
	Related Resources From VividCortex\par}%
	\setlength{\tabcolsep}{0.15in}%
	\begin{tabular}[H]{m{2.75in} m{2.75in}}%
		\includegraphics[width=2.75in]{\@resourcepicl} &%
		\includegraphics[width=2.75in]{\@resourcepicr} \\
		\centering{%
			\fntresource%
			\href{\@resourcelinkl}{\@resourcehl}}%
		\par\vspace{10pt}{%
			\fntresourceinfo\@resourcebodyl} &% 
		\centering{%
			\fntresource%
			\href{\@resourcelinkr}{\@resourcehr}}%
		\par\vspace{10pt}{%
			\fntresourceinfo\@resourcebodyr} \\
\end{tabular}
}

%-------------------------------------
