# Docker Pharo

Ejecutá Pahro en cualquier sistema con Docker (ideal para correr Docker
fácilmente en sistemas operativos de 64 bits).

This README is also [available in English](README.md).

## Tabla de contenidos

* [Guía de inicio rápido](#guia-de-inicio-rapido)
* [Una explicación (no mucho) más
  detallada](#una-explicacion-no-mucho-mas-detallada)
  * [En Linux](en-linux)
  * [En Mac](en-mac)
* [Autores](#autores)

## Guía de inicio rápido

Para ejecutar Pharo en Linux rápidamente, copiar y pegar las siguientes líneas:

```
mkdir $HOME/pharo
xhost +SI:localuser:root
docker run -e DISPLAY=$DISPLAY \
           -v $HOME/pharo:/data \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           --rm -it leoditommaso/pharo
```

## Una explicación (no mucho) más detallada

No es necesario clonar este repositorio para ejecutar el contenedor, dado que
está automatizado en Docker Hub.

### Datos de Pharo

La imagen de Pharo y los datos generados se guardarán en un volumen de Docker.
Por ese motivo, se recomienda crear una carpeta donde guardar todo el trabajo.
Para los ejemplos que se dan a continuación se usará la carpeta $HOME/pharo,
pero se puede utilizar cualquier otra ubicación. Tener en cuenta que la carpeta
que se use debe existir en el sistema.

### En Linux

Habilitar el acceso al usuario root al servidor de las X:

```
xhost +SI:localuser:root
```

Luego, para correr Pharo, ejecutar:

```
docker run -e DISPLAY=$DISPLAY \
           -v $HOME/pharo:/data \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           --rm -it leoditommaso/pharo
```

### En Mac

Para ejecutar Pharo en Mac es necesario instalar socat y XQuartz.

```
brew install socat
brew cask install xquartz
```

Luego, correr socat de manera que XQuartz escuche en el puerto 6000. Tener en
cuenta que esto puede exponer el servidor de XQuartz en toda la red e incluso en
Internet, con lo que debería utilizarse un firewall.

```
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
```

Luego, ejecutar el contenedor:

```
docker run -e DISPLAY=TU_DIRECCION_IP:0 \
           -v $HOME/pharo:/data \
           --rm -it leoditommaso/pharo
```

Reemplazar TU_DIRECCION_IP con la dirección IP de la máquina.

## Autores

* Autor:: Leandro Di Tommaso (<leandro.ditommaso@mikroways.net>)

