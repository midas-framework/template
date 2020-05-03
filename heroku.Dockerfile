FROM erlang:22.3.2

RUN wget -c https://github.com/gleam-lang/gleam/releases/download/v0.8.0-rc1/gleam-v0.8.0-rc1-linux-amd64.tar.gz -O - | tar -xz -C /bin

RUN mkdir -p /opt/app
WORKDIR /opt/app
