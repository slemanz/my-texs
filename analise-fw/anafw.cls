\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{anafw}[2026/06/10 v1.0 Analise de Firmware]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[11pt, a4paper]{article}

% ─── Pacotes ───────────────────────────────────────────────────────────────────
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[brazil]{babel}
\RequirePackage[top=2.5cm, bottom=2.5cm, left=2.5cm, right=2.5cm]{geometry}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage{colortbl}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{multirow}
\RequirePackage{listings}
\RequirePackage{hyperref}
\RequirePackage{parskip}
\RequirePackage{tcolorbox}
\tcbuselibrary{skins}

% ─── Cores ─────────────────────────────────────────────────────────────────────
\definecolor{primario}{RGB}{0, 74, 173}       % #004AAD — azul marca
\definecolor{secundario}{RGB}{0, 140, 220}    % azul celeste — complementar mais claro
\definecolor{cinzaclaro}{RGB}{242, 246, 252}  % fundo leve com toque azulado
\definecolor{cinzaborda}{RGB}{195, 210, 230}  % borda azul-acinzentada
\definecolor{verde}{RGB}{22, 130, 50}
\definecolor{amarelo}{RGB}{185, 135, 0}
\definecolor{vermelho}{RGB}{180, 30, 30}
\definecolor{verdeclaro}{RGB}{212, 242, 220}
\definecolor{amareloclaro}{RGB}{255, 244, 194}
\definecolor{vermelhoclaro}{RGB}{250, 218, 218}
\definecolor{textomutado}{RGB}{85, 105, 135}  % cinza com leve tom azulado

% ─── Hiperlinks ────────────────────────────────────────────────────────────────
\hypersetup{
  colorlinks=true,
  linkcolor=secundario,
  urlcolor=secundario,
  hidelinks
}

% ─── Metadados do documento ────────────────────────────────────────────────────
% Cada setter abaixo sobrescreve o valor default usado no cabeçalho e na capa.
\newcommand{\@anaConsultoria}{Nome da Consultoria}
\newcommand{\@anaLogo}{}          % vazio = usa texto; definido = usa imagem
\newcommand{\@anaDocumentoId}{ANA-FW-001}
\newcommand{\@anaTitulo}{Análise de Firmware}
\newcommand{\@anaSubtitulo}{}
\newcommand{\@anaProjeto}{[Nome do Projeto]}
\newcommand{\@anaCliente}{[Nome do Cliente]}
\newcommand{\@anaResponsavel}{[Engenheiro Responsável]}
\newcommand{\@anaRevisao}{Rev A}
\newcommand{\@anaData}{\today}
\newcommand{\@anaPlataforma}{[MCU / Framework]}
\newcommand{\@anaFirmware}{[Versão / commit analisado]}
\newcommand{\@anaRepositorio}{[Repositório / caminho]}

\newcommand{\consultoria}[1]{\renewcommand{\@anaConsultoria}{#1}}
\newcommand{\logoConsultoria}[1]{\renewcommand{\@anaLogo}{#1}}
\newcommand{\documentoId}[1]{\renewcommand{\@anaDocumentoId}{#1}}
\newcommand{\tituloAnalise}[1]{\renewcommand{\@anaTitulo}{#1}}
\newcommand{\subtituloAnalise}[1]{\renewcommand{\@anaSubtitulo}{#1}}
\newcommand{\projetoNome}[1]{\renewcommand{\@anaProjeto}{#1}}
\newcommand{\clienteNome}[1]{\renewcommand{\@anaCliente}{#1}}
\newcommand{\responsavel}[1]{\renewcommand{\@anaResponsavel}{#1}}
\newcommand{\revisao}[1]{\renewcommand{\@anaRevisao}{#1}}
\newcommand{\dataAnalise}[1]{\renewcommand{\@anaData}{#1}}
\newcommand{\plataforma}[1]{\renewcommand{\@anaPlataforma}{#1}}
\newcommand{\firmwareAnalisado}[1]{\renewcommand{\@anaFirmware}{#1}}
\newcommand{\repositorio}[1]{\renewcommand{\@anaRepositorio}{#1}}

% ─── Metadados de assinatura ───────────────────────────────────────────────────
\newcommand{\@anaAssinaResp}{[Nome do Responsável]}
\newcommand{\@anaAssinaRespCargo}{[Cargo]}
\newcommand{\@anaAssinaCliente}{[Nome do Representante do Cliente]}
\newcommand{\@anaAssinaClienteCargo}{[Cargo] \textbar\ [Empresa do Cliente]}

\newcommand{\assinaturaResponsavel}[2]{%
  \renewcommand{\@anaAssinaResp}{#1}%
  \renewcommand{\@anaAssinaRespCargo}{#2}%
}
\newcommand{\assinaturaCliente}[2]{%
  \renewcommand{\@anaAssinaCliente}{#1}%
  \renewcommand{\@anaAssinaClienteCargo}{#2}%
}

% ─── Cabeçalho e Rodapé ────────────────────────────────────────────────────────
\setlength{\headheight}{50pt}
\addtolength{\topmargin}{-38pt}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\headrule}{\hbox to\headwidth{\color{cinzaborda}\leaders\hrule height \headrulewidth\hfill}}
\fancyhead[L]{%
  \ifx\@anaLogo\empty
    \small\color{textomutado}\textbf{\@anaConsultoria} \textbar\ \@anaTitulo
  \else
    \raisebox{\dimexpr 0.5\ht\strutbox - 16pt\relax}{\includegraphics[height=32pt]{\@anaLogo}}\hspace{6pt}%
    \small\color{textomutado}\textbar\ \@anaTitulo
  \fi
}
\fancyhead[R]{\small\color{textomutado}\@anaDocumentoId}
\fancyfoot[C]{\small\color{textomutado}\thepage}
\fancyfoot[R]{\small\color{textomutado}Confidencial}

% ─── Títulos de seção ──────────────────────────────────────────────────────────
\titleformat{\section}
  {\color{primario}\large\bfseries}
  {}
  {0em}
  {}
  [\vspace{-4pt}\textcolor{cinzaborda}{\rule{\linewidth}{0.5pt}}\vspace{2pt}]

\titleformat{\subsection}
  {\color{secundario}\normalsize\bfseries}
  {}
  {0em}
  {}

% ─── Badges de criticidade ─────────────────────────────────────────────────────
% Pílula colorida usada nas tabelas e nos títulos de grupo de melhorias.
\newcommand{\badge}[2]{%
  \texorpdfstring{%
    {\setlength{\fboxsep}{2.5pt}%
     \colorbox{#1}{\textcolor{white}{\scriptsize\bfseries #2}}}%
  }{#2}%
}
\newcommand{\nivelCritico}{\badge{vermelho}{CRÍTICO}}
\newcommand{\nivelEstrutural}{\badge{amarelo}{ESTRUTURAL}}
\newcommand{\nivelRobustez}{\badge{verde}{ROBUSTEZ}}

% Esforço estimado (texto sóbrio, sem fundo)
\newcommand{\esfBaixo}{\textcolor{verde}{\textbf{baixo}}}
\newcommand{\esfMedio}{\textcolor{amarelo}{\textbf{médio}}}
\newcommand{\esfAlto}{\textcolor{vermelho}{\textbf{alto}}}

\newcommand{\legendaCriticidade}{%
  \vspace{6pt}
  {\small\color{textomutado}
    \nivelCritico{} corrige bug / risco real \quad
    \nivelEstrutural{} legibilidade e manutenção \quad
    \nivelRobustez{} resiliência / melhoria desejável
  }%
}

% ─── Caixa de resumo executivo ─────────────────────────────────────────────────
\newtcolorbox{resumobox}{
  enhanced,
  colback=cinzaclaro,
  colframe=cinzaborda,
  boxrule=0.5pt,
  arc=4pt,
  left=10pt, right=10pt, top=8pt, bottom=8pt,
  title={\small\bfseries\color{primario} Resumo Executivo},
  attach boxed title to top left={yshift=-2mm, xshift=6mm},
  boxed title style={colback=white, colframe=cinzaborda, boxrule=0.5pt, arc=3pt}
}

% ─── Caixa de premissa / ponto a confirmar ─────────────────────────────────────
\newtcolorbox{premissabox}{
  enhanced,
  colback=amareloclaro,
  colframe=amarelo,
  boxrule=0.5pt,
  arc=4pt,
  left=10pt, right=10pt, top=8pt, bottom=8pt,
  title={\small\bfseries\color{amarelo} Premissa a confirmar com o cliente},
  attach boxed title to top left={yshift=-2mm, xshift=6mm},
  boxed title style={colback=white, colframe=amarelo, boxrule=0.5pt, arc=3pt}
}

% ─── Bloco de código ───────────────────────────────────────────────────────────
\lstdefinestyle{anafwcode}{
  basicstyle=\ttfamily\small,
  backgroundcolor=\color{cinzaclaro},
  frame=single,
  rulecolor=\color{cinzaborda},
  framesep=6pt,
  xleftmargin=6pt,
  xrightmargin=0pt,
  breaklines=true,
  columns=fullflexible,
  keepspaces=true,
  showstringspaces=false,
  commentstyle=\color{textomutado},
  keywordstyle=\color{primario}\bfseries,
}
\lstset{style=anafwcode}
% Ambiente curto: \begin{codigo} ... \end{codigo}
\lstnewenvironment{codigo}[1][]{\lstset{#1}}{}

% ─── Capa ──────────────────────────────────────────────────────────────────────
\newcommand{\fazerCapa}{%
  \begin{center}
    {\Huge\bfseries\color{primario} \@anaTitulo}%
    \ifx\@anaSubtitulo\empty\else\\[6pt]{\large\color{textomutado} \@anaSubtitulo}\fi
  \end{center}

  \vspace{12pt}

  \begin{tabularx}{\linewidth}{@{}lX lX@{}}
    \textcolor{textomutado}{\small Projeto}     & \textbf{\@anaProjeto}     &
    \textcolor{textomutado}{\small Documento}   & \textbf{\@anaDocumentoId} \\[4pt]
    \textcolor{textomutado}{\small Cliente}     & \textbf{\@anaCliente}     &
    \textcolor{textomutado}{\small Revisão}     & \textbf{\@anaRevisao}     \\[4pt]
    \textcolor{textomutado}{\small Responsável} & \textbf{\@anaResponsavel} &
    \textcolor{textomutado}{\small Data}        & \textbf{\@anaData}        \\[4pt]
    \textcolor{textomutado}{\small Plataforma}  & \textbf{\@anaPlataforma}  &
    \textcolor{textomutado}{\small Firmware}    & \textbf{\@anaFirmware}    \\[4pt]
    \textcolor{textomutado}{\small Repositório} & \textbf{\@anaRepositorio} & & \\
  \end{tabularx}

  \vspace{6pt}
  \textcolor{cinzaborda}{\rule{\linewidth}{0.8pt}}
  \vspace{8pt}
}

% ─── Cabeçalhos de tabela prontos ──────────────────────────────────────────────
% Uso: dentro de um tabularx com as colunas indicadas no comentário ao lado.
\newcommand{\cabMelhorias}{% colunas: @{} c X c c @{}
  \toprule
  \rowcolor{primario}
  \textcolor{white}{\textbf{\#}} &
  \textcolor{white}{\textbf{Ponto de melhoria}} &
  \textcolor{white}{\textbf{Criticidade}} &
  \textcolor{white}{\textbf{Esforço}} \\
  \midrule
}

\newcommand{\cabEtapas}{% colunas: @{} l X X l @{}
  \toprule
  \rowcolor{primario}
  \textcolor{white}{\textbf{Etapa}} &
  \textcolor{white}{\textbf{Objetivo}} &
  \textcolor{white}{\textbf{Itens relacionados}} &
  \textcolor{white}{\textbf{Pré-requisito}} \\
  \midrule
}

\newcommand{\cabArquivos}{% colunas: @{} l X @{}
  \toprule
  \rowcolor{primario}
  \textcolor{white}{\textbf{Arquivo / Módulo}} &
  \textcolor{white}{\textbf{Responsabilidade}} \\
  \midrule
}

% ─── Lista padronizada ─────────────────────────────────────────────────────────
\newenvironment{listaItens}
  {\begin{itemize}[leftmargin=1.4em, itemsep=2pt]}
  {\end{itemize}}

% ─── Bloco de assinaturas ──────────────────────────────────────────────────────
\newcommand{\fazerAssinaturas}{%
  \vspace{10pt}
  \begin{tabularx}{\linewidth}{@{} X X @{}}
    \multicolumn{1}{c}{\textbf{Emitido por — \@anaConsultoria}} &
    \multicolumn{1}{c}{\textbf{Ciente — Cliente}} \\[20pt]
    \midrule \\[-6pt]
    \multicolumn{1}{c}{\small \@anaAssinaResp} &
    \multicolumn{1}{c}{\small \@anaAssinaCliente} \\[2pt]
    \multicolumn{1}{c}{\small \@anaAssinaRespCargo \textbar\ \@anaConsultoria} &
    \multicolumn{1}{c}{\small \@anaAssinaClienteCargo} \\[2pt]
    \multicolumn{1}{c}{\small Data: \underline{\hspace{3cm}}} &
    \multicolumn{1}{c}{\small Data: \underline{\hspace{3cm}}} \\
  \end{tabularx}

  \vspace{14pt}
  \textcolor{cinzaborda}{\rule{\linewidth}{0.5pt}}
  {\small\color{textomutado}
    Este documento é de uso confidencial e destinado exclusivamente ao cliente indicado no cabeçalho.
    Reprodução ou distribuição não autorizada é proibida.
  }%
}

\endinput
