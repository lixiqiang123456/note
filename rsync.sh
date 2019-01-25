#!/bin/bash
while inotifywait  -rqq  /usr/local/nginx/html/index.php
 do
 rsync  --delete  -az   /usr/local/nginx/html/index.php      root@201.1.2.200:/usr/local/nginx/html/index.php
done
