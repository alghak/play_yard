#!/bin/bash

COOKIE="126.cookie.tmp"
USER="rr_xce1"
PASSWORD="tripod"

if [ $# -ge 2 ]
then
  USER=$1
  PASSWORD=$2
fi
#USER=$1

echo "$USER $PASSWORD"

## logon
curl -v --header "Connection: keep-alive" -d "username=$USER" -d "password=$PASSWORD" -d "df=webmail126" -d "funcid=loginone" -d "net=t" -d "passtype=1" -d "product=mail126" -d "uid=$USER@126.com" -d "from=web" -d "iframe=1" -d "language=-1" -d "race=83_41_62_gz" -d "stype=-1" -k https://ssl.mail.126.com/entry/coremail/fcg/ntesdoor2 -D $COOKIE 2> log1 1> res1


## get contact list
curl -v "http://twebmail.mail.126.com/contacts/call.do?uid=$USER@126.com&from=webmail&cmd=newapi.getContacts&vcardver=3.0&ctype=all&attachinfos=yellowpage" -b $COOKIE 2> log2 1> res2

cat res2
echo
## 
exit 0
