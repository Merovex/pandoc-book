BUILD = build
TAG := $(shell git describe --abbrev=0 --tags)
MAKEFILE = Makefile
OUTPUT_FILENAME = $(shell basename $(CURDIR))-$(TAG)
METADATA = metadata.yml
CHAPTERS = text/*.md
TOC = --toc --toc-depth=2
IMAGES_FOLDER = images
IMAGES = $(IMAGES_FOLDER)/*
COVER_IMAGE = $(IMAGES_FOLDER)/cover.png
LATEX_CLASS = book
MATH_FORMULAS = --webtex
TEMPLATE_DIR = templates/
CSS_FILE = style.css
CSS_ARG = --css=$(TEMPLATE_DIR)$(CSS_FILE)
METADATA_ARG = --metadata-file=$(METADATA)
ARGS = $(TOC) $(MATH_FORMULAS) $(CSS_ARG) $(METADATA_ARG)

all: book

book: epub html pdf

clean:
	rm -r $(BUILD)

epub: $(BUILD)/$(OUTPUT_FILENAME).epub

html: $(BUILD)/html/$(OUTPUT_FILENAME).html

pdf: $(BUILD)/$(OUTPUT_FILENAME).pdf

$(BUILD)/$(OUTPUT_FILENAME).epub: $(MAKEFILE) $(METADATA) $(CHAPTERS) $(TEMPLATE_DIR)$(CSS_FILE) $(IMAGES) \
	$(COVER_IMAGE)
	mkdir -p $(BUILD)
	pandoc $(ARGS) --template $(TEMPLATE_DIR)epub.html --epub-cover-image=$(COVER_IMAGE) -o $@ $(CHAPTERS)

$(BUILD)/html/$(OUTPUT_FILENAME).html: $(MAKEFILE) $(METADATA) $(CHAPTERS) $(TEMPLATE_DIR)$(CSS_FILE) $(IMAGES)
	mkdir -p $(BUILD)/html
	pandoc $(ARGS) --standalone --to=html5 -o $@ $(CHAPTERS)
	cp -R $(IMAGES_FOLDER)/ $(BUILD)/html/$(IMAGES_FOLDER)/
	cp $(TEMPLATE_DIR)$(CSS_FILE) $(BUILD)/html/$(CSS_FILE)

$(BUILD)/$(OUTPUT_FILENAME).pdf: $(MAKEFILE) $(METADATA) $(CHAPTERS) $(TEMPLATE_DIR)$(CSS_FILE) $(IMAGES)
	mkdir -p $(BUILD)
	pandoc --template $(TEMPLATE_DIR)pdf.tex --lua-filter $(TEMPLATE_DIR)latex.lua $(ARGS) -V documentclass=$(LATEX_CLASS) -o $@ $(CHAPTERS)
