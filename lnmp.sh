#!/bin/bash
tar -xf lnmp_soft.tar.gz
cd lnmp_soft
tar -xf nginx-1.12.2.tar.gz
cd nginx-1.12.2/
useradd -s /sbin/nologin    nginx
yum -y install mariadb  mariadb-server   mariadb-devel   php  php-mysql php-pecl-memcache  gcc  pcre-devel   openssl-devel   zlib-devel
./configure   --user=nginx    --group=nginx     --with-http_ssl_module    --with-stream    --with-http_stub_status_module  
make  && make install    > /dev/null 
echo 'make and make install,please wait'
cd /root/lnmp_soft/
yum -y install php-fpm-5.4.16-42.el7.x86_64.rpm 
#   yum -y install /root/lnmp_soft/libevent-devel-2.0.21-4.el7.x86_64.rpm  
echo 'ok'
systemctl restart mariadb   php-fpm memcached
systemctl enable  mariadb   php-fpm
echo  'open server'
#   echo 1 > /usr/local/nginx/html/index.html
ln /usr/local/nginx/sbin/nginx       /sbin/nginx
#   ssh-keygen
cp /root/lnmp_soft/php_scripts/*    /usr/local/nginx/html/
sed -i '65,68s/#//' /usr/local/nginx/conf/nginx.conf
sed -i '70,71s/#//' /usr/local/nginx/conf/nginx.conf
sed -i '70s/fastcgi_params/fastcgi.conf/'  /usr/local/nginx/conf/nginx.conf
nginx


