#!/bin/bash
find twittercache/logs/ -mindepth 1 -type d -exec rm -rf {} +
rm twittercache/logs/application.log

