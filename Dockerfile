FROM debian:buster

# Install git, supervisor, VNC, & X11 packages

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y  mate-desktop-environment gedit bash fluxbox git net-tools novnc supervisor x11vnc xterm xvfb

# Setup demo environment variables
ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768 \
    RUN_XTERM=yes \
    RUN_FLUXBOX=yes
COPY . /app
CMD ["/app/entrypoint.sh"]
EXPOSE 8080
