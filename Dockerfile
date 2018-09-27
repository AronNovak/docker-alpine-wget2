FROM registry.gitlab.com/gnuwget/build-images:buildenv-alpine

ADD /wget2 /wget2
WORKDIR /wget2

RUN ./bootstrap
RUN ./configure
RUN make -j$(nproc)
RUN make install

RUN mkdir -p /data
WORKDIR /data

ENTRYPOINT ["wget2"]