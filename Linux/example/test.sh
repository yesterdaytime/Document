#
#
# Script to print user information who currently login , current date & time
#
clear
echo "Hello $USER"
echo "Today is \n ";date
echo "Number of user login : \n" ; who | wc -l
echo "Calendar"
cal
exit 0
