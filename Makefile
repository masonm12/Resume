resume.pdf: resume.html
	wkhtmltopdf resume.html resume.pdf

html:
	$(MAKE) -C pandoc_resume html
	cp pandoc_resume/output/resume.html .

pdf: resume.pdf

clean:
	rm -f *.pdf *.html

update_pandoc_resume:
	git subtree pull --prefix pandoc_resume git@github.com:mszep/pandoc_resume.git master --squash
