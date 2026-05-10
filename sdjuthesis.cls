\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sdjuthesis}[2026/05/10 1.0.0 Shanghai Dianji University Thesis Template]

\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=sdju,
  prefix=sdju@,
  setkeys=\kvsetkeys
}
\DeclareStringOption[bachelor]{degree}[bachelor]
\DeclareStringOption[chinese]{language}[chinese]
\DeclareBoolOption{review}
\DeclareDefaultOption{
  \PassOptionsToClass{\CurrentOption}{ctexbook}
}
\ProcessKeyvalOptions*

\def\sdju@string@chinese{chinese}
\def\sdju@string@english{english}

\newif\ifsdju@degree@bachelor
\newif\ifsdju@degree@master
\@ifundefined{sdju@degree@\csname sdju@degree\endcsname true}{%
  \ClassError{sdjuthesis}{Invalid degree '\csname sdju@degree\endcsname'}{}%
}{%
  \csname sdju@degree@\csname sdju@degree\endcsname true\endcsname
}

\newif\ifsdju@language@chinese
\newif\ifsdju@language@english
\ifx\sdju@language\sdju@string@chinese
  \sdju@language@chinesetrue
\else
  \sdju@language@englishtrue
\fi

\ifsdju@language@english
  \PassOptionsToClass{scheme=plain}{ctexbook}
\fi

\LoadClass[a4paper, UTF8, zihao=-4, linespread=1.25]{ctexbook}

\ifsdju@degree@bachelor
  \AtEndOfClass{\input{sdjuthesis-bachelor.ltx}}
\fi
\ifsdju@degree@master
  \AtEndOfClass{\input{sdjuthesis-master.ltx}}
\fi

\RequirePackage{etoolbox}
\RequirePackage{xparse}
\RequirePackage{environ}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{pageslts}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{anyfontsize}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage[backend=biber, style=gb7714-2015]{biblatex}
\RequirePackage{titletoc}
\RequirePackage[titles]{tocloft}
\RequirePackage[inline]{enumitem}
\RequirePackage[perpage, bottom]{footmisc}
\RequirePackage{pdfpages}
\includepdfset{fitpaper=true}
\RequirePackage{hyperref}

\newcommand{\sdju@def@term}[1]{%
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname sdju@value@#1\endcsname{##1}}
  \csname #1\endcsname{}
  \define@key{sdjuvalue}{#1}{\csname #1\endcsname{##1}}}
\sdju@def@term{degreecategory}
\sdju@def@term{title}
\sdju@def@term{entitle}
\sdju@def@term{author}
\sdju@def@term{enauthor}
\sdju@def@term{supervisor}
\sdju@def@term{ensupervisor}
\sdju@def@term{studentid}
\sdju@def@term{finisheddate}
\sdju@def@term{major}
\sdju@def@term{enmajor}
\sdju@def@term{keywords}
\sdju@def@term{enkeywords}
\sdju@def@term{college}

\NewDocumentCommand\sdjuSetInfo{}{\setkeys{sdjuvalue}}

\newcommand{\sdju@def@label}[2]{%
  \expandafter\gdef\csname sdju@label@#1\endcsname{#2}
  \define@key{sdjulabel}{#1}{%
    \expandafter\gdef\csname sdju@label@#1\endcsname{##1}}}
\sdju@def@label{schoolChi}{上海电机学院}
\sdju@def@label{schoolEng}{Shanghai Dianji University}
\sdju@def@label{originalityChi}{毕业设计（论文）学术诚信声明}
\sdju@def@label{authorizationChi}{毕业设计（论文）版权使用授权书}
\sdju@def@label{origbody}{%
  本人郑重声明：所呈交的毕业设计（论文），是本人在导师的指导下，独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写过的作品成果。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本人完全意识到本声明的法律结果由本人承担。}
\sdju@def@label{authbody}{%
  本毕业设计（论文）作者同意学校保留并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。本人授权上海电机学院可以将本毕业设计（论文）全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本毕业设计（论文）。}
\sdju@def@label{abstractChi}{摘\quad 要}
\sdju@def@label{abstractEng}{ABSTRACT}
\sdju@def@label{keywordsChi}{关键词：}
\sdju@def@label{keywordsEng}{Key words:~}
\sdju@def@label{contents}{目\quad 录}
\sdju@def@label{figure}{图}
\sdju@def@label{listfigure}{图目录}
\sdju@def@label{table}{表}
\sdju@def@label{listtable}{表目录}
\sdju@def@label{acknowledgements}{致\quad 谢}
\sdju@def@label{references}{参考文献}

\NewDocumentCommand\sdjuSetLabel{}{\setkeys{sdjulabel}}

\patchcmd\cleardoublepage%
  {\newpage}{\thispagestyle{empty}\newpage}
  {}{}
\patchcmd\chapter%
  {\thispagestyle{\CTEX@chapter@pagestyle}}{}
  {}{}
\AtBeginDocument{%
  \pagenumbering{Alph}
  \pagestyle{empty}}

\ctexset{%
  contentsname   = \sdju@label@contents,
  listfigurename = \sdju@label@listfigure,
  listtablename  = \sdju@label@listtable}

\ctexset{%
  chapter={%
    format       = \zihao{3}\heiti\bfseries\centering,
    nameformat   = {},
    titleformat  = {},
    name         = {},
    number       = \arabic{chapter},
    aftername    = \quad,
    afterindent  = true,
    beforeskip   = 0pt,
    afterskip    = 12bp
  },
  section={%
    format       = \zihao{4}\songti,
    indent       = 2em,
    afterindent  = true,
    beforeskip   = 12bp,
    afterskip    = 0bp
  },
  subsection={%
    format       = \zihao{-4}\heiti,
    indent       = 2em,
    afterindent  = true,
    beforeskip   = 12bp,
    afterskip    = 0bp
  },
  subsubsection={%
    format       = \zihao{-4}\normalfont,
    indent       = 2em,
    afterindent  = true,
    beforeskip   = 12bp,
    afterskip    = 0bp
  },
  paragraph/afterindent    = true,
  subparagraph/afterindent = true}

\ctexset{%
  punct          = quanjiao,
  space          = auto,
  autoindent     = true}

\setCJKfamilyfont{zhli}{LiSu}[Script=Default]
\renewcommand*{\lishu}{\CJKfamily{zhli}}
\setCJKfamilyfont{zhfs}{FangSong}[Script=Default]
\renewcommand*{\fangsong}{\CJKfamily{zhfs}}
\setCJKfamilyfont{sdjuyahei}{Microsoft YaHei}
\newcommand*{\sdjuyahei}{\CJKfamily{sdjuyahei}}

\AtEndOfClass{\sloppy}

\setlist{nosep}
\setlist*{leftmargin=*}
\setlist[1]{labelindent=\parindent}

\setcounter{secnumdepth}{3}

\let\origaddvspace\addvspace
\renewcommand{\addvspace}[1]{}
\setcounter{tocdepth}{2}
\renewcommand{\cftdotsep}{1}
\titlecontents{chapter}%
  [0pt]%
  {}%
  {\thecontentslabel\quad}%
  {}%
  {~\cftdotfill{\cftdot}\contentspage}%
\titlecontents{section}%
  [2em]%
  {}%
  {\thecontentslabel\hspace{.5em}}%
  {}%
  {~\cftdotfill{\cftdot}\contentspage}%
\titlecontents{subsection}%
  [4em]%
  {}%
  {\thecontentslabel\hspace{.5em}}%
  {}%
  {~\cftdotfill{\cftdot}\contentspage}%

\renewcommand{\tableofcontents}{%
  \cleardoublepage%
  \chapter*{\contentsname}%
  \addcontentsline{toc}{chapter}{\contentsname}
  \@mkboth{\contentsname}{\contentsname}%
  \@starttoc{toc}
}

\renewcommand{\cftfigpresnum}{\sdju@label@figure~}
\renewcommand{\cfttabpresnum}{\sdju@label@table~}

\AtEndPreamble{%
  \newlength{\sdju@cftfignumwidth@tmp}
    \settowidth{\sdju@cftfignumwidth@tmp}{\cftfigpresnum}
  \addtolength{\cftfignumwidth}{\sdju@cftfignumwidth@tmp}
  \newlength{\sdju@cfttabnumwidth@tmp}
    \settowidth{\sdju@cfttabnumwidth@tmp}{\cfttabpresnum}
  \addtolength{\cfttabnumwidth}{\sdju@cfttabnumwidth@tmp}
}

\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

\AtBeginDocument{%
  \renewcommand{\theequation}{\thechapter-\arabic{equation}}
  \renewcommand{\thefigure}{\thechapter-\arabic{figure}}
  \renewcommand{\p@subfigure}{\thefigure}
  \renewcommand{\thetable}{\thechapter-\arabic{table}}
}

\newif\ifsdju@setfloatfont
\renewcommand{\@floatboxreset}{%
  \reset@font
  \ifsdju@setfloatfont
    \zihao{5}
  \else
    \normalsize
  \fi
  \@setminipage
}
\BeforeBeginEnvironment{longtable}
  {\begingroup\ifsdju@setfloatfont\zihao{5}\fi}
\AfterEndEnvironment{longtable}
  {\endgroup}
\NewDocumentCommand{\sdjuSetFloatFontOn}{}{\sdju@setfloatfonttrue}
\NewDocumentCommand{\sdjuSetFloatFontOff}{}{\sdju@setfloatfontfalse}
\DeclareCaptionFont{sdjucaptionfont}{\zihao{5}\kaishu}
\DeclareCaptionFont{sdjusubcaptionfont}{\zihao{5}\normalfont}
\captionsetup{%
  format        = plain,
  labelformat   = simple,
  labelsep      = space,
  justification = centering,
  font          = sdjucaptionfont
}
\captionsetup[sub]{%
  format        = hang,
  labelformat   = parens,
  labelsep      = space,
  justification = justified,
  font          = sdjusubcaptionfont
}

\newcommand{\sdju@signbox}[2][作者]{%
  \makebox[\textwidth][r]{%
    #1 签名：\underline{\hbox to 4em{}}%
    \ifthenelse{\equal{#2}{作者}}%
      {}{#2 签名：\underline{\hbox to 4em{}}}%
    日期：\underline{\hbox to 4em{}}%
  }
}

\NewDocumentCommand{\makeDeclareOriginality}{o}{%
  \ifsdju@review
    \relax
  \else
    \pdfbookmark[0]{\sdju@label@originalityChi}{origtitle}
    \IfNoValueTF{#1}{%
      \thispagestyle{empty}
      \vspace*{22mm}
      \begingroup
        \centering
        {\normalfont\zihao{-2}\heiti\bfseries \sdju@label@schoolChi\par}
        {\normalfont\zihao{-2}\heiti\bfseries \sdju@label@originalityChi\par}
      \endgroup
      \vskip 7ex
      \begingroup
        \fontsize{14bp}{24bp}\selectfont
        \sdju@label@origbody
        \vskip 10ex
        \noindent
        \makebox[\textwidth][r]{作者签名：\underline{\hbox to 7em{}}\quad 日期：\underline{\hbox to 8em{}}}
      \endgroup
      \cleardoublepage
    }
    {\includepdf[pagecommand={\thispagestyle{empty}}]{#1}}
  \fi
}

\NewDocumentCommand{\makeDeclareAuthorization}{o}{%
  \ifsdju@review
    \relax
  \else
    \pdfbookmark[0]{\sdju@label@authorizationChi}{authtitle}
    \IfNoValueTF{#1}{%
      \thispagestyle{empty}
      \vspace*{22mm}
      \begingroup
        \centering
        {\normalfont\zihao{-2}\heiti\bfseries \sdju@label@schoolChi\par}
        {\normalfont\zihao{-2}\heiti\bfseries \sdju@label@authorizationChi\par}
      \endgroup
      \vskip 7ex
      \begingroup
        \fontsize{14bp}{24bp}\selectfont
        \sdju@label@authbody
        \par\vskip 2ex
        \noindent 本论文属于\par
        \noindent\hspace{2em}保密$\square$，在\underline{\hbox to 3em{}}年解密后适用本授权书。\par
        \noindent\hspace{2em}不保密$\square$。\par
        \noindent （请在以上方框内打“$\checkmark$”）
        \vskip 10ex
        \noindent
        作者签名：\underline{\hbox to 5em{}}\hfill 指导教师签名：\underline{\hbox to 5em{}}
        \par\vskip 2ex
        日期：\underline{\hbox to 7em{}}\hfill 日期：\underline{\hbox to 7em{}}
      \endgroup
      \cleardoublepage
    }
    {\includepdf[pagecommand={\thispagestyle{empty}}]{#1}}
  \fi
}

\newcommand{\sdju@acknowledgements}[1]{\long\gdef\sdju@acknowledgements@body{#1}}
\NewDocumentEnvironment{acknowledgements}{}{%
  \Collect@Body\sdju@acknowledgements
}{%
  \ifsdju@review
    \relax
  \else
    \cleardoublepage
    \chapter*{\sdju@label@acknowledgements}
    \addcontentsline{toc}{chapter}{\sdju@label@acknowledgements}%
    \@mkboth{\sdju@label@acknowledgements}%
            {\sdju@label@acknowledgements}%
    \sdju@acknowledgements@body
  \fi
}

\AtBeginDocument{
  \ifsdju@review%
    \sdjuSetInfo{%
      author={***},
      supervisor={***},
      enauthor={***},
      ensupervisor={***},
      studentid={************},
      finisheddate={****年**月},
    }
  \fi
  \hypersetup{%
    pdftitle    = \sdju@value@title,
    pdfauthor   = \sdju@value@author,
    pdfkeywords = \sdju@value@keywords,
    pdfcreator  = {LaTeX with SDJUThesis}
  }%
}

\hypersetup{
  linktoc            = all,
  bookmarksnumbered  = true,
  bookmarksopen      = true,
  bookmarksopenlevel = 1,
  unicode            = true,
  psdextra           = true,
  breaklinks         = true,
  plainpages         = false,
  hidelinks,
}
\pdfstringdefDisableCommands{%
  \let\\\@empty
  \let\quad\@empty
  \let\hspace\@gobble
}
\urlstyle{same}

\PassOptionsToPackage{amsmath, thmmarks, hyperref}{ntheorem}
\RequirePackage{ntheorem}
\theoremheaderfont{\bfseries\heiti}
\theorembodyfont{\normalfont}
\theoremseparator{\enskip}
\theoremsymbol{\ensuremath{\square}}
\newtheorem*{proof}{证明}
\theoremstyle{plain}
\theoremsymbol{}
\newtheorem{theorem}              {定理}    [chapter]
\newtheorem{corollary}  [theorem] {推论}
\newtheorem{lemma}      [theorem] {引理}
\newtheorem{proposition}[theorem] {命题}
\newtheorem{assumption}           {假设} [chapter]
\newtheorem{definition}           {定义} [chapter]
\newtheorem{example}              {例}    [chapter]
\newtheorem*{remark}              {注}

\PassOptionsToPackage{algochapter}{algorithm2e}
\RequirePackage[ruled,vlined,linesnumbered]{algorithm2e}
\SetAlgorithmName{算法}{算法}{算法目录}
\SetAlgoCaptionSeparator{~}
\AtBeginDocument{%
  \renewcommand{\thealgocf}{\thechapter-\@arabic\c@algocf}
}

\RequirePackage{listings}
\lstdefinestyle{lstStyleCode}{
  aboveskip=\medskipamount,
  belowskip=\medskipamount,
  basicstyle=\linespread{1.25}\footnotesize\ttfamily,
  commentstyle=\slshape\color{black!60},
  stringstyle=\color{green!40!black!100},
  keywordstyle=\bfseries\color{orange!80!black},
  identifierstyle=,
  extendedchars=false,
  upquote=true,
  tabsize=2,
  showstringspaces=false,
  xleftmargin=1em,
  xrightmargin=1em,
  breaklines=true,
  breakindent=2em,
  framexleftmargin=1em,
  framexrightmargin=1em,
  backgroundcolor=\color{gray!10},
  columns=flexible,
  keepspaces=true,
  texcl=true,
  mathescape=true
}
\lstnewenvironment{codeblock}[1][]
  {\lstset{style=lstStyleCode, #1}}{}

\RequirePackage{tikz}
\usetikzlibrary{shapes.geometric, arrows}
\tikzstyle{startstop} = [
  rectangle,
  rounded corners,
  minimum width=2cm,
  minimum height=1cm,
  text centered,
  draw=black
]
\tikzstyle{io} = [
  trapezium,
  trapezium left angle=75,
  trapezium right angle=105,
  minimum width=1cm,
  minimum height=1cm,
  text centered,
  draw=black
]
\tikzstyle{process} = [
  rectangle,
  minimum width=2cm,
  minimum height=1cm,
  text centered,
  draw=black
]
\tikzstyle{decision} = [
  diamond,
  minimum width=2cm,
  minimum height=1cm,
  text centered,
  draw=black]
\tikzstyle{arrow} = [thick, ->, >=stealth]
