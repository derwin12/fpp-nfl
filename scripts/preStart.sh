#!/bin/sh
echo "Running fpp-nfl PreStart Script"
BASEDIR=$(dirname $0)
cd $BASEDIR
cd ..
make "SRCDIR=${SRCDIR}"
