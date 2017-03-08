#
# Ubuntu Phantomjs 2.5.0 beta Dockerfile
# Use tenxcloud mirror and 163 mirror sources.listX
#

# Pull base image.
FROM ubuntu:16.04

# update sources.list
COPY sources.list /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
  apt-utils \
&& rm -rf /var/lib/apt/lists/*

# Install runtime & fonts
RUN apt-get update && apt-get install -y \
  libfontconfig \
  libfreetype6-dev \
  libjpeg-dev \
  libssl-dev \
  libxslt-dev \
  libhyphen-dev \
  fonts-arphic-uming \
&& rm -rf /var/lib/apt/lists/*


# Set the locale
RUN locale-gen zh_CN.UTF-8
ENV LANG zh_CN.UTF-8
ENV LANGUAGE LANGUAGE=zh_CN:zh:en_US:en
ENV LC_ALL zh_CN.UTF-8

# Install.
COPY ./bin/* /bin/

EXPOSE 8910

# build
# docker build -t phantomjs-ubuntu .

# run
# docker run --rm  -p 8910:8910 phantomjs-ubuntu /bin/phantomjs --webdriver=8910
# docker run -d -p 8910:8910 phantomjs-ubuntu phantomjs --webdriver=8910
# or
# docker run --rm  -it phantomjs-ubuntu /bin/bash
# phantomjs /bin/loader.js http://192.168.21.126:3000/composing?id=263


# Define default command.
CMD ["/bin/phantomjs", "-v"]
