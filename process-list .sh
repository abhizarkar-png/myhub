#!/bin/bash 

ps -ef | grep apache2 | wc -l

if [ "$#" != "50" ]; then
service apache2 restart
fi