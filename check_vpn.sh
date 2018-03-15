root@LEDE:/usr/bin$ cat check-vpn.sh 
#!/bin/sh
# wait for DDNS update
#echo "waiting 90 seconds for setup of network and DDNS"
#sleep 90

#while [ 1=1 ]
#do
        ping -q -c2 192.168.12.12 > /dev/null

        if [ $? -ne 0 ]
        then
#               echo "ping failed, restarting ipsec"
                ipsec stop
                sleep 5
                killall charon
                ipsec start
        else
		sleep 1
#               echo "VPN established"
        fi
#       echo "waiting 60 seconds before next check"
#       sleep 30
#done
