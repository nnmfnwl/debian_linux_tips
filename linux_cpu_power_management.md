#### About
  * CPU maximum frequency and profiles manageemnt
  * could be useful to limit CPU when running crypto miners, compilers, video converting... to not burn your machine.
#### Installation
  * install packages
  * commands needs root permissions or sudo
```
apt update
apt full-upgrade
apt install linux-cpupower
```
#### Usage
  * cpu management set commands needs root permissions
  * example to limit all CPU cores to 2.7GHZ frequency
```
freq=2.7G && cpupower --cpu all frequency-set --max ${freq}
```
  * example to check current configuration
```
cpupower --cpu all frequency-info | grep -e limits -e governors -e policy -e current
```
