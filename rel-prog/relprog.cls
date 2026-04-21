\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{relprog}[2026/04/21 v1.0 Relatorio de Progresso]

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

% ─── Metadados do relatório ────────────────────────────────────────────────────
% Cada setter abaixo sobrescreve o valor default usado no cabeçalho e na capa.
\newcommand{\@relConsultoria}{Nome da Consultoria}
\newcommand{\@relLogo}{}          % vazio = usa texto; definido = usa imagem
\newcommand{\@relDocumentoId}{REL-PROG-001}
\newcommand{\@relTitulo}{Relatório de Progresso}
\newcommand{\@relSubtitulo}{}
\newcommand{\@relProjeto}{[Nome do Projeto]}
\newcommand{\@relCliente}{[Nome do Cliente]}
\newcommand{\@relResponsavel}{[Engenheiro Responsável]}
\newcommand{\@relRevisao}{Rev A}
\newcommand{\@relPeriodo}{[dd/mm/aaaa] a [dd/mm/aaaa]}
\newcommand{\@relFase}{[Nome da Fase]}
\newcommand{\@relData}{\today}

\newcommand{\consultoria}[1]{\renewcommand{\@relConsultoria}{#1}}
\newcommand{\logoConsultoria}[1]{\renewcommand{\@relLogo}{#1}}
\newcommand{\documentoId}[1]{\renewcommand{\@relDocumentoId}{#1}}
\newcommand{\tituloRelatorio}[1]{\renewcommand{\@relTitulo}{#1}}
\newcommand{\subtituloRelatorio}[1]{\renewcommand{\@relSubtitulo}{#1}}
\newcommand{\projetoNome}[1]{\renewcommand{\@relProjeto}{#1}}
\newcommand{\clienteNome}[1]{\renewcommand{\@relCliente}{#1}}
\newcommand{\responsavel}[1]{\renewcommand{\@relResponsavel}{#1}}
\newcommand{\revisao}[1]{\renewcommand{\@relRevisao}{#1}}
\newcommand{\periodo}[1]{\renewcommand{\@relPeriodo}{#1}}
\newcommand{\faseAtual}[1]{\renewcommand{\@relFase}{#1}}
\newcommand{\dataRelatorio}[1]{\renewcommand{\@relData}{#1}}

% ─── Metadados de assinatura ───────────────────────────────────────────────────
\newcommand{\@relAssinaResp}{[Nome do Responsável]}
\newcommand{\@relAssinaRespCargo}{[Cargo]}
\newcommand{\@relAssinaCliente}{[Nome do Representante do Cliente]}
\newcommand{\@relAssinaClienteCargo}{[Cargo] \textbar\ [Empresa do Cliente]}

\newcommand{\assinaturaResponsavel}[2]{%
  \renewcommand{\@relAssinaResp}{#1}%
  \renewcommand{\@relAssinaRespCargo}{#2}%
}
\newcommand{\assinaturaCliente}[2]{%
  \renewcommand{\@relAssinaCliente}{#1}%
  \renewcommand{\@relAssinaClienteCargo}{#2}%
}

% ─── Cabeçalho e Rodapé ────────────────────────────────────────────────────────
\setlength{\headheight}{50pt}
\addtolength{\topmargin}{-38pt}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\headrule}{\hbox to\headwidth{\color{cinzaborda}\leaders\hrule height \headrulewidth\hfill}}
\fancyhead[L]{%
  \ifx\@relLogo\empty
    \small\color{textomutado}\textbf{\@relConsultoria} \textbar\ \@relTitulo
  \else
    \raisebox{\dimexpr 0.5\ht\strutbox - 16pt\relax}{\includegraphics[height=32pt]{\@relLogo}}\hspace{6pt}%
    \small\color{textomutado}\textbar\ \@relTitulo
  \fi
}
\fancyhead[R]{\small\color{textomutado}\@relDocumentoId}
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

% ─── Comandos de semáforo ──────────────────────────────────────────────────────
\newcommand{\verde}{\cellcolor{verdeclaro}\textcolor{verde}{\textbf{\textbullet{}}}}
\newcommand{\amarelo}{\cellcolor{amareloclaro}\textcolor{amarelo}{\textbf{\textbullet{}}}}
\newcommand{\vermelho}{\cellcolor{vermelhoclaro}\textcolor{vermelho}{\textbf{\textbullet{}}}}

\newcommand{\legendaSemaforo}{%
  \vspace{6pt}
  {\small\color{textomutado}
    \textcolor{verde}{\textbf{\textbullet{}}} Verde: conforme planejado \quad
    \textcolor{amarelo}{\textbf{\textbullet{}}} Amarelo: atenção / risco leve \quad
    \textcolor{vermelho}{\textbf{\textbullet{}}} Vermelho: bloqueado / fora do prazo
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

% ─── Capa ──────────────────────────────────────────────────────────────────────
\newcommand{\fazerCapa}{%
  \begin{center}
    {\Huge\bfseries\color{primario} \@relTitulo}%
    \ifx\@relSubtitulo\empty\else\\[6pt]{\large\color{textomutado} \@relSubtitulo}\fi
  \end{center}

  \vspace{12pt}

  \begin{tabularx}{\linewidth}{@{}lX lX@{}}
    \textcolor{textomutado}{\small Projeto}    & \textbf{\@relProjeto}     &
    \textcolor{textomutado}{\small Documento}  & \textbf{\@relDocumentoId} \\[4pt]
    \textcolor{textomutado}{\small Cliente}    & \textbf{\@relCliente}     &
    \textcolor{textomutado}{\small Revisão}    & \textbf{\@relRevisao}     \\[4pt]
    \textcolor{textomutado}{\small Responsável}& \textbf{\@relResponsavel} &
    \textcolor{textomutado}{\small Data}       & \textbf{\@relData}        \\[4pt]
    \textcolor{textomutado}{\small Período}    & \textbf{\@relPeriodo}     &
    \textcolor{textomutado}{\small Fase atual} & \textbf{\@relFase}        \\
  \end{tabularx}

  \vspace{6pt}
  \textcolor{cinzaborda}{\rule{\linewidth}{0.8pt}}
  \vspace{8pt}
}

% ─── Cabeçalhos de tabela prontos ──────────────────────────────────────────────
% Uso: dentro de um tabularx com as colunas indicadas no comentário ao lado.
\newcommand{\cabStatusArea}{% colunas: @{} l c X @{}
  \toprule
  \rowcolor{primario}
  \textcolor{white}{\textbf{Área}} &
  \textcolor{white}{\textbf{Status}} &
  \textcolor{white}{\textbf{Comentário}} \\
  \midrule
}

\newcommand{\cabCronograma}{% colunas: @{} l l l c X @{}
  \toprule
  \rowcolor{primario}
  \textcolor{white}{\textbf{Milestone}} &
  \textcolor{white}{\textbf{Planejado}} &
  \textcolor{white}{\textbf{Previsto}} &
  \textcolor{white}{\textbf{Concl.}} &
  \textcolor{white}{\textbf{Observação}} \\
  \midrule
}

\newcommand{\cabRiscos}{% colunas: @{} l l l X X @{}
  \toprule
  \rowcolor{primario}
  \textcolor{white}{\textbf{\#}} &
  \textcolor{white}{\textbf{Risco}} &
  \textcolor{white}{\textbf{Impacto}} &
  \textcolor{white}{\textbf{Probabilidade}} &
  \textcolor{white}{\textbf{Mitigação}} \\
  \midrule
}

\newcommand{\cabPendencias}{% colunas: @{} c X l l @{}
  \toprule
  \rowcolor{primario}
  \textcolor{white}{\textbf{\#}} &
  \textcolor{white}{\textbf{Pendência}} &
  \textcolor{white}{\textbf{Solicitado em}} &
  \textcolor{white}{\textbf{Necessário até}} \\
  \midrule
}

% ─── Lista padronizada ─────────────────────────────────────────────────────────
\newenvironment{listaItens}
  {\begin{itemize}[leftmargin=1.4em, itemsep=2pt]}
  {\end{itemize}}

% ─── Alerta de pendências ──────────────────────────────────────────────────────
\newcommand{\alertaPendencias}{%
  \vspace{4pt}
  {\small\color{vermelho}\textbf{Atenção:} pendências não resolvidas até a data indicada podem impactar o cronograma do projeto.}%
}

% ─── Bloco de assinaturas ──────────────────────────────────────────────────────
\newcommand{\fazerAssinaturas}{%
  \vspace{10pt}
  \begin{tabularx}{\linewidth}{@{} X X @{}}
    \multicolumn{1}{c}{\textbf{Emitido por — \@relConsultoria}} &
    \multicolumn{1}{c}{\textbf{Ciente — Cliente}} \\[20pt]
    \midrule \\[-6pt]
    \multicolumn{1}{c}{\small \@relAssinaResp} &
    \multicolumn{1}{c}{\small \@relAssinaCliente} \\[2pt]
    \multicolumn{1}{c}{\small \@relAssinaRespCargo \textbar\ \@relConsultoria} &
    \multicolumn{1}{c}{\small \@relAssinaClienteCargo} \\[2pt]
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
