FROM registry.gitlab.com/gnuwget/build-images:buildenv-alpine

ADD /wget2 /wget2
WORKDIR /wget2

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

RUN ./bootstrap
RUN ./configure
RUN make -j$(nproc)
RUN make install

RUN mkdir -p /data
WORKDIR /data

ENTRYPOINT ["wget2"]
