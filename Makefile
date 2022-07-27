html:
	$(MAKE) -C pandoc_resume html
	cp pandoc_resume/output/resume.html .

pdf:
	$(MAKE) -C pandoc_resume pdf
	cp pandoc_resume/output/resume.pdf .

clean:
	rm -f *.pdf *.html
	$(MAKE) -C pandoc_resume clean

update_pandoc_resume:
	git subtree pull --prefix pandoc_resume git@github.com:mszep/pandoc_resume.git master --squash
