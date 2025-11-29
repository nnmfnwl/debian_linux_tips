#### commands requires su or sudo permissions

#### update packages list
```
apt update
```

#### do full upgrade
```
apt full-upgrade
```

#### install apt show versions for sure
```
apt install apt-show-versions
```

#### use apt show versions to select packages which are not uptodate and not installer and not upgradeable and purge them
```
apt purge `apt-show-versions | grep -v "uptodate$" | grep -v "not\ installed$" | grep -v "\ upgradeable\ " | cut -d " " -f1`
```

####  use dpk list to list all packages and filter out only those with residual configuration to purge them
```
apt-get purge `dpkg --list | grep ^rc | cut -d " " -f3`
```
