if (( $EUID != 0 )); then
        echo "please run as root"
        exit
fi



if (($OSTYPE != "linux-gnu")); then
        echo "this script is for GNU/Linux only:"
        exit
fi

DNF=$(ls /etc/ | grep dnf);

if (( $DNF != "dnf")); then
        echo "this script only works for fedora based systems"
        exit
fi      


echo "Fedora Network Fixer"
echo " this program will set fedora networking back to legacy (workstation23)\n"
echo "THIS PROGRAM DOES NOT COME WITH ANY WARRENTY OR WAY TO RESET FEDORA NETWORKING"
echo "do you wish to continue? Y/n"

read YorN

if [ $YorN = "n" ]; then
        exit
fi

dnf install crypto-policies-scripts -y

update-crypto-policies --set LEGACY

update-crypto-policies --set DEFAULT:FEDORA32
