#! /bin/bash

start_time=$(date +%s)
sleep 10
end_time=$(date +%s)
Total_time=$(($end_time-$start_time))

echo "script execution time: $Total_time seconds"