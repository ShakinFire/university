echo "This is an exam script and it's used to cover some of the topics"
echo "Георги Енев"
echo "ФН: F97402"
echo "Please choose what you want to do"

options=("Enter file names" "Enter usernames" "Save names in a file" "Count names" "Get file names paths" "Copy files into uninstall folder" "Add non existant users")

select option in "${options[@]}"; do
    case $REPLY in
    1)
        echo $option
        read names
        ;;
    2)
        echo $option
        read usernames
        for username in $usernames; do
            echo $username >>usernames.txt
        done
        ;;
    3)
        for name in $names; do
            echo $name >>file-names.txt
        done
        ;;
    4)
        echo "lines of code"
        wc -l <file-names.txt
        ;;
    5)
        while read fileName; do

            find $HOME -name ${fileName}
        done <file-names.txt
        ;;
    6)
        while read fileName; do

            filePaths=$(find $HOME -name ${fileName})

            for filePath in $filePaths
            do
                cp $filePath ./uninstall
            done
        done <file-names.txt
        ;;
    7)
        while read username; do
            isExistant=$(id -u $username)
            if [ $isExistant -eq 0 ]; then
               echo "User exists"
            else
                useradd $username
            fi
        done <usernames.txt
    esac
done
