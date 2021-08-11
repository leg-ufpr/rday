#!/bin/sh

USER=rday
HOST=leg.ufpr.br
DIR=/home/rday/
read -p 'PORTA: ' PORT

Rscript -e 'blogdown::build_site()' && rsync -avz -e "ssh -p $PORT" --delete --exclude-from 'rsync-exclude.txt' public/ ${USER}@${HOST}:${DIR}

exit 0
