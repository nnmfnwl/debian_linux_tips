#### About
  * How to mine XMR but get rewards in BTC USD or XNO
  * The reason why you would like to be rewarded for mining in NanBTC(BTC) NanUSD(USDC) or Nano(XNO) is that those currencies has absolutely no transaction fees and having instant transactions. So you can use them directly or exchnage later into BTC or whatever you want.
  * NanBTC is Bitcoin backed token in XNO network
  * NanUSD is USDC backed token in XNO network
  * Nano is native XNO network crypto currency that has NO fees and NO inflation and also NO mining rewards

#### Installation and Dependencies as ROOT account
  * install dependency packages, commands needs root permissions or sudo
  * mandatory packages
```
apt update
apt full-upgrade
apt install msr-tools tor proxychains4 clamav
```
  * recommended packages installation
  * cpu power to tune hardware limits and so prevent overheating
  * lm-sensors to see current CPU temperature
  * screen great for multiplexing multiple terminal sessions over one SSH
```
apt install linux-cpupower lm-sensors screen 
```

#### Miner installation and configuration as USER account
  * Download and check xmrig package
```
xmrigv="6.26.0" &&
xmrig="xmrig-${xmrigv}-linux-static-x64.tar.gz" &&
xmrigsha="fc6f8ae5f64e4f17481f7e3be29a1c56949f216a998414188003eae1db20c9e5" &&
mkdir -p ~/dexsetup/xmrig/ &&
cd ~/dexsetup/xmrig/ &&
rm -f ${xmrig} &&
proxychains4 wget "https://github.com/xmrig/xmrig/releases/download/v${xmrigv}/${xmrig}" &&
(sha256sum ${xmrig} | grep "${xmrigsha}" && (echo "${xmrig} fingerprint verification success") || (sha256sum ${xmrig}; echo "${xmrig} fingerprint verification failed"; rm -f ${xmrig}; false)) &&
tar --extract -f "${xmrig}" -C "./" &&
(clamscan * || (rm -f ${xmrig}* && echo "downloaded package seems compromised by evil")) &&
echo "${xmrig} prepare success"
```
  * it is recommended to visit links from this tutorial in Tor Browser to keep your privacy at highest level
  * to install tor browser in very secure way with isolated profile you can use dexinstaller or dangerously visit official page
```
https://github.com/nnmfnwl/dexinstaller
```
```
https://www.torproject.org/download/
```
  * setup Nano(XNO) wallet or Nano multiwallet
  * Good Web based Nano wallet is Nault
```
https://nault.cc/
```
  * Good Nano multiwallet which have all supported No Fee coins is NanChat
```
https://nanchat.com/
https://github.com/yxse/NanChat/releases
```
#### Usage
  * It is recommended to start screen first
  * open one more screen terminal tab `CTRL a c`
  * list and switch between opened tabs `CTRL a "`
  * switch between last two selected tabs `CTRL a a`
  * detach from screen and keep all programs running `CTRL a d`
  * to attach to existing in backround running `screen -x`
```
screen
```
  * in screen 0 open the miner and start or continue mining
  * But before you have to replace `YOUR_ADDRESS` with your real XNO/NanBTC/NanUSD or other supported coin address
  * Depending on your CPU cores you can replace -t 4 with -t 6 or whatever number of real CPU cores you want to use for mining
```
cd ~/dexsetup/xmrig/xmrig-6.26.0 && proxychains4 ./xmrig -o xmrig.nanswap.com:3333 -a rx -k -u YOUR_ADDRESS -p x -t 4
```
  * use `CTRL a c` to open one more screen tab and check current machine temperature and configuration
```
sensors | grep -e Core ; cpupower frequency-info | grep -e "hardware limits" -e "The governor" -e "current policy" -e "asserted" ; echo "" ; echo ""
```
  * for any cases if your machine gets overheating, to prevent damage, you can as ROOT reconfigure CPU performance
  * for example limit maximum machine CPU frequency to 1.5 GHZ by `freq=1.5G`
  * Below command needs specify value of `freq` variable before usage
```
freq= &&
cpupower --cpu all frequency-set --max ${freq}
```
  * After a while you can chec/monitor/request to withdrawal mined funds to your address at:
```
https://nanswap.com/mining/nano
```
  * Enjoy the time :-)
