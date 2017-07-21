#!/bin/sh

USER=rday
HOST=leg.ufpr.br
DIR=/home/rday/

hugo && rsync -avz docs/ ${USER}@${HOST}:${DIR}

exit 0
