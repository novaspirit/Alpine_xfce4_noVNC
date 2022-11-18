FROM alpine:latest

ARG password=alpine
ARG user=alpine

LABEL maintainer="Don <novaspirit@novaspirit.com>"

RUN apk add --no-cache sudo git xfce4 faenza-icon-theme bash python3 tigervnc xfce4-terminal\
    && adduser -h /home/$user -s /bin/bash -S -D $user \
    && echo -e "${password}\n${password}" | passwd $user \
    && echo '${user} ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && git clone https://github.com/novnc/noVNC /opt/noVNC \
    && git clone https://github.com/novnc/websockify /opt/noVNC/utils/websockify

USER $user
WORKDIR /home/$user

RUN mkdir -p /home/$user/.vnc \
    && echo -e "#!/bin/bash\nstartxfce4 &" > /home/$user/.vnc/xstartup \
    && echo -e "${password}\n${password}\nn\n" | vncpasswd

COPY entry.sh /entry.sh

CMD [ "/bin/bash", "/entry.sh" ]
