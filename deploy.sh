#!/bin/sh

USER=rday
HOST=leg.ufpr.br
DIR=/home/rday/

# hugo && 
rsync -avz public/ --rsh="ssh -p$PATAXOP" ${USER}@${HOST}:${DIR}

exit 0
