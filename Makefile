# Makefile for CV

FILENAME = cv 			# basename of your cv and bib file (same name)
TEX = pdflatex
BIB = biber

PDF = $(addsuffix .pdf, $(strip $(FILENAME)))
EXT = .aux .bbl .bcf .blg .log .out .run.xml
AUX = $(addprefix $(strip $(FILENAME)),$(strip $(EXT)))

.PHONY : all clean cleanall view

all: $(PDF)

view:
	@open $(PDF)

%.pdf: %.tex %.bib
	@echo "\n==> Building $@"
	@echo "    - pdflatex $< (pass 1/3)"
	@$(TEX) $< > /dev/null
	@echo "    - biber $(basename $@)"
	@$(BIB) $(basename $(word 2,$^)) > /dev/null
	@echo "    - pdflatex $< (pass 2/3)"
	@$(TEX) $< > /dev/null 
	@echo "    - pdflatex $< (pass 3/3)"
	@$(TEX) $< > /dev/null 
	@echo "==> Success!\n"

clean:
	@echo "\n==> Cleaning directory of auxilary files\n"
	@rm -f $(AUX)

cleanall:
	@echo "\n==> Cleaning directory of auxilary files"
	@rm -f $(AUX)
	@echo "==> Removing pdf file\n"
	@rm -f $(PDF)
