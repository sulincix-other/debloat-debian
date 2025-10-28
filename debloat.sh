#!/bin/bash
src="https://raw.githubusercontent.com/sulincix-other/debloat-debian/refs/heads/master/"
packages=()
for list in gnome misc ; do
    packages+=$(curl -L "$src"/list/$list.list)
done
bloat=()
for p in ${packages[@]} ; do
    if dpkg -s "$p" ; then
        bloat+=("$p")
    fi
done
# remove bloats
apt purge ${bloat[@]} -y
for script in libreoffice pardus nosystemd ; do
    bash <(curl "$src"/script/"$script".sh)
done