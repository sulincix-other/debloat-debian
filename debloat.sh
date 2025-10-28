#!/bin/bash
src="https://raw.githubusercontent.com/sulincix-other/debloat-debian/refs/heads/master/"
packages=()
for list in gnome misc ; do
    packages+=$(curl -L "$src"/list/$list.list)
done
bloat=()
for p in ${packages[@]} ; do
    if dpkg -s "$p" 2>/dev/null ; then
        bloat+=("$p")
    fi
done
# remove bloats
apt purge ${bloat[@]} --autoremove -y
for script in libreoffice nosystemd gnome ; do
    curl -L "$src"/script/"$script".sh | bash
done