# Pharo on a Docker image

## Linux

Disable access control on X server:

```
xhost +
```

Luego, para levantar Pharo:

```
docker run -e DISPLAY=$DISPLAY \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           --rm -it leoditommaso/pharo ./pharo-ui Pharo
```

## Mac
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

```
docker run -e DISPLAY=YOUR_IP_ADDRESS:0 \
           --rm -it leoditommaso/pharo ./pharo-ui Pharo
```

Replace YOUR_IP_ADDRESS with your machine's IP address.

