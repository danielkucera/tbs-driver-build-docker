# tbs-driver-build-docker

Docker environment for testing and building original tbs linux drivers on various ubuntu linux kernel.

## Usage
```
git clone https://github.com/danielkucera/tbs-driver-build-docker.git
# edit variables in Dockerfile if needed (kernel or driver version)
docker build tbs-driver-build-docker -t tbs
docker run tbs cat drivers.tar > drivers.tar
```
now you have compiled drivers in drivers.tar
