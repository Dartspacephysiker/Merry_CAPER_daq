#!/bin/bash


#FIRST=${1:-"Andoya_2015_test_TM4"}
#FIRST="Andoya_2015_test_TM4"
FIRST="Andoya_2015_test_TM4--day_3"

RATE=${3:-10000}
NCHAN=${2:-1}
RTD_DT=0.1

SUFFIX="--${NCHAN}ch"

DAYSTR=`date +%F_%H%M%S`

#RANGE=0000 # 1 = +-1 Volt, 0 = +-5 Volts
RANGE=1111 # 2015/11/10 David verified with me that this is the correct range

OUTDIR="/home/spencerh/data/CAPER/Andoya/2015/cals/TM4_HF"
FNAME="${FIRST}${SUFFIX}--${DAYSTR}.data"
ERRBUFF="${0} <comedi_read_buffer_size> <Num channels> <digitization rate in Hz>\nThe prefix for every file is ${FIRST}--<N chan>ch--YYYYMMDD_HHMMSS"

if [ $1 ] && [ ${NCHAN} -gt 0 ] && [ ${NCHAN} -le 4 ] && comedi_config --read-buffer ${1} /dev/comedi0 && comedi_test -s0 /dev/comedi0 >& /dev/null ; then 
    echo "Writing data to ${FNAME}."
    /usr/src/acq_c/acq_c -n ${NCHAN} -F ${RATE} -o ${OUTDIR}/${FNAME} -d ${RTD_DT} -m /tmp/rtd/rtd_digitizer.data -r $RANGE
else echo -e ${ERRBUFF}
fi


