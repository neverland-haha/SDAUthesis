%本模版根据山东农业大学信息科学学院学位论文撰写规范创建
%学院:级信息科学与工程学院
%专业:遥感科学与技术
%如果有需要或者需要改进，可以在cls中加入相应的内容,由于本人非数学和计算机专业，有些内容可能未涉及，需要各位同学和老师共同维护改进。
%三个月以内的不建议使用LaTeX模板进行写作
%LaTeX的目的是解放人，能够排版出美观的作品，希望大家也能多多推广LaTeX。
%读取基类
%ctexbook类

\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{SDAUthesis}[2020/08/01 v1.0 Standard LaTeX documentclass]
%\ProcessOptions\relax    %which should be saved as stub.cls where LATEX can find it
\LoadClass[a4paper,UTF8,openany,oneside,12pt,AutoFakeBold]{ctexbook}
\AtEndOfPackage{\input{SDAU.cfg}}   %配置文件

%检查是否由xelatex编译
\RequirePackage{ifxetex}
\ifxetex 
\else
\ClassError{SDAUthesis}{You must have to use the 'xelatex' \MessageBreak Please choose `xelatex'}{%
Only choose `xelatex', no `pdflatex' or `latex' and so on.}
\fi

%页边距

\RequirePackage[top=2.5cm, bottom=2.5cm, left=2.00cm, right=2.00cm,headheight=1.5cm,footskip=1.75cm,]{geometry}

%宏包的选择
%数学宏包
\RequirePackage{amsmath}
%插图
\RequirePackage{graphicx}
%标题
\RequirePackage{titlesec}
%
\RequirePackage{fontenc}
%tikz宏包,可以做流程图
\RequirePackage{tikz}
%算法宏包,排版代码块
\RequirePackage{listings}
%页眉页脚
\RequirePackage{fancyhdr}
%array宏包
\RequirePackage{array}
%三线表
\RequirePackage{booktabs}
%多列
\RequirePackage{multirow}
%页眉页脚
\RequirePackage{fancyhdr}
%定理
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
%列表
\RequirePackage[unicode,psdextra]{hyperref}
\RequirePackage{enumitem}
%循环
%\RequirePackage{forloop}				前期调试的时候使用
%string
%\RequirePackage{xstring}
%算法宏包,伪代码
\RequirePackage{algorithm2e}
%enuitem设置item间距
\RequirePackage{enumitem}
%caption
\RequirePackage{caption}
%lastpage
\RequirePackage{lastpage}%Number of pages in the document
%makecell
\RequirePackage{makecell}
%font
\RequirePackage[T1]{fontenc}
%间隔
\RequirePackage{setspace}
%etoolbox
\RequirePackage{etoolbox}
%虚线
\RequirePackage{arydshln}
%目录与插图
\RequirePackage[titles]{tocloft}
%颜色
\RequirePackage{xcolor}
%超链接
\RequirePackage{hyperref}
%colorbox
\RequirePackage{tcolorbox}


%超链接
\hypersetup{hidelinks}
{
\lstnewenvironment{tcode}
{
	\lstset{basicstyle = \small\ttfamily,
		language=TeX,
		tabsize = 4,
		frame = single,
		escapechar = `,
		breaklines = true,
		breakatwhitespace = true,
		frameround = tttt,
	}
}
{}
}

%颜色lst需要使用
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}
%------------------------------------------------------------------------------------------*****************************--------------------------------------------------------------------------------------------------------------------------------
%设置字体
\setCJKfamilyfont{hwxk}{华文行楷}
\newcommand*{\xk}{\CJKfamily{hwxk}} 
\setCJKfamilyfont{fzjt}{方正小标宋简体}
\newcommand*{\fzxb}{\CJKfamily{fzjt}}
\setmainfont{Times New Roman}
\newcommand{\kaiwu}{%
	 \bfseries \zihao{5} \kaishu
}
\newcommand{\songwu}{%
	\zihao{5} \songti
}



%页眉页脚设置
\pagestyle{fancy}% Enables the custom headers/footers
\fancypagestyle{frontmatterstyle}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\fancyfoot{} % clear all footer fields
	\fancyfoot[C]{\thepage} %
	\renewcommand{\thepage}{\Roman{page}}
}

\appto\frontmatter{\pagestyle{frontmatterstyle}}
\ProcessOptions\relax


\fancypagestyle{mainmatterstyle}{

	\renewcommand{\headrulewidth}{0.4pt}
	\fancyfoot{} % clear all footer fields
	\fancyfoot[C]{\thepage} 
	\fancyhead[C]{\songti \zihao{5} 山东农业大学学士学位论文}%
}

\appto\mainmatter{\pagestyle{mainmatterstyle}}
\appto\mainmatter{\linespread{1.0}\selectfont}   %行距

\fancypagestyle{plain}{
	\thispagestyle{mainmatterstyle}
}

\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{empty}}}

%----------------------------------------------------------------------------------******************************************************------------------------------------------------------------------------------------------
\newtoks\school %学校
\newtoks\college%学院
\newtoks\serialnumber%学号
\newtoks\major%专业年级
\newtoks\advisor%指导老师
\newtoks\titlextra%标题多余一行时添加
\newtoks\grade %届次
\newtoks\submityear%提交年份
\newtoks\submitmonth%提交月份
\newtoks\entitle		%英文标题
\newtoks\entitletra     %英文多余一行
\newtoks\author   %作者
\newtoks\submitdate   %提交日
\newtoks\titleEn 		%英文标题
\newtoks\titleZh       %中文标题
\newtoks\majorEn    %专业的英文
\newtoks\majorZh    %专业的中文
\newtoks\authorEn    %作者的拼写
\newtoks\advisorEn		%指导老师的拼音
\newtoks\titlefirst      %题目第一行
\newtoks\titlesecond  %题目第二行
\newtoks\majortotal   %年级加专业
\newtoks\advisors	 %指导老师带职称


%设置深度,段前2个字
\setcounter{secnumdepth}{4}		%目录需要使用
\setlength{\parindent}{2em}

%设置行距单位为18磅，单倍行距
\renewcommand{\baselinestretch}{1.0}
\setlength{\baselineskip}{18pt}

\ctexset{
	%二级标题：四号黑体，居中对齐，段前段后0.5行，标题编号和标题名之间空1格。
	chapter={
		name = {},		
		number = {\arabic{chapter}},
		format = {\heiti \centering \zihao{4}},
		aftername = \hspace{9pt},
		beforeskip = 9pt,
		afterskip = 27pt,
		fixskip = true,
	},
	section={
		%三级标题：左对齐，小四号楷体加粗，段前段后间距0.5行，标题编号和标题内容空1格
		number = {\thechapter.\hspace{2pt}\arabic{section}},
		format = {\kaishu \raggedright \bfseries \zihao{-4}},
		aftername = \hspace{8pt},
		beforeskip = 9pt,
		afterskip = 9pt,
		fixskip = true,
	},
	subsection={
		%四级标题：小四号宋体，左对齐，段前段后0.5行，标题编号和标题内容空1格。
		number = {\thechapter.\hspace{2pt}\arabic{section}.\hspace{2pt}\arabic{subsection}},
		format = {\songti  \raggedright \zihao{-4}},
		aftername = \hspace{9pt},
		beforeskip = 9pt,
		afterskip = 18pt,
		fixskip = true,
	}
}


\addtocontents{toc}{\protect\hypersetup{hidelinks}}
%英语目录连接
\addtocontents{toe}{\protect\hypersetup{hidelinks}}
%设置目录标题用
\newcommand\SDAUspace{\phantom{永永}}					%要两个空格
\renewcommand\cftchapdotsep{0.5}%虚线间隔
\renewcommand{\cftdot}{$\cdot$}
\renewcommand{\cftdotsep}{1.5}
\renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftchapdotsep}{\cftdotsep}
\setlength{\cftbeforesecskip}{18pt}%章节间隔,节前18磅
\setlength{\cftbeforesubsecskip}{18pt}%章节间隔,小节节前18磅
\renewcommand\cftchapfont{\kaishu\zihao{-4}}
\renewcommand\cftsecfont{\kaishu\zihao{-4}}
\renewcommand\cftsubsecfont{\kaishu\zihao{-4}}
%\renewcommand\cftchappagefont{\mdseries}
\setlength\cftbeforetoctitleskip{18pt}				%
\setlength\cftaftertoctitleskip{18pt}						
\setlength{\cftsubsecindent}{0pt}					%设置subsubsection不缩进
\setlength{\cftsecindent}{0pt}						   %设置section部分不缩进

\renewcommand{\cftchappagefont }{} 	%如何设置目录chap的目录不加粗


\setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
\setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
\lstset{
	frame=tb,
	aboveskip=3mm,
	belowskip=3mm,
	showstringspaces=false,
	columns=flexible,
	framerule=1pt,
	rulecolor=\color{gray!35},
	backgroundcolor=\color{gray!5},
	basicstyle={\small\ttfamily},
	numbers=none,
	numberstyle=\tiny\color{gray},
	keywordstyle=\color{blue},
	commentstyle=\color{dkgreen},
	stringstyle=\color{mauve},
	breaklines=true,
	breakatwhitespace=true,
	tabsize=3,
}

																				
\RequirePackage{array}
\newcommand\dlmu[2][4cm]{\hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt}

\renewcommand\maketitle{%封面
	\cleardoublepage
	\thispagestyle{empty}
	
	
	{\tiny \newsavebox{\zdx}                     %装订线
		\newcommand{\putzdx}{\marginpar{
				\parbox{1cm}{\vspace{0.5cm}
					\rotatebox[origin=c]{90}{
						\usebox{\zdx}
				}}
		}}
		\fancyhf{}
		\sbox{\zdx}
		{\parbox{22cm}{\centering                                                                                                    %装订线部分，勿删
				\vspace{2cm}
				\zihao{4}  
				\dotfill{}           \rotatebox[x=0.3\ccwd,y=0.5\ccwd]{-90}{ \textbf{线}}   \qquad  \rotatebox[x=0\ccwd,y=0.5\ccwd]{-90}{\textbf{订}} \qquad   \rotatebox[x=0\ccwd,y=0.5\ccwd]{-90}{\textbf{装}}
				\dotfill{}  
				\\
		}}
		\reversemarginpar
		\putzdx
	}
	
\vspace{1cm}

%正面部分

{
\centering
	{\xk \fontsize{25}{30} \selectfont  {山东农业大学}  \\ }
	\vspace{2cm}
	{\textbf   \fzxb  \fontsize{46}{59.2}  毕\qquad 业 \qquad 论 \qquad 文}

\vspace{3cm}

%表格1
	{ \zihao{3} \songti 
		\renewcommand\arraystretch{1.25}
		\begin{tabular}{rl}
				\phantom{幻影}			题目:	     &   \dlmu[8cm]{\the\titlefirst}         \\
				\phantom{幻影}    &    \dlmu[8cm] {\the\titlesecond}							%如果题目超过了2行，请修改8cm
		\end{tabular}
	}

\vspace{2cm}	

%表格2	
{
	\zihao{3} \songti  
	\renewcommand\arraystretch{1.5}      
	\begin{tabular}{crl}
	\phantom{幻幻影影}   &\makebox[4em][s]{院部}          & \dlmu[5cm]{\the \college}  \\
	\phantom{幻幻影影}   &\makebox[4em][s]{专业班级 } &\dlmu[5cm]{\the \major}    \\ 
	\phantom{幻幻影影}   &\makebox[4em][s]{届次} 		    &\dlmu[5cm]{\the \grade} \\ 
	\phantom{幻幻影影}   &\makebox[4em][s]{学生姓名}  &\dlmu[5cm]{\the \author}   \\
	\phantom{幻幻影影}   &\makebox[4em][s]{学号}          &\dlmu[5cm]{\the \serialnumber}  \\
	\phantom{幻幻影影}   &\makebox[4em][s]{指导教师}  &\dlmu[5cm]{\the \advisors}
	\end{tabular}
}
	
	 \vspace{80pt}
	 \centering
	{  \zihao{3}二 \ 〇   {\ \the\submityear} \ 年{ \ \the\submitmonth} \ 月  {\ \the \submitdate} \ 日 }

}
	\clearpage	

%制作第二页
%----------------------------------------------**************************----------------------------------------------------------------------
	\newpage
	\cleardoublepage
	\thispagestyle{empty}
	\vspace*{2cm}	
	\begin{center}
		\zihao{2} \songti  \the \titleZh   \\
		\the \titleEn 
	\end{center}
	
%专门的标题页
\vspace{3cm}
	\begin{center}
		\songti 
		\zihao{4}
		\renewcommand\tabcolsep{0.8cm}
		\renewcommand{\arraystretch}{1.2}
		\begin{tabular}{;{1pt/2pt} l ;{1pt/2pt}l ;{1pt/2pt}}
			\hdashline[1pt/2pt]
			专业           				  &     \the\majorZh    \\
			Speciality    				&     \the\majorEn   \\
			\hdashline[1pt/2pt]
			学生							  &     \the\author					   \\											%自行修改表格内的个人信息
			Undergraduate	       &	 \the\authorEn            \\
			\hdashline[1pt/2pt]
			指导教师 				   &     \the\advisor				   \\
			Supervisor				   &     \the	\advisorEn     \\
			\hdashline[1pt/2pt]
		\end{tabular}
	\end{center}

%日期学校名称
	\vspace{3cm}
	\begin{center}
		\zihao{4}
		山东农业大学     \\[1cm]
		二  \  〇 \  \the\submityear   \  年  \   \the \submitmonth  \ 月     \\[1cm]
		Shandong Agricultural University   \\			
	\end{center}
 	\clearpage
}

%-----------------------------------------------------**********************************-------------------------------------------------------
%摘要页
\newtoks\Chabstract 
\newtoks\Chkeyword
\newtoks\Enabstract
\newtoks\Enkeyword
\newcommand{\totalabstract}{%摘要
		\newpage
		\cleardoublepage
		\thispagestyle{empty}
%题目和作者内容		
	    \begin{center}
	    	{\zihao{3} \heiti    \the\titleZh  }   \\[18pt]	    	
	 {
	    		\kaishu \zihao{4}
	    		\begin{tabular}{rl}
	    			\the\majortotal   &  \the\author   \\
	    			指导老师  & 	\the\advisor
	    		\end{tabular}
	   }
	    \end{center}
    %摘要关键词设置
    {\noindent 【{\kaiwu 摘要}】 \songwu \the\Chabstract           \\  
    				  【{\kaiwu 关键词}】   \songwu \the\Chkeyword          \\[36pt]
    }
    	
    	%12pt normalfont为小四，找不到对应三号的对应字体。
    
    {	\begin{center}
    		  {\zihao{3}\bfseries \the\titleEn  \\[18pt]}
    
    	\begin{tabular}{c}
    		  \the\authorEn		\\
    		  \the\advisorEn
    	\end{tabular}
   		\end{center}
   	}
   
   	{  \small
   	    	\noindent 【{\bfseries Abstract}】 \songwu \the\Enabstract           \\  
   		【{\bfseries Keyword}】   \songwu \the\Enkeyword          
   	}
 }%摘要页完成
   

%图、表、公式名的名称修改
%a4paper中的正常字体，label和font都需要加粗。label后有space
\renewcommand{\thetable}{\thechapter.\arabic{table}}
\captionsetup[table]{font=normalsize,labelfont=bf,textfont=bf,labelsep=space}  
%a4paper中的正常字体，小四号字,label和font都要加粗，并且有space
\renewcommand{\thefigure}{\thechapter.\arabic{figure}}
\captionsetup[figure]{font=normalsize,labelfont=bf,textfont=bf,labelsep=space}
%公式格式设置当前section的
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}
\newtheorem{definition}{\hspace{2em}定义}[chapter] %
\newtheorem{theorem}[definition]{\hspace{2em}定理}
\newtheorem{axiom}[definition]{\hspace{2em}公理}
\newtheorem{lemma}[definition]{\hspace{2em}引理}
\newtheorem{proposition}[definition]{\hspace{2em}命题}
\newtheorem{corollary}[definition]{\hspace{2em}推论}
\newtheorem{remark}[definition]{\hspace{2em}注}
\newenvironment{solution}{\begin{proof}[\indent\textbf{解}]}{\end{proof}}
\renewcommand{\proofname}{\indent\bf 证明}



%致谢，附录，附件
\newcommand{\Thanks}{%将致谢添加到目录中
	\cleardoublepage
	\addcontentsline{toc}{chapter}{\kaishu 致谢}
    \phantomsection
	\chapter*{致谢}
	\zihao{-4}\songti
}

\newcommand{\Appendix}{%将附录添加到目录中
	\cleardoublepage											%book类需要控制奇偶页
	\addcontentsline{toc}{chapter}{\kaishu 附录}
    \phantomsection
	\renewcommand{\thechapter}{A}%
	\cleardoublepage
	
	\chapter*{附录}
	\zihao{-4}\songti
}

\newcommand{\fujian}{%附件不添加到目录
	\chapter*{附件}
	\zihao{-4}\songti
}



\RequirePackage[sort&compress]{gbt7714}
\bibliographystyle{gbt7714-numerical}
%参考文献加入目录


%%
%% End of file `SDAUthesis.cls'.