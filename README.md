# Alpine xfce4 noVNC

Simple and minimal Alpine Docker Image providing XFCE4 through html5 noVNC connection

Step by step tutorial on how this docker is created (https://www.youtube.com/watch?v=8IfTXJRAIJw)

<div align="center">

[![Discord](https://img.shields.io/discord/316245914987528193?logo=discord)](https://discord.com/invite/v8dAnFV) 
[![Youtube](https://img.shields.io/badge/YouTube-FF0000?style=flat-square&logo=youtube&logoColor=white)](https://www.youtube.com/channel/UCrjKdwxaQMSV_NDywgKXVmw) 
[![Twitter URL](https://img.shields.io/twitter/follow/novaspirittech?style=flat-square&logo=twitter)](https://twitter.com/novaspirittech)


![GitHub repo size](https://img.shields.io/github/repo-size/novaspirit/Alpine_xfce4_noVNC?label=Repo%20Size&logo=github)
![Docker Build](https://github.com/novaspirit/Alpine_xfce4_noVNC/workflows/Docker/badge.svg) 
![Docker Pulls](https://img.shields.io/docker/pulls/novaspirit/alpine_xfce4_novnc)
![Docker Size](https://img.shields.io/docker/image-size/novaspirit/alpine_xfce4_novnc)

![preview](preview.png?raw=true "preview")

</div>

#### Updates

v0.1.2 removed password requirement for noVNC

v0.1.1 added firefox pulseaudio and audio support

v0.1.0 initial code

#### Build Image

```sh
git clone https://github.com/novaspirit/Alpine_xfce4_noVNC.git
docker build -t alpine-xfce4 Alpine_xfce4_noVNC/
```

#### Run Image

```sh
docker run -it -p 6080:6080 -p 56780:56780 --name alpine-novnc alpine-xfce4
```

#### Connect With noVNC

Use modern browswer to connect to http://(docker ip):6080/vnc.html

the predefined password is `alpine`

#### LICENCE

MIT
