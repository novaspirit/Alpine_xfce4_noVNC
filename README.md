# Alpine xfce4 noVNC
Simple and minimal Alpine Docker Image providing XFCE4 with html5 noVNC connection

![preview](preview.png?raw=true "preview")

#### Build Image

```sh
git clone https://github.com/novaspirit/Alpine_xfce4_noVNC.git
docker build -t alpine-xfce4 Alpine_xfce4_noVNC/
```

#### Run Image

```sh
docker run -it -p 6080:6080 --name alpine-novnc alpine-xfce4
```

#### Connect With noVNC

Use modern browswer to connect to http://(docker ip):6080/vnc.html

the predefined password is `alpine`

#### LICENCE

MIT
