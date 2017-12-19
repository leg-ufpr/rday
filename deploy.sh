#!/bin/sh

USER=rday
HOST=leg.ufpr.br
DIR=/home/rday/

Rscript -e 'rmarkdown::render_site()' && rsync -avz docs/ ${USER}@${HOST}:${DIR}

exit 0
