Docker wrapper for wget2. So you don't have to mess up with your host system.

## Run

```
docker run --rm arongizra/wget2-alpine [options...]
```

For example, downloading in multiple threads and put the downloaded content in current working directory: (the working dirctory in container is `/data`)

```
docker run -v $PWD:/data --rm arongizra/wget2-alpine --chunk-size=1M --max-threads=4 $YOUR_URL
```

(Docker seems to have problems when thread number is greater than the core number of docker machine)

Get help:

```
docker run --rm arongizra/wget2-alpine -h
```

## Build

Build only if you want. Docker will automatically pull images, so the above command works just off-the-shelf.

```
docker-compose build
```

## Release

This note is only for myself:

```
docker push arongizra/wget2-alpine
```

## Versioning concept

Bulding the docker image always compiles the latest wget2. Docker Hub is used to freeze a specific version.
