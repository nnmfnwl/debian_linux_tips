#### About
  * exposiing your local service anonymously by tor hidden service v3
  * could be useful to setup crypto master node without having public ip address
#### Usage
  * all commands needs root permissions
  * at first install tor
```
apt update && apt full-upgrade && apt install tor
```
  * edit tor configuration file and add new service to be exposed
```
joe /usr/share/tor/tor-service-defaults-torrc
```
  * at first check all below configuration options, add lines if missing
```
CookieAuthentication 1
CookieAuthFileGroupReadable 1
```
  * name and define local service which you want expose
  * below example is to expose ssh service at port 2222 redirected into local service port 22
```
HiddenServiceDir /var/lib/tor/ohs-ssh/
HiddenServiceVersion 3
HiddenServicePort 2222 127.0.0.1:22
```
  * restart tor service
```
service tor@default restart
```
  * check if tor restart success and running. look at `Active: active (running)` 
```
service tor@default status
```
  * finally read your public service address. Succeess is to see something like `abcdefgh1234567890abcdefgh1234567890.onion`
```
cat /var/lib/tor/ohs-ssh/hostname
```
