#### About
  * Encrypt user home directory

#### Installation and Dependencies as ROOT account
  * install dependency packages
```
apt update
apt full-upgrade
apt install fscrypt libpam-fscrypt
```
  * setup user home directory encryption
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
