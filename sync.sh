echo '--------------------------------------------------------------------------------' >> /etc/somscript/sync.log
echo `date`
echo 'Time ->'  `date +%Y-%m-%H\ %k:%M:%S` >> /etc/somscript/sync.log
rsync -auv -e 'ssh -p 2289' --delete www-data@api1.prioticket.com:/var/www/html/api.prioticket.com /var/www/html --exclude-from '/etc/somscript/exclude-list.txt'
echo 'Time ->'  `date +%Y-%m-%H\ %k:%M:%S` >> /etc/somscript/sync.log
rsync -avz -e 'ssh -p 2289' www-data@api1.prioticket.com:/var/www/html/api.prioticket.com /var/www/html --exclude-from '/etc/somscript/exclude-list.txt'
exit
