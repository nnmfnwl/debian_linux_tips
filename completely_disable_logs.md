#### About
  * disabling all logging if linux system use systemd
  * could be useful to increase hard drive or SSD lifetime
#### Usage
  * edit systemd journald configuration file and
```
joe /etc/systemd/journald.conf
```
  * replace line Storage= or `#Storage=auto` to reserve no storage for logger
```
Storage=none
```
  * restart systemd journald service to apply new configuration
```
systemctl restart systemd-journald
```
  * cleanup all all existing systemd journald log files
```
journalctl --rotate && journalctl --vacuum-time=1s
rm -R /run/log/journal/*
rm -R /var/log/journal/*
```
  * test and check if output is `No journal files were found.`
```
journalctl -f
```
