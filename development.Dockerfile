FROM rust:1.43.0 AS build

RUN cargo install diesel_cli --no-default-features --features postgres

FROM gleamlang/gleam

COPY --from=build /usr/local/cargo/bin/diesel /bin
RUN diesel --version

CMD ["bash", "-c", "rebar3 upgrade && rebar3 release && _build/default/rel/hello_world/bin/hello_world foreground"]
