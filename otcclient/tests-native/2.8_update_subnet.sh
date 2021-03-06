#!/bin/sh

source otcfunc.sh
source otcconf.sh


apitest neutron --insecure net-create ${NETWORK_NAME} 2>/dev/null

NETWORK_ID=`neutron --insecure net-list 2>/dev/null|grep ${NETWORK_NAME}|awk '{print $2}'`

apitest neutron --insecure subnet-create ${NETWORK_NAME} 192.168.2.0/24 --name ${SUBNET_NAME}  2>/dev/null
apitest neutron --insecure subnet-update ${SUBNET_NAME} --name ${SUBNET_NAME_NEW}  2>/dev/null


apitest neutron --insecure subnet-list  2>/dev/null
apitest neutron --insecure subnet-show  ${SUBNET_NAME_NEW}  2>/dev/null



apitest neutron --insecure subnet-delete ${SUBNET_NAME_NEW} 2>/dev/null
apitest neutron --insecure net-delete ${NETWORK_NAME} 2>/dev/null
