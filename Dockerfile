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

RUN cargo install diesel_cli --no-default-features --features postgres
RUN ls 

FROM erlang:22.3.2
COPY --from=build /usr/local/cargo/bin/gleam /bin
RUN gleam --version

COPY --from=build /usr/local/cargo/bin/diesel /bin
RUN diesel --version

RUN mkdir -p /opt/app
WORKDIR /opt/app

CMD ["gleam"]
# diesel --database-url postgres://postgres:postgres@127.0.0.1:5432/postgres  setup
