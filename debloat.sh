packages=$(cat gnome.list)
bloat=()
for p in ${packages[@]} ; do
    if dpkg -s "$p" ; then
        bloat+=("$p")
    fi
done
# remove bloats
apt purge ${bloat[@]} -y
apt purge libreoffice-* -y
