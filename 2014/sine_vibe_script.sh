#!/bin/bash


FIRST=${1:-"sine_vibe"}
RATE=${3:-10000}
NCHAN=${4:-2}
RTD_DT=0.1

SUFFIX="-${NCHAN}ch"

RANGE=0000 # 1 = +-1 Volt, 0 = +-5 Volts

OUTDIR="/home/spencerh/data/CAPER/Wallops/2014/vibe/digitizer"
FNAME="${FIRST}-${SUFFIX}.data"
ERRBUFF="${0} <prefix for outfile, e.g., ELF-ALO--sph_X1L--freqsweep_0-5KHz_50sec_4.8Vpp_0dB> <comedi_read_buffer_size> <digitization rate in Hz>"

if [ $1 ] && [ $2 ] && comedi_config --read-buffer ${2} /dev/comedi0 && comedi_test -s0 /dev/comedi0 >& /dev/null ; then 
    echo "Writing data to ${FNAME}."
    /daq/acq_c/acq_c -n ${NCHAN} -F ${RATE} -o ${OUTDIR}/${FNAME} -d ${RTD_DT} -m /tmp/rtd/rtd_digitizer.data -r $RANGE
else echo ${ERRBUFF}
fi


