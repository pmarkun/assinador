@echo off
chcp 65001
set /P nome=Nome: 
set /P dedicatoria=Dedicatoria: 

set final_dedicatoria="Para %nome%,\n\n%dedicatoria%\n\nLeonardo Foletto,2021"

magick -background transparent -fill white -page 400x800^
	-size 300x300 -pointsize 10  pango:%final_dedicatoria%^
	-splice 40x300 tmp\dedicatoria.pdf

pdftk data\pagdedicatoria.pdf stamp tmp\dedicatoria.pdf output tmp\tmpassinatura.pdf
pdftk data\capa.pdf tmp\tmpassinatura.pdf data\restodolivro.pdf output "assinados\culturalivre %nome%.pdf"