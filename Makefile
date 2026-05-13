BUILD := build

COMPILER := pdflatex
VIEWER := evince

MAIN = Main
SRC := $(MAIN).tex
PDF := $(BUILD)/$(MAIN).pdf

.PHONY: all pdf clean

all: pdf
	$(VIEWER) $(PDF)

pdf:
	-mkdir -p $(BUILD)
	$(COMPILER) -pdf -output-directory=$(BUILD) $(SRC)
	bibtex build/Main
	makeglossaries -d $(BUILD) $(MAIN)
	$(COMPILER) -pdf -output-directory=$(BUILD) $(SRC)

clean:
	-rm -rf build/*
	
