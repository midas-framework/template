FROM rust:1.43.0 AS build

RUN cargo install diesel_cli --no-default-features --features postgres

CMD ["diesel","migration","run"]
