# Alpine xfce4 noVNC
Simple and minimal Alpine Docker Image providing XFCE4 through html5 noVNC connection

<div align="center">

![GitHub repo size](https://img.shields.io/github/repo-size/novaspirit/Alpine_xfce4_noVNC?label=Repo%20Size&logo=github)
![Docker Build](https://github.com/novaspirit/Alpine_xfce4_noVNC/workflows/Docker/badge.svg) 
![Docker Pulls](https://img.shields.io/docker/pulls/novaspirit/Alpine_xfce4_noVNC)
![Docker Size](https://img.shields.io/docker/image-size/novaspirit/Alpine_xfce4_noVNC)

![preview](preview.png?raw=true "preview")

</div>

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
