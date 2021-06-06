#!/bin/bash

while true
do
    /opt/blockram.elf
    sh /opt/spinv_webpage.sh &
    sleep 1
    pkill spinv_webpage.sh
    pkill busybox
done