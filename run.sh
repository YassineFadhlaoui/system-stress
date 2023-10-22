#!/bin/bash
stop_stress(){
    echo "Stopping stress process: CTRL+C received"
    exit 0
}
trap 'stop_stress' SIGINT
while true
do
    stress_time=$(( ( RANDOM % 5 )  + 1 ))
    memory_mbytes=$(( ( RANDOM % 50 )  + 1 ))
    echo "Starting stress process with the following: stress time: $stress_time, 1 cpu stressor, 1 ram stressor using $memory_mbytes MB of memory"
    stress-ng --cpu 1 --vm 1 --vm-bytes "$memory_mbytes"m --timeout "$stress_time"s --metrics-brief
    sleep_time=$(( ( RANDOM % 5 )  + 1 ))
    echo "sleeping for $sleep_time"
    sleep $sleep_time
done