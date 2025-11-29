echo "script requeres su or sudo permissions"

echo "update packages list"
apt update

echo "do full upgrade"
apt full-upgrade

echo "install apt show versions for sure"
apt install apt-show-versions

echo "use apt show versions to select packages which are not uptodate and not installer and not upgradeable and purge them"
apt purge `apt-show-versions | grep -v "uptodate$" | grep -v "not\ installed$" | grep -v "\ upgradeable\ " | cut -d " " -f1`

echo "use dpk list to list all packages and filter out only those with residual configuration to purge them"
apt-get purge `dpkg --list | grep ^rc | cut -d " " -f3`
