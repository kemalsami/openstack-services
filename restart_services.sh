#!/bin/bash

INIT_DIRECTORY=`pwd`
SERVICE="ALL"
OPERATION="status"

###########################################
###########################################
##
## --1-- 
##
###########################################
###########################################
printusage()
{
        echo "This script interferes OpenStack services which are nova, neutron, glance and so on"
	echo "-s parameter for services name"
	echo "-o name of operation{restart|start|stop|status}"
	exit ${EXITPROB}
}

#parse the arguments
while getopts ":hs:s:o:" opt
do
        case $opt in
                h ) printusage;;
                s ) SERVICE=${OPTARG};;
		o ) OPERATION=${OPTARG};;
                ? ) printusage;;	
        esac
done

###########################################
###########################################
##
## --2-- 
##
###########################################
###########################################
cd /etc/init.d/ ;


for i in $(ls neutron-*);
do service $i $OPERATION
done

for i in $(ls nova-*);
do service $i $OPERATION
done

###########################################
###########################################
##
## --3-- return user directory 
##
###########################################
###########################################
cd $INIT_DIRECTORY

