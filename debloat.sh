#!/bin/bash
src="https://raw.githubusercontent.com/sulincix-other/debloat-debian/refs/heads/master/"
packages=$(curl -L "$src"/gnome.list)
bloat=()
for p in ${packages[@]} ; do
    if dpkg -s "$p" ; then
        bloat+=("$p")
    fi
done
# remove bloats
apt purge ${bloat[@]} -y
apt purge libreoffice-* -y
bash <(curl "$src"/nosystemd.sh)