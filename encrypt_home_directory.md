#### About
  * Encrypt user home directory

#### Installation and Dependencies as ROOT account
  * install dependency packages
```
apt update
apt full-upgrade
apt install fscrypt libpam-fscrypt
```
  * setup encryption of user home directory
  * using sda device
  * using user named user2
```
devname=sda
username=user2
tune2fs -O encrypt /dev/${devname}
fscrypt setup
fscrypt setup /home
mv /home/${username} /home/${username}.bak
mkdir /home/${username}
chown ${username}:${username} /home/${username}
chmod 700 /home/${username}
fscrypt encrypt /home/${username} --user=${username}
rsync -avH /home/${username}.bak /home/${username}
srm -rfl /home/${username}.bak
```

#### Examples
  * How to start VNC remote desktop service for username user2 that runs on on encrypted home directory
  * So to initiate like session on encrypted home directory for user2 on VNC session 2 for port 5902:
```
username=user2
uservncid=2
su - ${username} -c "su - -c 'systemctl start tigervncserver@\:${uservncid}.service'"
```
