#!/bin/bash -e

NAME=tube

DEVICE=ATF1508AS
PACKAGE=TQFP100
SPEED=15

ROOT=$(realpath ../..)
export WINEPREFIX=$HOME/.wine_atf
export WINCUPLDIR=$(winepath -w ${ROOT}/vendor/wincupl)
export FITTERDIR=$(winepath -w ${ROOT}/vendor/prochip)

#
# Run WinCupl
#

rm -f ${NAME}.pla

wine ${WINCUPLDIR}\\cupl.exe -m2 -bxfu ${WINCUPLDIR}\\cupl.dl ${NAME}.pld

#
# Run Fitter
#

FITTER=fit${DEVICE//[!0-9]/}.exe

rm -f ${NAME}.fit

wine ${FITTERDIR}\\${FITTER} \
     -i ${NAME}.pla \
     -o ${NAME}.jed \
     -lib aprim.lib \
     -tech ${DEVICE} \
     -device ${PACKAGE} \
     -tpd ${SPEED}

#
# Show result of fitting
#

grep "^   " ${NAME}.fit
echo

echo "Logic Array Block       Macro Cells     I/O Pins        Foldbacks       TotalPT         FanIN           Cascades"
grep "^[A-H]:" ${NAME}.fit
echo

grep "^Total"  ${NAME}.fit | sed "s/input pins \t/input pins/" | sed "s/Pts \t/Pts/"
echo

grep "^\$Device"  ${NAME}.fit
echo
