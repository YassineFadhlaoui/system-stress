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
    echo -e "\e[34m\e[1mStarting stress process with the following:\e[0m\n\e[1m* Stress time:\e[0m \e[7m$stress_time seconds\e[0m\n\e[1m* CPU stressor: \e[0m\e[7m 1\e[0m\n\e[1m* RAM stressor: \e[0m\e[7m1 using $memory_mbytes MB of memory\e[0m"
    stress-ng --cpu 1 --vm 1 --vm-bytes "$memory_mbytes"m --timeout "$stress_time"s --metrics-brief
    sleep_time=$(( ( RANDOM % 5 )  + 1 ))
    echo "sleeping for $sleep_time"
    sleep $sleep_time
done