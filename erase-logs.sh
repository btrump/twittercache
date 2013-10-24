#!/bin/bash
find twittercache/logs/ -mindepth 1 -type d -exec rm -rf {} +
rm -rf twittercache/logs/*.log
touch twittercache/logs/application.log
chmod a+rw twittercache/logs/application.log

