#
# Run phamtomjs 2.5.0-beta on Ubuntu 16.04 with Docker
# Use tenxcloud mirror and mirror.163.com mirror sources.listX
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

# Define default command.
CMD ["/bin/phantomjs", "-v"]
