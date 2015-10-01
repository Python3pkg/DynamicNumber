CONTRIBUTION = dn
NAME = Olivier Pieters
EMAIL = me@olivierpieters.be
DIRECTORY = /macros/latex/contrib/${CONTRIBUTION}
LICENSE = free
FREEVERSION = other-free
FILE = ${CONTRIBUTION}.tar.gz

export CONTRIBUTION VERSION NAME EMAIL SUMMARY DIRECTORY DONOTANNOUNCE ANNOUNCE NOTES LICENSE FREEVERSION FILE

ctanify: ${FILE}

${CONTRIBUTION}.sty: ${CONTRIBUTION}.ins ${CONTRIBUTION}.dtx
	yes | tex $<

${CONTRIBUTION}.pdf: ${CONTRIBUTION}.dtx ${CONTRIBUTION}.sty
	pdflatex $<

${FILE}: ${CONTRIBUTION}.dtx ${CONTRIBUTION}.ins ${CONTRIBUTION}.sty README LICENSE.txt ${CONTRIBUTION}.pdf
	ctanify $^

upload: ctanify
	ctanupload -p

clean:
	rm dn.aux dn.glo dn.idx dn.log dn.out dn.pdf dn.sty dn.tar.gz
