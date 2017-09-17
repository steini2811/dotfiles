#!/bin/bash

if [ -z $1 ]
  then
    echo "missing argument <streamname>"
    exit 1
fi

if [ -z $2 ]
  then
    livestreamer twitch.tv/$1 --default-stream 1080p60,1080p30,900p60,900p30,720p60,720p30,source,best --http-header Client-ID=jzkbprff40iqj646a697cyrvl0zt2m6
  else
    livestreamer twitch.tv/$1 --default-stream $2 --http-header Client-ID=jzkbprff40iqj646a697cyrvl0zt2m6
fi
