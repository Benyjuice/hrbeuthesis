type main.tex | find "\def\usewhat{dvipspdf}" && goto dvipspdf
type main.tex | find "\def\usewhat{dvipdfmx}" && goto dvipdfmx
type main.tex | find "\def\usewhat{pdflatex}" && goto pdflatex
type main.tex | find "\def\usewhat{xelatex}" && goto xelatex
type main.tex | find "\def\usewhat{yap}" && goto yap

:dvipspdf
del main_dvipspdf.pdf main.dvi main.ps
latex main.tex
bibtex main
latex main.tex
latex main.tex
dvips  -G0 -ta4 main.dvi
ps2pdf main.ps main_dvipspdf.pdf
del *.aux *.bbl *.blg *.out *.thm *.toc *.lof *.fen *.toe *.lot *.ten *.log *.ps *.dvi *.loa /s
start main_dvipspdf.pdf
exit

:dvipdfmx
del main_dvipdfm.pdf main.dvi
latex main.tex
bibtex main
latex main.tex
gbk2uni main.out
latex main.tex
dvipdfmx -p a4 main.dvi
ren main.pdf main_dvipdfm.pdf
del *.aux *.bbl *.blg *.out *.thm *.toc *.lof *.fen *.toe *.lot *.ten *.log *.ps *.dvi *.loa /s
start main_dvipdfm.pdf
exit

:pdflatex
del main_pdflatex.pdf
pdflatex main.tex
bibtex main
pdflatex main.tex
gbk2uni main.out
pdflatex main.tex
ren main.pdf main_pdflatex.pdf
del *.aux *.bbl *.blg *.out *.thm *.toc *.lof *.fen *.toe *.lot *.ten *.log *.synctex *.loa /s
start main_pdflatex.pdf
exit

:xelatex
del main_xelatex.pdf
xelatex main.tex
bibtex main
xelatex main.tex
xelatex main.tex
ren main.pdf main_xelatex.pdf
del *.aux *.bbl *.blg *.out *.thm *.toc *.lof *.fen *.toe *.lot *.ten *.log *.gz *.gz(busy) *.synctex *.loa /s
start main_xelatex.pdf
exit

:yap
del main.dvi
latex main.tex
bibtex main
latex main.tex
gbk2uni main.out
latex main.tex
del *.aux *.bbl *.blg *.out *.thm *.toc *.lof *.fen *.toe *.lot *.ten *.log *.loa /s
start main.dvi
exit


