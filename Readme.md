## Run phamtomjs 2.5.0-beta on Ubuntu 16.04 with Docker


## Build

`docker build -t phantomjs-ubuntu .`

## Run

```bash
docker run --rm  -p 8910:8910 phantomjs-ubuntu /bin/phantomjs --webdriver=8910
docker run -d -p 8910:8910 phantomjs-ubuntu phantomjs --webdriver=8910
# or
docker run --rm  -it phantomjs-ubuntu /bin/bash
phantomjs /bin/loader.js http://192.168.21.126:3000/composing?id=263
# or
docker run --rm phantomjs-ubuntu phantomjs /bin/loader.js 'http://192.168.21.126:3000/composing?id=263'
```

## Clean / Reclaim disk

```bash
brew update
brew install docker-clean

docker-clean all
rm -rf ~/Library/Containers/com.docker.docker/Data/*


docker run -rm -it phantomjs-ubuntu /bin/bash
```