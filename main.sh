if (( $EUID != 0 )); then
        echo "Please execute as root."
        exit
fi



if (($OSTYPE != "linux-gnu")); then
        echo "This script is for GNU/Linux only."
        exit
fi

DNF=$(ls /etc/ | grep dnf);

if (( $DNF != "dnf")); then
        echo "This script only works for Fedora based systems."
        exit
fi      


echo "Fedora Network Fixer"
echo "This program will set Fedora networking back to legacy (workstation23)\n"
echo "THIS PROGRAM DOES NOT COME WITH ANY WARRENTY OR WAY TO RESET FEDORA NETWORKING"
echo "Do you wish to continue? Y/n"

read YorN

if [ $YorN = "n" ]; then
        exit
fi

dnf install crypto-policies-scripts -y

update-crypto-policies --set LEGACY

update-crypto-policies --set DEFAULT:FEDORA32
