#!/bin/bash
#Author: Geoffrey J. Cullen
#Function: Assemble and Link using NASM and GCC
#
#Requires: 64-bit system using correct gcc and libraries
#
#Change Log:
#       01-25-21 CP hide object and listing output all but owner
#set -x
echo `date`" Program $0 (PROCESS ID $$)"

trap 'echo "Exit because so requested."; exit 0'  0
trap 'echo "Disconnect the line."; exit 1' 1
trap 'echo "Interrupt Key (CONTROL+C) pressed."; exit 2' 2
trap 'echo "Quit Key pressed (CONTROL+SHIFT+\)."; exit 3' 3
trap 'echo "Kill -9 command issued."; exit 9' 9
trap 'echo "Normal software termination occurred."; exit 15' 15
trap 'echo "Suspend Key (CONTROL+Z) pressed."; exit 20' 20
#trap 'echo DEBUG entered.; exit 127' DEBUG
#trap 'echo ERROR.; exit 255' ERROR
 
#   echo "Number of Parameters received: "$#
#   echo "Parameters received: "$*
case "$#" in
  0 )
   echo "No parameters received."
   echo "Usage: $0 pgmname of source code with asm file extension"
   echo "Example: $0 pgmname"
   exit -127
  ;;
  1 )
    if [ $1 == 'help' ]
    then
       echo "--HELP documentation --"
       echo "parameter 1: pgmname of source code with asm file extension"
       echo "parameter 2: [optional] object decks"
       echo "parameter 3 "
       echo "--End of HELP documentation --"
       exit 0
    fi
    pgmname=$1
    objdeck=" "
  ;;
  2 )
    echo "2 parameters"
    pgmname=$1
    objdeck=$2
  ;;
  3 )
    echo "3 parameters"
    pgmname=$1
    objdeck=$2
  ;;
  4 )
    echo "4 parameters"
    pgmname=$1
    objdeck=$2
  ;;
  *)
    echo "Invalid set of arguments were entered..., exiting."
    exit 255  
  ;;
esac 
 
asmname=$pgmname'.asm'
objname=$pgmname'.o'
lstname=$pgmname'.lst'

echo " "
echo "Assemble program "$pgmname
#set -x
nasm -f elf64 $asmname -l $lstname
rc=$? 
echo "$0...Assembly completed with RC=$rc..."
if [ $rc != 0 ]
   then
   echo "Assembly errors occurred..."
   exit $rc 
fi
chmod 600 $lstname
echo " "
echo "Link Edit of program "$pgmname
g++ -no-pie -m64 -o $pgmname $objname CPsub64.o $objdeck 
rc=$? 
echo "$0...Link Completed with RC=$rc..."
if [ $rc != 0 ]
   then
   echo "Linkage Editor errors occurred..."
   exit $rc 
fi
chmod 600 $objname
 
exit $rc 
