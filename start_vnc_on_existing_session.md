#### About
  * how to start VNC server on already existing user session
  * could be useful to never need to logout and keep working from else place
#### Usage
  * install vnc scraping server as root
```
apt install tigervnc-scraping-server:
```
  * start VNC on existing user session as inside terminal
```
x0tigervncserver -localhost yes -PasswordFile ~/.vnc/passwd -display :0 -rfbport 5902
```
