#
# File: Makefile
#
# 修改自: PlutoThesis_UTF8_1.9.4.20100419.zip
#         http://code.google.com/p/plutothesis/
#
# 注: 标注 TODO 的是未测试的编译方式;
#     测试环境为 CentOS(安装了 XP 的六套 sim 字体) + texlive2009
#
#

# 采集 main.tex 中 \usewhat 的定义，决定使用的编译方式
DVIPDFMX:=$(shell grep '\\def\\usewhat{dvipdfmx}' main.tex)
PDFLATEX:=$(shell grep '\\def\\usewhat{pdflatex}' main.tex)
DVIPSPDF:=$(shell grep '\\def\\usewhat{dvipspdf}' main.tex)
YAP:=$(shell grep '\\def\\usewhat{yap}' main.tex)
XELATEX :=$(shell grep '\\def\\usewhat{xelatex}'  main.tex)

# 定义空变量，用于与上述变量比对：非空的编译方式将被执行
empty=

# 编译完成后自动使用下面阅读器打开生成的文档
PDFREADER=evince
DVIREADER=xdvi

# 定义所有参与编译的文件名变量，产生 all 的依赖
# TODO

all:
ifneq ($(empty),$(XELATEX))
	@echo Making xelatex......
	rm -f main_xelatex.pdf &
	xelatex main.tex
	bibtex main
	xelatex main.tex
	xelatex main.tex
	mv main.pdf main_xelatex.pdf
	@echo Done. Starting the browser......
	$(PDFREADER) main_xelatex.pdf&
endif
ifneq ($(empty),$(DVIPDFMX))  # TODO
	@echo Making dvipdfmx......
	rm -f main.pdf main.dvi &
	latex main.tex
	env BIBINPUTS=./ BSTINPUTS=./ bibtex main
	latex main.tex
	latex main.tex
	dvipdfmx -p a4 main.dvi
	@echo Done. Starting the browser......
	$(PDFREADER) main.pdf&
endif
ifneq ($(empty),$(PDFLATEX))  # TODO
	@echo Making pdflatex......
	rm -f main_pdflatex.pdf&
	pdflatex main.tex
	env BIBINPUTS=./ BSTINPUTS=./ bibtex main
	pdflatex main.tex
	pdflatex main.tex
	mv main.pdf main_pdflatex.pdf
	@echo Done. Starting the browser......
	$(READER) main_pdflatex.pdf&
endif
ifneq ($(empty),$(DVIPSPDF))  # TODO
	@echo Making dvipspdf......
	rm -f main_dvipspdf.pdf main.dvi main.ps&
	latex main.tex
	env BIBINPUTS=./ BSTINPUTS=./ bibtex main
	latex main.tex
	latex main.tex
	dvips  -G0 -ta4 main.dvi
	ps2pdf main.ps main_dvipspdf.pdf
	@echo Done. Starting the browser......
	$(PDFREADER) main_dvipspdf.pdf&
endif
ifneq ($(empty),$(YAP))  # TODO
	@echo Making dvi......
	rm -f main.dvi&
	latex main.tex
	env BIBINPUTS=./ BSTINPUTS=./ bibtex main
	latex main.tex
	latex main.tex
	$(DVIREADER) main.dvi&
endif

clean:
	-find -name '*.aux' -exec rm -f {} \;
	-find -name '*.bak' -exec rm -f {} \;
	-find -name '*.dvi' -exec rm -f {} \;
	-find -name '*~' -exec rm -f {} \;
	-find -name '#*#' -exec rm -f {} \;
	-find -name 'semantic.cache' -exec rm -f {} \;
	-find -name '*.log' -exec rm -f {} \;
	-rm -f *.bbl *.blg *.log *.out *.ps *.thm *.toc *.toe *.lof *.lot 
	-rm -f *.loa *.aen
	-rm -f *.html *.css *.scm *.hlog
	-rm -f _region_.tex
	-rm -f -rf auto
	-rm -f *.fen
	-rm -f *.ten
	-rm -rf ./body/auto
	-rm -rf ./reference/auto
	-rm -rf ./setup/auto
	-rm -rf ./preface/auto
	-rm -rf *.prv

.PHONY: clean
