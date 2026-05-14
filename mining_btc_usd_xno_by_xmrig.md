#### About
  * How to mine XMR but get rewards in BTC USD or XNO
  * The reason why you would like to be rewarded for mining in NanBTC(BTC) NanUSD(USDC) or Nano(XNO) is that those currencies has absolutely no transaction fees and having instant transactions. So you can use them directly or exchnage later into BTC or whatever you want.
  * NanBTC is Bitcoin backed token in XNO network
  * NanUSD is USDC backed token in XNO network
  * Nano is native XNO network crypto currency that has NO fees and NO inflation and also NO mining rewards

#### Installation and Dependencies
  * install dependency packages, commands needs root permissions or sudo
```
apt update
apt full-upgrade
apt install msr-tools tor proxychains4 clamav
```
  * Download and check xmrig package
```
xmrigv="6.26.0" &&
xmrig="xmrig-${xmrigv}-linux-static-x64.tar.gz" &&
xmrigsha="fc6f8ae5f64e4f17481f7e3be29a1c56949f216a998414188003eae1db20c9e5"
mkdir -p ~/dexsetup/xmrig/ &&
cd ~/dexsetup/xmrig/ &&
rm -f ${xmrig} &&
proxychains4 wget "https://github.com/xmrig/xmrig/releases/download/v${xmrigv}/${xmrig}" &&
(sha256sum ${xmrig} | grep "${xmrigsha}" && (echo "${xmrig} fingerprint verification success") || (sha256sum ${xmrig}; echo "${xmrig} fingerprint verification failed"; rm -f ${xmrig}; false)) &&
tar --extract -f "${xmrig}" -C "./" &&
(clamscan * || rm -f ${xmrig}*) &&
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
  * Start mining with command
  * But before you have to replace `YOUR_ADDRESS` with your real XNO/NanBTC/NanUSD or other supported coin address
  * Depending on your CPU cores you can replace -t 4 with -t 6 or whatever number of real CPU cores you want to use for mining
```
proxychains4 ./xmrig -o xmrig.nanswap.com:3333 -a rx -k -u YOUR_ADDRESS -p x -t 4
```
  * After a while you can chec/monitor/request to withdrawal mined funds to your address at:
```
https://nanswap.com/mining/
```
  * Enjoy the time :-)
