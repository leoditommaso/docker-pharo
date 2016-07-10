# Docker Pharo

Run Pharo on any Docker enabled system (ideal to execute Pharo easily on 64 bits
operating systems).

## Table of contents

* [Quick start guide](#quick-start-guide)
* [A (not much) more detailed explanation](#a-not-much-more-detailed-explanation)
  * [Running on Linux](running-on-linux)
  * [Running on Mac](running-on-mac)
* [Authors](#authors)

## Quick start guide

To get up and running quickly, on Linux, copy and paste the following lines:

```
mkdir $HOME/pharo
xhost +SI:localuser:root
docker run -e DISPLAY=$DISPLAY \
           -v $HOME/pharo:/data \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           --rm -it leoditommaso/pharo
```

## A (not much) more detailed explanation

There's no need to clone this repo to run the container, as it is an automated
build on Docker Hub.

### Pharo data

Pharo image and produced data will be saved in a Docker volume. For that matter,
you should create a folder where you would like to save all your work. For the
usage examples below, we will be using $HOME/pharo but you could choose any
location you prefer. Have in mind that the folder you use must exist on your
system.

### Running on Linux

Enable access for root user to X server:

```
xhost +SI:localuser:root
```

Then, to run Pharo, execute:

```
docker run -e DISPLAY=$DISPLAY \
           -v $HOME/pharo:/data \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           --rm -it leoditommaso/pharo
```

### Running on Mac

To run Pharo on Mac, you need to install socat and XQuartz.

```
brew install socat
brew cask install xquartz
```

Then, run socat so XQuartz will listen in port 6000. Be aware that this could
expose your XQuartz server to your entire network and even Internet, so you
should use a firewall in case that is a problem.

```
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
```

After that, execute the container:

```
docker run -e DISPLAY=YOUR_IP_ADDRESS:0 \
           -v $HOME/pharo:/data \
           --rm -it leoditommaso/pharo
```

Replace YOUR_IP_ADDRESS with your machine's IP address.

## Authors

* Author:: Leandro Di Tommaso (<leandro.ditommaso@mikroways.net>)
