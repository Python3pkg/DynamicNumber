CONTRIBUTION = dn
NAME = Olivier Pieters
EMAIL = opieters@ugent.be
DIRECTORY = /macros/latex/contrib/${CONTRIBUTION}
LICENSE = free
FREEVERSION = lppl
FILE = ${CONTRIBUTION}.tar.gz

export CONTRIBUTION VERSION NAME EMAIL SUMMARY DIRECTORY DONOTANNOUNCE ANNOUNCE NOTES LICENSE FREEVERSION FILE

ctanify: ${FILE}

${CONTRIBUTION}.sty: ${CONTRIBUTION}.ins ${CONTRIBUTION}.dtx
    yes | tex $<

${FILE}: ${CONTRIBUTION}.dtx ${CONTRIBUTION}.ins ${CONTRIBUTION}.sty README ${CONTRIBUTION}-doc.pdf
    ctanify $^

upload: ctanify
    ctanupload -p
