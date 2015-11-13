#!/bin/bash

#2015/11/12
#For some reason this scripts seems not to have worked. No matter; both Iowa and NASA TM recorded this test—Iowa in the ground station,
#and NASA TM through the science trailer down the road from the ground station at Andøya.
#A complete description can be found in the file 20151112--CAPER_DC_Calibration--ELF_and_SKIN.ods

#Go to the proper dir
cd /usr/src/Wallops_TCPIP

#ELF-ALO, ELF-AHI, ELF-BLO, ELF-BHI, SKIN-LO, SKIN-HI
./Wallops_telnet_TM1.sh 2 ELF-AHI 1000 0 5010 20151112--DC_cal--ELF-AHI & \
./Wallops_telnet_TM1.sh 2 ELF-ALO 1000 0 5011 20151112--DC_cal--ELF-ALO & \
./Wallops_telnet_TM1.sh 2 ELF-BHI 1000 0 5012 20151112--DC_cal--ELF-BHI & \
./Wallops_telnet_TM1.sh 2 ELF-BLO 1000 0 5013 20151112--DC_cal--ELF-BLO & \
./Wallops_telnet_TM1.sh 2 SKIN-HI 1000 0 5014 20151112--DC_cal--SKIN-HI & \
./Wallops_telnet_TM1.sh 2 SKIN-LO 1000 0 5015 20151112--DC_cal--SKIN-LO
