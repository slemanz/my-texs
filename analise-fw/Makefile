# ─── Makefile — Análise de Firmware ─────────────────────────────────────────────
DOC      := analise-fw
BUILD    := build
LATEX    := pdflatex
LATEXOPT := -interaction=nonstopmode -halt-on-error -output-directory=$(BUILD)

.PHONY: all clean

all: $(BUILD)/$(DOC).pdf

$(BUILD)/$(DOC).pdf: $(DOC).tex anafw.cls | $(BUILD)
	$(LATEX) $(LATEXOPT) $(DOC).tex
	$(LATEX) $(LATEXOPT) $(DOC).tex

$(BUILD):
	mkdir -p $(BUILD)

clean:
	rm -rf $(BUILD)
