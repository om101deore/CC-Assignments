if [[ $(grep "debian" /etc/os-release) ]]; then
    echo "debian based system recognised"
    sudo apt update
    sudo apt upgrade
    sudo apt install python3

elif [[ $(grep "arch" /etc/os-release) ]]; then
    echo "arch based system recognised"
    sudo pacman -Syu
    sudo pacman -S python-pip

elif [[ $(grep "fedora" /etc/os-release) ]]; then
    echo "fedora based system recognised"
    sudo dnf upgrade
    sudo dnf install python
else
    echo "unknown system recognised"
fi
