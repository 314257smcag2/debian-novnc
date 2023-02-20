FROM debian:bookworm

RUN set -ex; \
    apt update; \
    apt install -y \
        bash \
        fluxbox \
        git \
        net-tools \
        novnc \
        supervisor \
        x11vnc \
        xterm \
        xvfb

ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768

RUN 
COPY . /app
CMD ["cd app && chmod a+x * && entrypoint.sh"]
EXPOSE 8088
