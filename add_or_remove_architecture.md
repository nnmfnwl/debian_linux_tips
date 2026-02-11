#### About
  * all command must be executed as superuser or with sudo
  * could be useful to add for example i386 architecture into amd64 system to install and use WINE
  * source of info https://wiki.debian.org/Multiarch/HOWTO and https://superuser.com/questions/714391/how-do-i-remove-all-i386-architecture-packages-from-my-debian-installation
#### Usage - how to add another architecture into system
  * add `i386` arch to system
  * update list of all available packages in repositories
  * install for example `libc6` base `i386` package into system
```
archname="i386"
dpkg --add-architecture ${archname}
apt update
apt install libc6:${archname}
```
#### Usage - how to remove architecture from system
  * print foreign added architectures already included in system
  * remove all i386 packages
  * finally remove i386 architecture from system
```
archname="i386"
dpkg --print-foreign-architectures
apt purge ".*:${archname}" --allow-remove-essential
dpkg --remove-architecture ${archname}
```
