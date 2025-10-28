#!/bin/bash
src="https://raw.githubusercontent.com/sulincix-other/debloat-debian/refs/heads/master/"
packages=()
for list in gnome misc xfce pardus; do
    packages+=($(curl -L "$src"/list/$list.list))
done
bloat=()
for p in ${packages[@]} ; do
    if dpkg -s "$p" 2>/dev/null ; then
        bloat+=("$p")
    fi
done
hold=()
hold_list=(xfce4 gnome-core network-manager)
for p in ${hold_list[@]} ; do
    if dpkg -s "$p" 2>/dev/null; then
        hold+=($p)
    fi
done

# remove bloats
apt purge ${bloat[@]} -y
for script in libreoffice nosystemd gnome misc; do
    curl -L "$src"/script/"$script".sh | bash
done
# fix packages
apt install ${hold[@]} --no-install-recommends -y
apt autoremove --purge -y