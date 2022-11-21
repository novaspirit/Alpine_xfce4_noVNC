FROM alpine:latest


LABEL maintainer="Don <novaspirit@novaspirit.com>"

RUN apk add --no-cache openssl sudo git xfce4 faenza-icon-theme bash python3 tigervnc xfce4-terminal firefox cmake wget \
    pulseaudio xfce4-pulseaudio-plugin pavucontrol pulseaudio-alsa alsa-plugins-pulse alsa-lib-dev nodejs npm \
    build-base \
    && adduser -h /home/alpine -s /bin/bash -S -D alpine && echo -e "alpine\nalpine" | passwd alpine \
    && echo 'alpine ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && git clone https://github.com/novnc/noVNC /opt/noVNC \
    && git clone https://github.com/novnc/websockify /opt/noVNC/utils/websockify \
    && wget https://raw.githubusercontent.com/novaspirit/Alpine_xfce4_noVNC/dev/script.js -O /opt/noVNC/script.js \
    && wget https://raw.githubusercontent.com/novaspirit/Alpine_xfce4_noVNC/dev/audify.js -O /opt/noVNC/audify.js \
    && wget https://raw.githubusercontent.com/novaspirit/Alpine_xfce4_noVNC/dev/vnc.html -O /opt/noVNC/index.html \
    && wget https://raw.githubusercontent.com/novaspirit/Alpine_xfce4_noVNC/dev/pcm-player.js -O /opt/noVNC/pcm-player.js

RUN npm install --prefix /opt/noVNC ws
RUN npm install --prefix /opt/noVNC audify

USER root


RUN echo $'\0#!/bin/bash\n\
ls .X99-lock >> /dev/null 2>&1 && rm -rf /tmp/.X99-lock & \n\
sleep 1 \n\
sudo mkdir -p /home/alpine/.vnc & \n\
sleep 1 \n\
echo "SecurityTypes=None" | sudo tee -a /home/alpine/.vnc/config \n\
sleep 1 \n\
echo -e "#!/bin/bash\nstartxfce4 &" | sudo tee -a /home/alpine/.vnc/xstartup & \n\
sleep 1 \n\
/usr/bin/vncserver :99 2>&1 | sed  "s/^/[Xtigervnc ] /" & \n\
sleep 1 \n\
/usr/bin/pulseaudio 2>&1 | sed  "s/^/[pulseaudio] /" & \n\
sleep 1 \n\
/usr/bin/node /opt/noVNC/audify.js 2>&1 | sed "s/^/[audify    ] /" & \n\
/opt/noVNC/utils/novnc_proxy --vnc localhost:5999 2>&1 | sed "s/^/[noVNC     ] /"'\
>/entry.sh

USER alpine
#RUN openssl req -new -x509 -subj "/C=US/ST=/L=/O=none/OU=Org/CN=" -days 365 -nodes -out self.pem -keyout /home/alpine/self.pem

ENTRYPOINT [ "/bin/bash", "/entry.sh" ]