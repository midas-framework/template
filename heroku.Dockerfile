FROM erlang:22.3.2

RUN wget -c https://github.com/gleam-lang/gleam/releases/download/v0.7.1/gleam-v0.7.1-linux-amd64.tar.gz -O - | tar -xz -C /bin
