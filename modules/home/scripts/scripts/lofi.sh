#!/usr/bin/env bash

if (ps aux | grep mpv | grep -v grep > /dev/null); then
    pkill mpv
else
   runbg mpv --no-video https://www.youtube.com/watch?v=t8OZPJfpcTM
fi
