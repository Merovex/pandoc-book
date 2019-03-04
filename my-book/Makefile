SHELL = /bin/bash
BUILD_DIR = build/
TEMPLATE_DIR = templates/
IMAGES_DIR = images/
CSS_FILE = style.css
VERSION = $(shell git describe --abbrev=0 --tags)
OUTPUT_BASENAME = $(shell basename $(CURDIR))-$(VERSION)

# CHAPTERS = text/*.md
CHAPTERS = $(shell find text -type f -name '*.md' | sort )
METADATA = metadata.yml
LATEX_CLASS = book

EPUB_BUILDER_FLAGS = \
	--epub-cover-image=$(IMAGES_DIR)cover.png \
	--css=templates/$(CSS_FILE) \
	--template templates/epub.html \
	--metadata-file=$(METADATA) \
	--metadata=version:$(VERSION) \
	--lua-filter templates/latex.lua \
	--toc --toc-depth=2 \
	--webtex

HTML_BUILDER_FLAGS = \
	--css=templates/$(CSS_FILE) \
	--standalone --to=html5 \
	--metadata-file=$(METADATA) \
	--lua-filter templates/latex.lua \
	--toc --toc-depth=2 \
	--self-contained \
	--webtex

PDF_BUILDER_FLAGS = \
	-V documentclass=$(LATEX_CLASS) \
	--template templates/pdf.tex \
	--metadata-file=$(METADATA) \
	--metadata=version:$(VERSION) \
	--lua-filter templates/latex.lua \
	--pdf-engine=xelatex \
	--toc --toc-depth=2 \
	--webtex

WORD_BUILDER_FLAGS = \
	--reference-doc=templates/reference.docx \
	--metadata-file=$(METADATA) \
	--lua-filter templates/latex.lua

MOBI_BUILDER = kindlegen

.PHONY: show-args
show-args:
	@printf "Book Version: %s\n" $(VERSION)

all: book

book: pdf html epub

clean:
	rm -r $(BUILD_DIR)*

docx:
	mkdir -p $(BUILD_DIR)
	pandoc $(WORD_BUILDER_FLAGS) -o $(BUILD_DIR)$(OUTPUT_BASENAME).docx $(CHAPTERS)

pdf:
	mkdir -p $(BUILD_DIR)
	pandoc $(PDF_BUILDER_FLAGS) -o $(BUILD_DIR)$(OUTPUT_BASENAME).pdf $(CHAPTERS)

html:
	mkdir -p $(BUILD_DIR)html
	cp -R $(IMAGES_DIR) $(BUILD_DIR)html/$(IMAGES_DIR)
	pandoc $(HTML_BUILDER_FLAGS) -o $(BUILD_DIR)html/$(OUTPUT_BASENAME).html $(CHAPTERS)

$(BUILD_DIR)$(OUTPUT_BASENAME).epub:
	mkdir -p $(BUILD_DIR)
	pandoc $(EPUB_BUILDER_FLAGS) -o $(BUILD_DIR)$(OUTPUT_BASENAME).epub $(CHAPTERS)

epub: $(BUILD_DIR)$(OUTPUT_BASENAME).epub
