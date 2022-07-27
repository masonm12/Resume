copy_input:
	cp resume.md pandoc_resume/markdown/mathew.md

clean_input:
	rm -f pandoc_resume/markdown/mathew.*

html: copy_input
	$(MAKE) -C pandoc_resume html
	cp pandoc_resume/output/mathew.html resume.html

pdf: copy_input
	$(MAKE) -C pandoc_resume pdf
	cp pandoc_resume/output/mathew.pdf resume.pdf

all: html pdf clean_input

clean: clean_input
	rm -f *.pdf *.html
	$(MAKE) -C pandoc_resume clean

update_pandoc_resume:
	git subtree pull --prefix pandoc_resume git@github.com:mszep/pandoc_resume.git master --squash
