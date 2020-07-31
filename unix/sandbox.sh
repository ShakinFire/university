# CITB653
# Name: Georgi Enev
# FN: F97402

echo '===================== TASK 1 ====================='
# find - recursively descends the directory tree for each path listed
# . - represent the current directory
# -type f - option for only selects files (`-type d` is only for directories)
# -name "6???2*" - searching for a specific name with the given pattern "6???2*"
find . -type f -name "6???2*"

echo '===================== TASK 2 ====================='
# Same commands but with different pattern for the file name "*ing" (* - stands for all the characters)
find . -type f -name "*ing"

echo '===================== TASK 3 ====================='
# Pattern:
# [1-5] - numbers from 1 to 5 (1, 2, 3, 4, 5)
# [5-9] - numbers from 5 to 9 (5, 6, 7, 8, 9)
# [a-k] - letters from a to k (note: this works only for lower case characters)
# ['f'|'k'|'x'|'z'] - only characters 'f', 'k', 'x' or 'z'
# ['.'|')'] - only character '.' or ')'
# * - every character
find . -type f -name "[1-5][5-9][a-k]['f'|'k'|'x'|'z']['.'|')']*"

echo '===================== TASK 4 ====================='
find . -type f -name " *"

echo '===================== TASK 5 ====================='
# -E - uses the extended syntax for regexes
# -regex match pattern - the string which follows the last slash in the file path must be exactly 20 characters.
# Note: If we want larger than 20 characters we just add ',' to the regex like this ".*/[^/]{20,}"
find -E . -type f -regex ".*/[^/]{20}"

echo '===================== TASK 6 ====================='
find . -type f -name ".*"

echo '===================== TASK 7 ====================='
find . -type f -name "*.????"

echo '===================== TASK 8 ====================='
# pwd - printing the current working directory
find $(pwd) -type f

echo '===================== TASK 9 ====================='
# grep - file pattern searcher
# /etc/passwd - text file with all the users
echo "The example is for root because I haven't creatd a user with name Ivan"
grep '^root' /etc/passwd

echo '===================== TASK 10 ====================='
# useradd - creating a user
# || - if creating the user resolved to false a.k.a errors out then display "User already exists." in the console
useradd Ivan || echo "User already exists."
echo "This will error out because 'useradd' is not working on mac but that's the correct command for unix"

# TASK 12
# chown - change file owner and group
# -R - Change the user ID and/or the group ID for the file hierarchies rooted in the files instead of just the files themselves
# root - the user we give ownership
# ~/* - all files from root directory recursivly
# chown -R root ~/*

echo '===================== TASK 17 ====================='
# ps - displays a header line, followed by lines containing information about all of your processes that have controlling terminals.
# aux:
#       a - show processes for all users
#       u - display the process's user/owner
#       x - also show processes not attached to a terminal
# | - pipe the process to another one
# wc - displays the number of lines, words, and bytes contained in each input file
# -l - the number of lines in each input file is written to the standard output
ps aux | wc -l
