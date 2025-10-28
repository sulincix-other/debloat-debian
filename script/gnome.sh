apt purge --autoremove gnome-shell-extension* -y
# if gdm3 installed. remove and replace with lightdm
if dpkg -s gdm3 2>/dev/null ; then
    apt purge gdm3 --automerove -y
    apt install lightdm lightdm-gtk-greeter -y
fi