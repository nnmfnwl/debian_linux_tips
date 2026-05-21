#### About
  * prepare Debian Trixie for Playing Windows games with DXVK(directx over vulkan)
  * install system graphical library dependencies and drivers, vulkan spirv etc...
  * setup system to use latest wine staging
  * download dxvk to use vulkan instead of d3d because it has much better performance even on windows...

#### Installation and Dependencies as `ROOT` account so it need `SU` or `SUDO`
  * login into superuser 
```
su -
```
  * add 386 architecture to system, bcause most of wine programms require it
```
archname="i386"
dpkg --add-architecture ${archname}
apt update
apt full-upgrade
apt install libc6:${archname}
```
  * add latest wine staging official repositories (source https://gitlab.winehq.org/wine/wine/-/wikis/Debian-Ubuntu)
```
mkdir -pm755 /etc/apt/keyrings
wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo gpg --dearmor -o /etc/apt/keyrings/winehq-archive.key -
rm -f /etc/apt/sources.list.d/winehq-trixie.sources 
wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/trixie/winehq-trixie.sources
apt update
```
  * install wine version staging
```
apt install --install-recommends winehq-staging
```
  * install all graphicl libraries, drivers and firmwares for various hardware, if you know that you have intel/amd/nvidia, then you can skip some pf packages
```
apt install mesa-vulkan-drivers mesa-vulkan-drivers:i386 mesa-utils mesa-utils-bin libosmesa6 libosmesa6:i386 libvulkan1 libvulkan1:i386 mesa-vulkan-drivers mesa-vulkan-drivers:i386 vulkan-tools vulkan-validationlayers libvulkan-dev libvulkan-dev:i386 spirv-tools libspirv-cross-c-shared0 firmware-amd-graphics firmware-intel-graphics firmware-intel-misc firmware-linux-free firmware-misc-nonfree firmware-nvidia-graphics intel-microcode amd64-microcode libdrm-amdgpu1 libdrm-amdgpu1:i386 libdrm-intel1:i386 libdrm-nouveau2 libd3dadapter9-mesa 
```
  * recommended packages installation
```
apt install linux-cpupower lm-sensors clamav 
```
  * exit root permission
```
exit
```

#### DXVK(directx over vulkan) installation and configuration as USER account
  * Download and check dxvk package
```
pkgversion="2.7.1" &&
pkgname="dxvk-${pkgversion}.tar.gz" &&
pkgsha="d85ce7c79f57ecd765aaa1b9e7007cb875e6fde9f6d331df799bce73d513ce87" &&
mkdir -p ${HOME}/wineprefix/ &&
cd ${HOME}/wineprefix/ &&
rm -f ${pkgname} &&
wget "https://github.com/doitsujin/dxvk/releases/download/v${pkgversion}/${pkgname}" &&
(sha256sum ${pkgname} | grep "${pkgsha}" && (echo "${pkgname} fingerprint verification success") || (sha256sum ${pkgname}; echo "${pkgname} fingerprint verification failed"; rm -f ${pkgname}; false)) &&
tar --extract -f "${pkgname}" -C "./" &&
(clamscan ${pkgname} || (rm -f ${pkgname}* && echo "downloaded package seems compromised by evil"; false)) &&
echo "${pkgname} prepare success"
```

#### Prepare Wine wineprefix for example for World Of Tanks
  * at first we need to create wine prefix
  * if asked please set `Wine Mono` to `Install`
```
WINEPREFIX="${HOME}/wineprefix/wot/" winecfg
```
  * at tab Applications set `Windows version` select `Windows 10`
```
Windows 10
```

#### Set Wineprefix to use DXVK instead of directx
  * reconfigure wineprefix to use DXVK
  * whole command MUST be entered again every time WINE updates
```
# dxvk version set
pkgversion="2.7.1"

# change directory
cd ${HOME}/wineprefix/dxvk-${pkgversion}

# copy dxvk vulkan d3d files
cp x64/* ${HOME}/wineprefix/wot/drive_c/windows/system32/
cp x32/* ${HOME}/wineprefix/wot/drive_c/windows/syswow64/

# register the dlls
cd ${HOME}/wineprefix/wot/
WINEPREFIX="${HOME}/wineprefix/wot/" wine reg add 'HKEY_CURRENT_USER\Software\Wine\DllOverrides' /v d3d11 /d native /f
WINEPREFIX="${HOME}/wineprefix/wot/" wine reg add 'HKEY_CURRENT_USER\Software\Wine\DllOverrides' /v d3d10core /d native /f
WINEPREFIX="${HOME}/wineprefix/wot/" wine reg add 'HKEY_CURRENT_USER\Software\Wine\DllOverrides' /v d3d9 /d native /f
WINEPREFIX="${HOME}/wineprefix/wot/" wine reg add 'HKEY_CURRENT_USER\Software\Wine\DllOverrides' /v d3d8 /d native /f
WINEPREFIX="${HOME}/wineprefix/wot/" wine reg add 'HKEY_CURRENT_USER\Software\Wine\DllOverrides' /v dxgi /d native /f

# fix sounds issues
WINEPREFIX="${HOME}/wineprefix/wot/" wine reg add "HKEY_CURRENT_USER\Software\Wine\DllOverrides" /v "xaudio2_7" /t REG_DWORD /d 00000000 /f
WINEPREFIX="${HOME}/wineprefix/wot/" wine reg add "HKEY_CURRENT_USER\Software\Wine\DllOverrides" /v "xaudio2_8" /t REG_DWORD /d 00000000 /f
WINEPREFIX="${HOME}/wineprefix/wot/" wine reg add "HKEY_CURRENT_USER\Software\Wine\DllOverrides" /v "xaudio2_9" /t REG_DWORD /d 00000000 /f
```

#### Download World of tanks installer
  * download world of tanks installer
```
cd ${HOME}/wineprefix/wot/drive_c/
rm -f wotinstaller.exe
wget https://redirect.wargaming.net/WoT/latest_web_install_eu -O wotinstaller.exe
```

#### Run World of tanks installer
  * run WOT installer
```
WINEPREFIX="${HOME}/wineprefix/wot/" wine ${HOME}/wineprefix/wot/drive_c/wotinstaller.exe
```

#### Run world of tanks with customizations for better performance
  * please read inline and update command by your wishes and system hardware
```
# set max limit to 50 FPS
export DXVK_FRAME_RATE=50

# we expect to have 8 CORE CPU and set game to use them all from ID 0 to ID 7
export WINE_CPU_TOPOLOGY=8:0,1,2,3,4,5,6,7

# set vulkan ingame HUD
#export DXVK_HUD=fps,frametimes,gpuload,api,scale=2,opacity=0.1
export DXVK_HUD=fps

# run game
WINEPREFIX="${HOME}/wineprefix/wot/" wine ${HOME}/wineprefix/wot/drive_c/Program\ Files\ \(x86\)/Wargaming.net/GameCenter/wgc.exe
```
