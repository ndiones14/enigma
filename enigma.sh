#! /usr/bin/env bash

# comment out check_valid function for now
check_valid(){
    # regular expression for Capital letters and spaces
    re='^[A-Z ]+$' 
    if [[ "$1" =~ $re ]]; then
        return 0
    else
        echo "This is not a valid message!"
        return 1
    fi
}


#check valid character

encrypt_message() {
    new_string=""
    for (( i=0; i<${#1}; i++ )); do
        current_char="${1:i:1}"
        if [[ "$current_char" == " " ]]; then
            new_string+=" "
            continue
        else
            ascii_code=$(printf "%d\n" "'$current_char")
            ascii_code=$(($ascii_code + 3))
            if [ "$ascii_code" -gt 90 ]; then
                ascii_code=$(($ascii_code - 26))
            fi
            encrypted_char=$(printf "%b\n" "$(printf "\\%03o" "$ascii_code")")
            new_string+="$encrypted_char"
        fi
    done
    echo "Encrypted message:"
    echo "$new_string"

}

encrypt() {
    echo "Enter a message:"
    read message
    if check_valid $message ; then
        encrypt_message "$message"
    fi

}

decrypt_message() {
    new_string=""
    for (( i=0; i<${#1}; i++ )); do
        current_char="${1:i:1}"
        if [[ "$current_char" == " " ]]; then
            new_string+=" "
            continue
        else
            ascii_code=$(printf "%d\n" "'$current_char")
            ascii_code=$(($ascii_code - 3))
            if [ "$ascii_code" -lt 65 ]; then
                ascii_code=$(($ascii_code + 26))
            fi
            decrypted_char=$(printf "%b\n" "$(printf "\\%03o" "$ascii_code")")
            new_string+="$decrypted_char"
        fi
    done
    echo "Decrypted message:"
    echo "$new_string"

}

decrypt() {
    echo "Enter a message:"
    read message
    if check_valid $message ; then
        decrypt_message "$message"
    fi

}

echo "Type 'e' to encrypt, 'd' to decrypt a message:"
echo "Enter a command:"
read command

case $command in
    'e')
        # Does Encryption
        encrypt
        ;;        

    'd')
        # Does Decryption
        decrypt
        ;;
 
    *)
        # Default Case
        echo "Invalid command!"
        ;;
esac

