#!/bin/bash
#DIR=/data/www/logs/apache_log/access
DIR=/data/www/logs/nginx_log/access
DATE=`date +'%Y-%m-%d'`

cd ${DIR}
for i in `ls  *.log` 
do
echo "site: ${i}"
cat $i |grep "10:3[7-8]"|awk '{print $1}'|sort -rn |uniq -c |sort -r |awk '{if($1> 50) print $0}'
echo "count: `cat $i |grep "10:3[7-8]"|awk '{print $1}'|wc -l`"
done


#awk '$0>="[26/Mar/2018:10:35:02 -0700" && $0<="[26/Mar/2018:11:35:02 -0700"'

