#! /bin/bash
a=$1

if [ $a -lt 10 ]; then
    echo "$a is less than 10"
else 
    echo "$a is 10 or greater"
fi       

# -gt  -eq  -ne 
