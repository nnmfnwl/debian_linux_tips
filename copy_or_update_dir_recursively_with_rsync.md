#### About
  * How to copy or update data recursively with rsync
  * Useful for remote tasks
#### Usage
  * at first install rsync on both machines
```
apt update && apt full-upgrade && apt install rsync
```
  * use rsync as following
```
rsync --compress --archive --verbose --partial --progress /src/path/ /dst/path
```
  * source and destination path could be local or remote server for example
```
username@hostname:/home/usernmae/data/
/home/username/data/
```
