vpath %.yaml .:_spec

PANDOC/LATEX := docker run -u "`id -u`:`id -g`" \
		-v "`pwd`:/data" -v "`pwd`/assets/fonts:/usr/share/fonts" \
		palazzo/pandoc-unb:2.16.1

plano.pdf : plano.md pdf.yaml _lib/default.latex
	$(PANDOC/LATEX) -o $@ -d _spec/pdf.yaml $<

.PHONY : clean
clean :
	rm -rf *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.log *.run.xml
# vim: set foldmethod=marker shiftwidth=2 tabstop=2 :
