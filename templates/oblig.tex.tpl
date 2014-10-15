\documentclass[11pt]{article}
\usepackage[norsk]{babel}
\usepackage[utf8]{inputenc}
\usepackage{alltt}
\usepackage{listings}
\usepackage{hyperref}
\usepackage{color}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsthm}
\usepackage{wasysym}
\usepackage{lipsum}
\usepackage{sectsty}
\usepackage{fullpage}
\usepackage{graphicx}
\usepackage{import}

%\renewcommand{\theequation}{(\thesubsection.hei\arabic{equation})}
\newcommand\numberthis{\addtocounter{equation}{1}\tag{\theequation}}
\renewcommand{\thesection}{\arabic{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
%\renewcommand{\thesubsection}{\thesection.\alph{subsection})} % subsection is now 1.a), 1.b)... 2.a)...

%\allsectionsfont{\centering \normalfont} % Make all sections centered, the default font

\usepackage{fancyhdr} % Custom headers and footers
\pagestyle{fancyplain} % Makes all pages in the document conform to the custom headers and footers
\fancyhead[C]{\footnotesize \textit{(>>>fagkode<<<) Oblig
    (>>>oblignr<<<) Bendik Samseth\\ $ \, $}} % No page header - if you want one, create it in the same way as the footers below 
\fancyhead[R]{}
\fancyhead[L]{}
\fancyfoot[L]{} % Empty left footer
\fancyfoot[C]{} % Empty center footer
\fancyfoot[R]{\thepage} % Page numbering for right footer
\renewcommand{\headrulewidth}{0pt} % Remove header underlines
\renewcommand{\footrulewidth}{0pt} % Remove footer underlines
\setlength{\headheight}{21pt} % Customize the height of the header

\numberwithin{equation}{subsection} % Number equations within sections (i.e. 1.1, 1.2, 2.1, 2.2 instead of 1, 2, 3, 4)
\numberwithin{figure}{section} % Number figures within sections (i.e. 1.1, 1.2, 2.1, 2.2 instead of 1, 2, 3, 4)
\numberwithin{table}{section} % Number tables within sections (i.e. 1.1, 1.2, 2.1, 2.2 instead of 1, 2, 3, 4)


\definecolor{yellow}{rgb}{0.7,0.8,0}
%\definecolor{blue}{rgb}{0,0,0.8}
\definecolor{blue}{rgb}{0.3,0.3,0.9}
\definecolor{green}{rgb}{0,0.3,0}
\lstloadlanguages{Python} 
\lstloadlanguages{MATLAB}
\lstset{%frame=single, % Single frame around code
		otherkeywords={self},
        keywordstyle=\color{blue},
        commentstyle=\color{green},
        stringstyle=\color{green}, % Strings are green
        showstringspaces=false, % Don't put marks in string spaces
        tabsize=5, % 5 spaces per tab        
        numbers=left, % Line numbers on left
        %firstnumber=1, % Line numbers start with line 1
        stepnumber=1 % Line numbers go in steps of 5
}
\newcommand{\matlabscript}[2]{
\begin{itemize}
\item[]\lstinputlisting[language=MATLAB,caption=#2,label=#1]{#1}
\end{itemize}
}
\newcommand{\pythonscript}[2]{
\begin{itemize}
\item[]\lstinputlisting[language=Python,caption=#2,label=#1]{#1}
\end{itemize}
}
\newcommand{\pythonscriptfromto}[4]{
\begin{itemize}
\item[]\lstinputlisting[language=Python,caption=#2,label=#1, firstline=#3,lastline=#4]{#1}
\end{itemize}
}

\newcommand{\horline}{
\begin{center}
\line(1,0){350}
\end{center}
}

\newcommand{\newfig}[3]{
\begin{figure}[h]
\centering
\includegraphics[scale=#2]{#1}
\caption{#3}
\end{figure}
}


\newcommand{\pd}[2] {\frac{\partial #1}{\partial #2}}
\renewcommand{\div}[1] {\nabla\cdot\vec{#1}}
\newcommand{\curl}[1] {\nabla\times\vec{#1}}
\renewcommand{\vec}{\mathbf} % bold face for vectors



\begin{document}
% make title page
\begin{titlepage}
\newcommand{\HRule}{\rule{\linewidth}{0.5mm}}
\center
\textsc{\LARGE Universitetet i Oslo}\\[1.5cm] % Name of your university/college
\textsc{\Large }\\[0.5cm] % Major heading such as course name
\textsc{\large (>>>fagkode<<<)}\\[0.5cm] % Minor heading such as course title
\HRule \\[0.4cm]
{ \huge \bfseries Obligatorisk oppgave (>>>oblignr<<<) }\\[0.4cm] % Title of your document
\HRule \\[1.5cm]
\Large \emph{Skrevet av:}\\
Bendik \textsc{Samseth}\\[3cm]
{\large \today}\\[3cm]
\vfill
\end{titlepage}

(>>>POINT<<<)


\end{document}