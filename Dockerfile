FROM registry.gitlab.com/gnuwget/build-images:buildenv-alpine

RUN wget https://gnuwget.gitlab.io/wget2/wget2-latest.tar.gz
RUN tar xf wget2-latest.tar.gz
RUN rm wget2-latest.tar.gz
RUN mv wget2-* wget2

WORKDIR wget2

RUN ./configure
RUN make -j$(nproc)
RUN make install

RUN mkdir -p /data
WORKDIR /data

ENTRYPOINT ["wget2"]
