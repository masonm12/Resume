resume.html: resume.md resume.css
	pandoc --standalone -H resume.css --from markdown --to html -o resume.html resume.md

resume.pdf: resume.html
	wkhtmltopdf resume.html resume.pdf

html: resume.html
pdf: resume.pdf

clean:
	rm -f *.pdf *.html

update_pandoc_resume:
	git subtree pull --prefix pandoc_resume git@github.com:mszep/pandoc_resume.git master --squash
