FROM rust:1.43.0 AS build

ENV GLEAM_VERSION="master"

RUN set -xe \
        && curl -fSL -o gleam-src.tar.gz "https://github.com/gleam-lang/gleam/archive/${GLEAM_VERSION}.tar.gz" \
        && mkdir -p /usr/src/gleam-src \
        && tar -xzf gleam-src.tar.gz -C /usr/src/gleam-src --strip-components=1 \
        && rm gleam-src.tar.gz \
        && cd /usr/src/gleam-src \
        && make install \
        && rm -rf /usr/src/gleam-src

FROM erlang:22.3.2
COPY --from=build /usr/local/cargo/bin/gleam /bin
RUN gleam --version

RUN mkdir -p /opt/app
WORKDIR /opt/app

CMD ["gleam"]
