# Docker image for CE-FORTRAN

## Purpose

The [CE-Fortran website](https://www.ce-fortran.com/installation-linux/) wants to install numerous programs, and executes a Linux script as root. 
This Docker image is meant to isolate and stabilize that environment, and should be portable across
multiple operating system, as long as [Docker](https://docker.com) is available.

## Build

```
wget $(cat SRC.txt)
docker build  .
```

The resulting docker image can be uploaded to [Docker Hub](https://hub.docker.com/), if desired, Find the image ID, this will also have been the output of the `docker build` command.

```
...
Removing intermediate container cb12e70b0154
 ---> 52e8f83a14f8
Successfully built 52e8f83a14f8
```

or list your images:

```
docker images 
```
output:
```
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
<none>              <none>              52e8f83a14f8        25 seconds ago      665MB
<none>              <none>              fb095c3f9ade        31 minutes ago      670MB
<none>              <none>              a919483dbe22        34 minutes ago      107MB
```

Now you can upload it. Set the `TAG` and `IMAGEID` accordingly.

```
TAG=1.0
IMAGEID=52e8f83a14f8
MYHUBID=larsvilhuber
docker tag $IMAGEID $MYHUBID/ce-fortran:$TAG
docker tag $IMAGEID $MYHUBID/ce-fortran:latest
docker push $MYHUBID/ce-fortran
```

## Using the image

If using the pre-built image on [Docker Hub](https://hub.docker.com/repository/docker/larsvilhuber/ce-fortran):

```
docker run -it -rm larsvilhuber/ce-fortran
```

If using the image you just created:

```
docker run -it --rm larsvilhuber/ce-fortran
```

You can now start to compile code.
