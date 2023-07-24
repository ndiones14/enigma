#! /usr/bin/env bash


#main display
display() {
    echo -e "\n0. Exit"
    echo "1. Create a file"
    echo "2. Read a file"
    echo "3. Encrypt a file"
    echo "4. Decrypt a file"
    echo "Enter an option:"
}

# comment out check_valid function for now
check_valid_file(){
    # regular expression for letters and dots
    re='^[a-zA-Z.]+$' 
    if [[ "$1" =~ $re ]]; then
        return 0
    else
        return 1
    fi
}

check_valid_message(){
    # regular expression for Capital letters and spaces
    re='^[A-Z ]+$' 
    if [[ "$1" =~ $re ]]; then
        return 0
    else
        return 1
    fi
}

function1(){
    echo "Enter the filename:"
    read file_name
    if check_valid_file $file_name; then
        echo "Enter a message:"
        read message
        if check_valid_message "$message"; then
            touch $file_name
            echo "$message" >> $file_name
            echo "The file was created successfully!"
        else
            echo "This is not a valid message!"
        fi
    else
        echo "File name can contain letters and dots only!"
    fi
}
function2 (){
    echo "Enter the filename:"
    read file_name
    if [[ -f $file_name ]]; then
        echo "File content:"
        cat $file_name
    else
        echo "File not found!"
    fi
}

function3(){
    echo "Not implemented!"
}

function4(){
    echo "Not implemented!"
}

selection() {
    
    case $1 in
        0)
            # Exits Program
            echo "See you later!"
            return 0
            ;;        

        1)
            # Create a File
            function1
            ;;
        2)
            # Read a File
            function2
            ;;

        3)
            # Encrypt a File
            function3
            ;;
        4)
            # Decrypt a File
            function4
            ;;        
        *)
            # Default Case
            echo "Invalid option!"
            ;;
    esac
    return 1
}

echo "Welcome to the Enigma!"
while true
do

    display
    read choice
    if selection $choice; then
        break
    fi
done