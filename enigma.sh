#! /usr/bin/env bash

# comment out check_valid function for now
: <<'COMMENT'
check_valid(){
    # regular expression for Capital letters and spaces
    re='^[A-Z ]+$' 
    if [[ "$1" =~ $re ]]; then
        echo "This is a valid message!"
    else
        echo "This is not a valid message!"
    fi
}
COMMENT

#check valid character
check_char(){
    re='^[A-Z]$' 
    if [[ "$1" =~ $re ]]; then
        return 0
    else
        return 1
    fi
}
check_key(){
    re='^[0-9]$' 
    if [[ "$1" =~ $re ]]; then
        return 0
    else
        return 1
    fi
}
encrypt() {
    value=$(printf "%d\n" "'$1")
    new_value=$(($value+ $2))
    if [ "$new_value" -gt 90 ]; then
        new_value=$(($new_value - 26))
    fi
    encrypted_char=$(printf "%b\n" "$(printf "\\%03o" "$new_value")")
    echo "Encrypted letter: $encrypted_char"
}
echo "Enter an uppercase letter:"
read letter
echo "Enter a key:"
read key
if check_char "$letter"  &&  check_key "$key" ; then
    encrypt $letter $key
else
    echo "Invalid key or letter!"
fi
