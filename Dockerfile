#
# Chrome with Extension Dockerfile
#
# https://github.com/ghilead/chrome
#

# Pull base image.
FROM dockerfile/ubuntu-desktop

RUN mkdir /etc/opt/chrome && \
    mkdir /etc/opt/chrome/policies && \
    mkdir /etc/opt/chrome/policies/managed

COPY chrome.json /etc/opt/chrome/policies/managed/
ENV USER root
RUN mkdir /root/.vnc
COPY passwd /root/.vnc/

# Install Chromium.
RUN \
 wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
 echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
 apt-get update && \
 apt-get install -y google-chrome-stable && \
 rm -rf /var/lib/apt/lists/*

ENV DISPLAY :1

# Define working directory.
WORKDIR /data

# Define default command.

CMD (vncserver :1 -geometry 1280x800 -depth 24) && \ 
    (google-chrome-stable --disable-webgl --no-sandbox --user-data-dir=/data/.chrome &) && \
    (google-chrome-stable --disable-webgl --no-sandbox --user-data-dir=/data/.chrome &) && \
    bash


# Expose ports.
EXPOSE 5901


