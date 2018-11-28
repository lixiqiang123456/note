#!/bin/bash
...
  stream   {
     upstream  backend {
    server 192.168.2.100:22;
    server 192.168.2.200:22;
}
     server {
   listen 12345;
   proxy_connect_timeout 1s;
   proxy_timeout 3s;
   proxy_pass backend;
 } 
}  
...



http {
 ......
     upstream   webserver {
        ip_bash;
        server 192.168.2.100 weight=1  max_fails=2   fail_timeout=10;
        server 192.168.2.200 weight=2  max_fails=2   fail_timeout=10;
}

......
server {
     listen   80;
     server_name www.tarena.com;
     location  / {
     proxy_pass http://webserver;
     }
   }
...
