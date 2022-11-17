FROM alpine:latest

LABEL maintainer="Don <novaspirit@novaspirit.com>"

RUN apk add --no-cache sudo git xfce4 faenza-icon-theme bash python3 tigervnc xfce4-terminal firefox cmake wget \
    pulseaudio xfce4-pulseaudio-plugin pavucontrol pulseaudio-alsa alsa-plugins-pulse alsa-lib-dev nodejs npm \
    && adduser -h /home/alpine -s /bin/bash -S -D alpine && echo -e "alpine\nalpine" | passwd alpine \
    && echo 'alpine ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && npm install audify \
    && npm install ws \
    && git clone https://github.com/novnc/noVNC /opt/noVNC \
    && git clone https://github.com/novnc/websockify /opt/noVNC/utils/websockify \
    && wget https://raw.githubusercontent.com/novaspirit/Alpine_xfce4_noVNC/dev/script.js -O /opt/noVNC/script.js \
    && wget https://raw.githubusercontent.com/novaspirit/Alpine_xfce4_noVNC/dev/audify.js -O /opt/noVNC/audify.js \
    && wget https://raw.githubusercontent.com/novaspirit/Alpine_xfce4_noVNC/dev/vnc.html -O /opt/noVNC/vnc.html \

USER alpine
WORKDIR /home/alpine

RUN mkdir -p /home/alpine/.vnc \
    && echo -e "#!/bin/bash\nstartxfce4 &" > /home/alpine/.vnc/xstartup \
    && echo -e "alpine\nalpine\nn\n" | vncpasswd


RUN echo '\n\
#!/bin/bash\n\
/usr/bin/vncserver :99 2>&1 | sed  "s/^/[Xtigervnc ] /" & \n\
/usr/bin/pulseaudio -d & \n\
/usr/bin/node /opt/noVNC/audify.js 2>&1 | sed "s/^/[audify    ] /" & \n\
/opt/noVNC/utils/novnc_proxy --vnc localhost:5999 2>&1 | sed "s/^/[noVNC     ] /"\
>/entry.sh

ENTRYPOINT [ "/bin/bash", "/entry.sh" ]
