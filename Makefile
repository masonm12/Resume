copy_input:
	cp resume.md pandoc_resume/markdown/mathew.md

clean_input:
	rm -f pandoc_resume/markdown/mathew.*

mtx_generate.tmp:
	mtxrun --generate
	touch mtx_generate.tmp
generate: mtx_generate.tmp

resume.html: resume.md
	$(MAKE) copy_input
	$(MAKE) -C pandoc_resume html
	cp pandoc_resume/output/mathew.html resume.html
	$(MAKE) clean_input
html: resume.html

resume.pdf: resume.md generate
	$(MAKE) copy_input
	$(MAKE) -C pandoc_resume pdf
	cp pandoc_resume/output/mathew.pdf resume.pdf
	$(MAKE) clean_input
pdf: resume.pdf

all: html pdf

clean: clean_input
	rm -f *.pdf *.html *.tmp
	$(MAKE) -C pandoc_resume clean

update_pandoc_resume:
	git subtree pull --prefix pandoc_resume git@github.com:mszep/pandoc_resume.git master --squash
