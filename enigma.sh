#! /usr/bin/env bash
check_valid(){
    # regular expression for Capital letters and spaces
    re='^[A-Z ]+$' 
    if [[ "$1" =~ $re ]]; then
        echo "This is a valid message!"
    else
        echo "This is not a valid message!"
    fi
}
echo "Enter a message:"
read message
# call check_valid function
check_valid "$message"