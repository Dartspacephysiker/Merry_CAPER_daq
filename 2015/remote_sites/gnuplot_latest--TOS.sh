#!/bin/bash

#2015/11/27
#A little script to gnuplot a sample of the latest file in the data dir


#
FIRST="KSAT_2015--day_"
OUTDIR="/daq/CAPER_2015"
LATEST=`ls -laht ${OUTDIR}/${FIRST}*.data | awk ' NR == 1 { print $9 }'`


echo "Latest file: ${LATEST}"


gnuplot -e "set terminal png" -e "set output 'gnuplot_latesh.png'" -e "plot '${LATEST}' binary format='%uint16' using 1 every ::90::200 with lines"

echo "Done!"
