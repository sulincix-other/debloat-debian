apt update
# Block service invoke
echo -e  "#!/bin/sh\nexit 101" > /usr/sbin/policy-rc.d
chmod +x /usr/sbin/policy-rc.d
# Remove systemd preremove script.
rm -f /var/lib/dpkg/info/systemd.p*
# Install sysv-init and elogind
apt install elogind sysvinit-core sysv-rc systemd- systemd-sysv- -y --allow-remove-essential
apt-mark hold systemd libsystemd0 libsystemd-shared
apt install -f
apt full-upgrade -y
apt autoremove -y
wget https://github.com/aleyna-tilki/pipewire-launcher/releases/download/current/pipewire-launcher_1.0.0_all.deb -O /tmp/pipewire-launcher_1.0.0_all.deb
dpkg -i /tmp/pipewire-launcher_1.0.0_all.deb
rm -f /tmp/pipewire-launcher_1.0.0_all.deb
