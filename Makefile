CONTRIBUTION = dynamicnumber
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

${FILE}: ${CONTRIBUTION}.dtx ${CONTRIBUTION}.ins ${CONTRIBUTION}.sty README.md LICENSE.txt ${CONTRIBUTION}.pdf
	ctanify $^

upload: ctanify
	ctanupload -p

clean:
	rm dynamicnumber.aux dynamicnumber.glo dynamicnumber.idx dynamicnumber.log dynamicnumber.out dynamicnumber.pdf dynamicnumber.sty dynamicnumber.tar.gz
