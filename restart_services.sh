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
## --2-- MAIN OPERATIONs 
##
###########################################
###########################################
cd /etc/init.d/ ;

SERVICE=$(echo $SERVICE | tr '[:upper:]' '[:lower:]')

if [ $SERVICE != "all" ]; then
	SERVICE=$SERVICE"*"
	for i in $(ls $SERVICE);
		do service $i $OPERATION
	done
else
	echo "all services return its operation"
fi

###########################################
###########################################
##
## --3-- return user directory 
##
###########################################
###########################################
cd $INIT_DIRECTORY

