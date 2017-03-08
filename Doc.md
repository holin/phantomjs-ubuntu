brew update
brew install docker-clean

docker-clean all
rm -rf ~/Library/Containers/com.docker.docker/Data/*


docker run -rm -it phantomjs-ubuntu /bin/bash
